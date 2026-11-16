# myportofolio_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Tugas 7
1. Widget tree adalah daftar widget yang ada pada suatu aplikasi dan disusun berdasarkan tingkatan (parent-child), dapat digambar seperti pohon yang bertingkat rantingnya.

Parent merupakan widget yang **membungkus** widget lain (childnya). Parent juga meneruskan informasi yang dimilikinya kepada child (melalui _context_) sehingga child bisa menggunakan atribut atribut yang dimiliki parent atau bertukar data.

2. Daftar widget yang dipakai:
- `MaterialApp`: sebagai pembungkus utama widget widget lain. Mengatur hal hal dasar tampilan seperti judul, tema warna, body halaman, dll. Letaknya ada di root widget tree. 
- `ThemeData`: mengatur style keseluruhan halaman seperti warna dan font (fokus ke style, tidak seperti `MaterialApp` keseluruhan yang mencakup judul dan body).
- `MyHomePage`: isi utama (body) dari halaman awal. ini merupakan widget yang kita buat sendiri definisinya di menu.dart.
- `Scaffold`: kerangka utama dalam satu halaman, terdiri atas widget `appBar` (bagian atas) dan body (isi).
- `AppBar`: bar judul di bagian atas halaman, tempat tulisan 'MyPortfolio' di halaman disimpan.
- `Text`: mengisi tulisan yang akan ditampilkan di `appBar` 
- `TextStyle`: memberi gaya pada tulisan 'MyPortfolio' (ketebalan dan warna)
- `Padding`: memberi jarak di sekeliling widget lain
- `Column`: menyusun child widget ke bawah
- `Row`: menyusun child widget ke samping (menyusun card NPM, Name, Class)
- `Center`: menaruh child widgetnya di tengah (tulisan 'Selamat datang di MyPortfolio Mobile!')
- `GridView.count`: menyusun widget dalam baris dan kolom (kisi)
- `SizedBox`: membuat kotak kosong dengan ukuran tertentu
- `InfoCard`: widget custom yang merupakan kartu judul dan isi
- `ItemCard`: widget custom untuk kartu tombol dan menu
- `Card`: kartu yang sudutnya membulat dan ada bayangannya
- `Container`: seperti div di html yang padding dan design lainnya bisa diatur sesuka kita
- `Material`: permukaan bergaya Material yang bisa diberi warna dan sudut
- `InkWell`: membuat widget yang ada di dalamnya bisa ditekan dan ada efek percikannya
- `Icon`: menampilkan ikon
- `SnackBar`: pesan singkat yang muncul di bawah layar

3. `MaterialApp` merupakan widget yang membungkus keseluruhan widget dalam aplikasi Flutter. Parameter parameternya seperti title, theme, home, dan routes (navigasi) merupakan bagian yang diperlukan oleh widget widget childnya. Dengan menaruhnya di puncak widget tree, semua widget childnya dapat memakai tema yang sama lewat `Theme.of(context)` seperti di `AppBar` dan `ItemCard`. Dengan kata lain, `MaterialApp` merupakan pengaturan dasar terhadap semua widget aplikasi.

4. _Stateless widget_ merupakan widget yang di dalam dirinya tidak menyimpan state, tampilannya ditentukan oleh data yang dikirim dari luar, tampilan hanya bisa berubah jika data dari luar berubah juga. Sedangkan _stateful widget_ merupakan widget yang menyimpan state di dalam dirinya, data bisa berubah selama aplikasi berjalan melalui `setState()`.

Gunakan _stateless widget_ jika tampilan hanya bergantung pada data dari luar (seperti widget `MyApp`, `MyHomePage`, `InfoCard`, dan `ItemCard`).

Gunakan _stateful widget_ jika tampilan perlu berubah saat ada kondisi tertentu yang tercapai misalnya saat ada interaksi dengan user.

5. `BuildContext` merupakan objek yang menyimpan informasi posisi suatu widget pada widget tree. Objek ini juga menyimpan informasi parent-parent widgetnya untuk kebutuhan ambil atribut, kirim data, dan sebagainya yang berhubungan dengan interaksi parent-child. Flutter menelusuri tree ke atas dari posisi _context_ sampai menemukan yang dicari. Objek ini diberikan ke fungsi build masing masing widget dalam bentuk parameter.

Contoh penggunaan: `AppBar` pada `menu.dart` menerapkan `backgroundColor: Theme.of(context).colorScheme.primary` untuk mengambil warna primary dari `MaterialApp` (parentnya).

6. - Hot reload (r) memasukkan perubahan kode ke aplikasi yang sedang berjalan. State dipertahankan, prosesnya paling cepat.
- Hot restart (R) menjalankan aplikasi dari awal (dari main()). State di-reset, prosesnya lebih lambat dari hot reload.
- Full restart: aplikasi dihentikan (q) lalu dijalankan ulang dengan flutter run, sehingga dibangun ulang dari nol.

Hot reload tidak cukup dan memerlukan hot restart ketika kita mengubah isi main() atau variabel global sehingga aplikasi perlu dijalankan ulang dari main().

Perlu full restart jika: menambah package atau aset di `pubspec.yaml`, atau mengubah pengaturan di folder platform seperti di android/ atau web/

### AI Disclosure: 
Saya menggunakan Claude Sonnet 5.5 Medium untuk memahami konsep dari pertanyaan pertanyaan yang diajukan di soal pertanyaan reflektif. Kalimat jawaban di README.md ini saya susun dengan bahasa sendiri berdasarkan penjelasan yang diberikan oleh Claude AI. Penulisan dengan font berbeda seperti `NamaWidget`, penebalan huruf seperti '**membungkus**', dan pemiringan huruf seperti '_context_' memang saya sesuaikan agar lebih enak dibaca, bukan hasil AI.

Untuk pengerjaan kode dart saya lakukan sendiri.