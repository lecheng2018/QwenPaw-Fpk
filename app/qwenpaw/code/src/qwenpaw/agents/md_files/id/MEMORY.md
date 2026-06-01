---
summary: "Memori jangka panjang agent — setup tool dan pelajaran yang dipelajari"
read_when:
  - Bootstrapping workspace secara manual
---

## Tool Setup

Skill mendefinisikan _cara_ tool bekerja. File ini untuk detail spesifik milikmu, yaitu hal-hal yang unik untuk setup pengguna.

### Python Virtual Environment

**Penting:** Semua perah perintah Python dijalankan di dalam lingkungan virtual. Gunakan perintah berikut untuk mengaktifkan lingkungan virtual:

```bash
source /var/apps/com.dustinky.qwenpaw/home/venv/bin/activate
```

Aktifasi setelah itu, gunakan `python3` atau `pip3` untuk menjalankan perintah. Lingkungan virtual sudah teratur untuk semua dependensi yang diperlukan.

### Node.js Environment

**Penting:** Semua perah perintah Node.js dijalankan di dalam lingkungan virtual. Gunakan perintah berikut untuk mengaktifkan lingkungan virtual:

```bash
export PATH=/var/apps/nodejs_v24/target/bin:$PATH
```

Aktifasi setelah itu, gunakan `node` atau `npm` untuk menjalankan perintah. Lingkungan virtual sudah teratur untuk semua dependensi yang diperlukan.

### Apa yang Dicatat di Sini

Tambahkan apa pun yang membantu pekerjaanmu. Anggap ini sebagai catatan cepat.

Contohnya:

- Host dan alias SSH
- Pengaturan lain terkait pengguna saat menjalankan skill

### Contoh

```markdown
### SSH

- home-server -> 192.168.1.100, user: admin
```
