#!/bin/bash
# QwenPaw FPK 打包脚本（参考 Hermes 风格）
# 用法: bash build.sh
#   环境变量：
#     SKIP_FRONTEND=1   跳过前端构建（使用现有 app/www/）

set -e

PROJ_DIR="$(cd "$(dirname "$0")" && pwd)"
STAGE="$PROJ_DIR/build/staging"
VERSION=$(grep '^version' "$PROJ_DIR/manifest" | awk -F'=' '{print $2}' | tr -d ' ')
OUTPUT="$PROJ_DIR/com.dustinky.qwenpaw_v${VERSION}.fpk"

# 颜色
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}===== QwenPaw FPK v${VERSION} 打包 =====${NC}"

# [0a/6] 版本号 SSOT 同步（manifest -> README badge）
echo "[0a/6] 版本号 SSOT 同步 ..."
python3 "$PROJ_DIR/scripts/sync-version.py" || {
  echo -e "${RED}ERROR: 版本号同步失败${NC}"
  exit 1
}

# [0b/6] AUDIT_REPORT 自动生成
echo "[0b/6] AUDIT_REPORT 自动生成 ..."
python3 "$PROJ_DIR/scripts/gen-audit.py" || echo -e "${YELLOW}  警告：AUDIT_REPORT 生成失败（非致命）${NC}"

# [0c/6] preflight 一致性门禁
echo "[0c/6] preflight 一致性门禁 ..."
bash "$PROJ_DIR/scripts/preflight.sh" || {
  echo -e "${RED}ERROR: preflight 失败，请修复上述问题后重试${NC}"
  exit 1
}

# [1/6] 构建前端 UI（Vue 3 + Vite + Nuxt UI）— bun 优先
if [ "${SKIP_FRONTEND:-0}" = "1" ]; then
  echo "[1/6] 构建前端 UI ... 跳过（SKIP_FRONTEND=1）"
else
  echo "[1/6] 构建前端 UI ..."
  cd "$PROJ_DIR/ui-fndesign"

  if command -v bun >/dev/null 2>&1; then
    echo "  使用 Bun 工具链"
    bun install --ignore-scripts
    bun run build
  elif command -v pnpm >/dev/null 2>&1; then
    echo -e "${YELLOW}  未找到 bun，回退到 pnpm${NC}"
    pnpm install --frozen-lockfile --ignore-scripts || pnpm install --ignore-scripts
    pnpm build
  elif command -v npm >/dev/null 2>&1; then
    echo -e "${YELLOW}  未找到 bun/pnpm，回退到 npm${NC}"
    if [ -f package-lock.json ]; then npm ci --ignore-scripts; else npm install --ignore-scripts; fi
    npm run build
  else
    echo -e "${RED}ERROR: 未找到 bun / pnpm / npm，无法构建前端${NC}"
    exit 1
  fi

  rm -rf "$PROJ_DIR/app/www"
  mkdir -p "$PROJ_DIR/app/www"
  cp -a dist/. "$PROJ_DIR/app/www/"
  cd "$PROJ_DIR"
fi

# [2/6] 准备 staging（瘦身核心：仅打包运行时必需文件）
echo "[2/6] 准备 staging ..."
rm -rf "$STAGE"
mkdir -p "$STAGE"

# 用 tar 复制大部分文件（排除 app/qwenpaw/code，后面手动精简复制）
tar -cf - -C "$PROJ_DIR" \
  --exclude='build' \
  --exclude='app/qwenpaw/code' \
  --exclude='ui-fndesign/node_modules' \
  --exclude='ui-fndesign/dist' \
  --exclude='ui-fndesign/.turbo' \
  --exclude='.git' \
  --exclude='.github' \
  --exclude='scripts' \
  --exclude='AUDIT_REPORT.md' \
  --exclude='*.fpk' \
  --exclude='*.sha256' \
  . | tar -xf - -C "$STAGE"

# 手动复制精简后的 app/qwenpaw/code（仅 src/ + plugins/）
echo "  瘦身 app/qwenpaw/code（仅 src/ + plugins/）..."
mkdir -p "$STAGE/app/qwenpaw/code"
cp -a "$PROJ_DIR/app/qwenpaw/code/src" "$STAGE/app/qwenpaw/code/"
cp -a "$PROJ_DIR/app/qwenpaw/code/plugins" "$STAGE/app/qwenpaw/code/"
# 保留 LICENSE 和上游 setup 必需的最小文件（pip install -e 需要 pyproject.toml/setup.py）
[ -f "$PROJ_DIR/app/qwenpaw/code/pyproject.toml" ] && cp "$PROJ_DIR/app/qwenpaw/code/pyproject.toml" "$STAGE/app/qwenpaw/code/"
[ -f "$PROJ_DIR/app/qwenpaw/code/setup.py" ] && cp "$PROJ_DIR/app/qwenpaw/code/setup.py" "$STAGE/app/qwenpaw/code/"
[ -f "$PROJ_DIR/app/qwenpaw/code/LICENSE" ] && cp "$PROJ_DIR/app/qwenpaw/code/LICENSE" "$STAGE/app/qwenpaw/code/"

# 删 staging 中不该进 fpk 的文件
rm -rf "$STAGE/ui-fndesign"   # 前端源码不进 fpk，只要构建产物

# [3/6] fnpack 构建
echo "[3/6] fnpack 构建 ..."
cd "$STAGE"
fnpack build -d .

# [4/6] 产物处理（命名版本号）
echo "[4/6] 产物处理 ..."
FPK_IN_STAGE=$(ls "$STAGE"/*.fpk 2>/dev/null | head -1)
if [ -z "$FPK_IN_STAGE" ] || [ ! -f "$FPK_IN_STAGE" ]; then
  echo -e "${RED}ERROR: fnpack 产物未找到${NC}"
  exit 1
fi
mv "$FPK_IN_STAGE" "$OUTPUT"

# [5/6] 计算 SHA256
echo "[5/6] 计算 SHA256 ..."
cd "$PROJ_DIR"
sha256sum "$(basename "$OUTPUT")" > "${OUTPUT}.sha256"

# [6/6] 完成
echo ""
echo -e "${GREEN}===== 打包完成 =====${NC}"
echo "输出: $OUTPUT"
ls -lh "$OUTPUT"
echo ""
echo "SHA256:"
cat "${OUTPUT}.sha256"
