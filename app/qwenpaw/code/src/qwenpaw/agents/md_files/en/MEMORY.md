---
summary: "Agent long-term memory — tool setup and lessons learned"
read_when:
  - Bootstrapping a workspace manually
---

## Tool Setup

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

### Python Virtual Environment

**Important:** All Python commands run in a virtual environment. Activate the virtual environment with the following command:

```bash
source /var/apps/com.dustinky.qwenpaw/home/venv/bin/activate
```

After activation, use `python3` or `pip3` to run commands. The virtual environment is already set up with all required dependencies.

### Node.js Environment

**Important:** All Node.js commands run in a virtual environment. Activate the virtual environment with the following command:

```bash
export PATH=/var/apps/nodejs_v22/target/bin:$PATH
```

After activation, use `node` or `npm` to run commands. The virtual environment is already set up with all required dependencies.

### What Goes Here

Add whatever helps you do your job. This is your cheat sheet.

Things like:

- SSH hosts and aliases
- Other user-related settings when executing skills

### Examples

```markdown
### SSH

- home-server → 192.168.1.100, user: admin
```
