# Portofolio Mobile menggunakan Flutter

### Tugas 8
1. `push()` menambahkan route baru di atas stack, sehingga route lama tetap ada di bawahnya dan user bisa kembali. `pushReplacement()` mengganti route teratas dengan route baru, jadi route teratas lama hilang dari stack. `pop()` membuang route teratas dan kembali ke route di bawahnya.
   
    Untuk membuka formulir dari action card saya memakai `Navigator.push()` ke `ExperienceFormPage`, sehingga tombol Back bawaan device/browser bisa kembali lagi ke halaman utama. Opsi Home di drawer memakai `pushReplacement()` ke `MyHomePage` agar halaman formulir yang sedang tampil diganti dengan halaman utama, sehingga pengguna kembali ke beranda.

2. `Scaffold` menyediakan kerangka halaman (AppBar, drawer, body) yang sama di setiap halaman, sehingga strukturnya konsisten. Selain itu, `LeftDrawer` dibuat sebagai widget terpisah di `lib/widgets/` dan dipakai ulang di halaman utama dan halaman formulir, jadi navigasi selalu sama. Contoh penggunaan warna tema di lebih dari satu halaman: `Theme.of(context).colorScheme.primary` dipakai sebagai warna AppBar di halaman utama dan halaman formulir, sehingga keduanya otomatis seragam dan berubah bersamaan jika tema di `main.dart` diganti. Selain itu, `LeftDrawer` yang sama (header `Colors.indigo`) tampil di kedua halaman.

3. Formulir disusun dengan `Form` > `SingleChildScrollView` > `Column`, dengan setiap field dibungkus `Padding` (`EdgeInsets.all(8.0)`) agar ada jarak antarfield dan dari samping layar. `Column` sendiri tidak bisa di-scroll, sehingga pada layar sempit atau saat papan ketik tampil konten akan overflow. `SingleChildScrollView` membuat seluruh field dan tombol Simpan tetap bisa dijangkau dengan di-_scroll_. Masalah overflow yang sama juga terjadi di halaman utama setelah kartu bertambah, dan saya selesaikan dengan `SingleChildScrollView` pula.

4. `GlobalKey<FormState>` dipasang pada `Form` agar tombol Simpan bisa mengakses state form dari luar field. Tiap `validator` mengembalikan pesan error jika isian tidak sesuai aturan, atau `null` jika valid. Saat Simpan ditekan, `validate()` menjalankan semua validator sekaligus, menampilkan pesan error di kolom yang bermasalah, dan mengembalikan `true` hanya jika semuanya lolos, sehingga dialog baru muncul setelah itu.

   Contoh nilai yang ditolak: Organisasi yang hanya berisi spasi, atau Tanggal Selesai yang lebih awal dari Tanggal Mulai. Jenis input atau papan ketik saja tidak cukup karena tidak mencegah spasi kosong, nilai yang di-_paste_, maupun hubungan antarfield. Date picker memperbolehkan memilih tanggal apa pun secara terpisah, jadi urutan tanggal tetap perlu dicek oleh validator.

### AI Disclosure: 
Saya menggunakan Claude Sonnet 5.5 Medium untuk membantu pengerjaan tugas ini. 
- Strategi pengerjaan: saya upload PDF tugas 8 ke Claude, lalu meminta poin poin apa saja yang penting untuk saya kerjakan (tutorial 9 saya baca ulang sendiri sambil menerapkan pola yang sama pada tugas ini). Untuk setiap tahap yang saya lakukan, saya meminta Claude untuk membuat pesan conventional commit yang pas agar rapi juga di GitHub.
- Bagian yang dibantu AI: cara membuat inputan menggunakan kalender di field Tanggal Mulai dan Tanggal Selesai, lalu bagian dropdown di field Jenis Kegiatan. Sisanya saya mengikuti sendiri sesuai pola tutorial 9 dan jika ada line error saya juga minta Claude untuk mem-_fix_ nya.

note: Penulisan dengan font berbeda seperti `NamaWidget` dan _scroll_ di pertanyaan reflektif memang saya sesuaikan agar lebih enak dibaca, bukan hasil AI.

