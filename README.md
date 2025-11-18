### Tugas 7


<details>
<summary>1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.</summary>
<hr>
Widget tree merupakan struktur pohon yang menyusun tampilan aplikasi. Setiap widget berada pada posisi tertentu dan dapat memiliki widget anak di bawahnya. Hubungan parent-child membuat widget parent mengatur tata letak atau kondisi, sementara widget child menampilkan isi atau elemen lebih detail. Semua tampilan di layar sebenarnya tersusun dari widget yang saling terhubung dalam bentuk tree ini.

<hr>
</details>

<details>
<summary>2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.</summary>
<hr>
Widget yang digunakan meliputi MaterialApp sebagai pembungkus dan pengatur tema aplikasi, Scaffold sebagai struktur dasar halaman, serta AppBar untuk bagian header. Column dan Row digunakan untuk menyusun layout, Text untuk menampilkan informasi, dan GridView.count untuk menampilkan menu dalam bentuk grid. Card dan Container membentuk tampilan kartu info, sedangkan Material dan InkWell memberikan efek sentuh pada menu. Widget kustom InfoCard dan ItemCard digunakan untuk menampilkan data pengguna dan tombol menu berdasarkan data dari class ItemHomepage.

<hr>
</details>

<details>
<summary>3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.</summary>
<hr>
MaterialApp berfungsi sebagai pembungkus utama aplikasi dan mengatur tema, navigasi, serta halaman awal. Widget ini sering digunakan sebagai root karena menyediakan standar desain Material seperti warna, font, dan transisi yang membuat tampilan aplikasi terasa konsisten dan rapi.

<hr>
</details>

<details>
<summary>4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?</summary>
<hr>
StatelessWidget digunakan ketika tampilan tidak membutuhkan perubahan data secara dinamis, sehingga tampilannya tetap. StatefulWidget digunakan ketika tampilan perlu berubah berdasarkan interaksi, seperti input atau aksi pengguna. Pemilihan terjadi sesuai kebutuhan perubahan state pada halaman tersebut.

<hr>
</details>

<details>
<summary>5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?</summary>
<hr>
BuildContext adalah objek yang menyimpan informasi posisi widget di dalam widget tree. BuildContext penting karena digunakan untuk mengakses widget di atasnya, termasuk tema, ukuran layar, atau navigasi. Pada metode build, BuildContext membantu menentukan bagaimana widget tersebut ditampilkan sesuai konteksnya.

<hr>
</details>

<details>
<summary>6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".</summary>
<hr>
Hot reload memperbarui tampilan di aplikasi tanpa menghapus state, sehingga perubahan cepat terlihat tanpa kehilangan data sementara. Sedangkan hot restart menjalankan ulang aplikasi dari awal, sehingga state akan kembali ke kondisi awal seperti baru dibuka kembali.

<hr>
</details>

### Tugas 8

<details>
<summary>1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi.</summary>
<hr>
Navigator.push() digunakan untuk menambahkan halaman baru ke atas stack navigasi tanpa menghapus halaman sebelumnya, sehingga pengguna masih dapat kembali ke halaman sebelumnya menggunakan tombol back. Sementara itu, Navigator.pushReplacement() menggantikan halaman saat ini dengan halaman baru, sehingga halaman sebelumnya dihapus dari stack dan tidak dapat dikembalikan dengan tombol back. Gunakan Navigator.push() ketika ingin mempertahankan alur navigasi normal dan memungkinkan pengguna kembali, misalnya saat berpindah dari daftar ke detail. Sedangkan Navigator.pushReplacement() cocok digunakan ketika halaman sebelumnya tidak perlu diakses lagi, seperti setelah login sukses menuju halaman utama.

<hr>
</details>

<details>
<summary>2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?</summary>
<hr>
Struktur halaman yang konsisten dapat dibangun dengan menjadikan `Scaffold` sebagai kerangka utama pada setiap screen. `AppBar` digunakan untuk menampilkan elemen header yang seragam seperti judul atau action button. `Drawer` berperan sebagai menu navigasi global yang dapat diakses dari seluruh halaman. Dengan membuat widget dasar yang menyertakan `Scaffold`, `AppBar`, dan `Drawer`, setiap halaman hanya perlu mengisi bagian `body`, sehingga tampilan dan navigasi tetap konsisten di seluruh aplikasi.

<hr>
</details>

<details>
<summary>3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.</summary>
<hr>
Penggunaan Padding membantu memberi jarak antar elemen agar tampilan lebih rapi dan mudah dibaca. SingleChildScrollView memungkinkan seluruh form dapat digulir ketika konten melebihi tinggi layar, sehingga tidak terjadi overflow. ListView efektif ketika jumlah elemen form bersifat dinamis atau banyak, karena bersifat scrollable dan efisien dalam rendering. Contoh penggunaan pada halaman pendaftaran: form dibungkus dengan SingleChildScrollView, setiap input diberi Padding untuk jarak antar field, dan jika jumlah input berubah-ubah, seluruh field ditampilkan menggunakan ListView agar tetap responsif dan nyaman digunakan.

<hr>
</details>

<details>
<summary>4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?.</summary>
<hr>
Warna tiap komponen diubah sesuai dengan front-end pada aplikasi web django

<hr>
</details>

### Tugas 8

<details>
<summary>1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?</summary>
<hr>
Penggunaan model Dart diperlukan karena struktur data dari backend perlu dipetakan ke object yang memiliki tipe jelas, sehingga validasi tipe, null-safety, dan maintainability dapat terjaga. Tanpa model, penggunaan Map<String, dynamic> membuat proses parsing lebih rawan error, sulit dilacak ketika API berubah, dan meningkatkan risiko kesalahan tipe atau null yang muncul di runtime, sehingga kualitas kode menurun dan sulit dirawat.
<hr>
</details>

<details>
<summary>2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.</summary>
<hr>
Package http berfungsi sebagai alat dasar untuk melakukan request HTTP tanpa menyimpan state apa pun, cocok untuk endpoint publik atau permintaan yang tidak membutuhkan autentikasi berbasis session. Sementara itu, CookieRequest berperan sebagai request handler yang menyimpan cookie session dari Django, sehingga setiap request berikutnya dapat membawa informasi autentikasi secara otomatis. Perbedaan utamanya adalah http bersifat stateless, sedangkan CookieRequest bersifat stateful dan dirancang untuk integrasi dengan Django yang menggunakan session.
<hr>
</details>

<details>
<summary>3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.</summary>
<hr>
Instance CookieRequest perlu dibagikan ke seluruh komponen agar session yang dimiliki tetap konsisten di seluruh aplikasi. Dengan instance tunggal, seluruh halaman dapat mengakses status autentikasi yang sama dan mengirim request dengan cookie yang sama. Hal ini memastikan bahwa ketika pengguna login, seluruh bagian aplikasi dapat mengenali status tersebut tanpa harus mengulang proses atau kehilangan session.
<hr>
</details>

<details>
<summary>4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?</summary>
<hr>
Agar Flutter dapat berkomunikasi dengan Django, konfigurasi konektivitas perlu diatur dengan benar. Penambahan 10.0.2.2 pada ALLOWED_HOSTS membuka akses dari emulator Android ke server lokal Django. CORS perlu diaktifkan agar permintaan lintas-origin tidak diblokir oleh Django, sementara pengaturan SameSite dan cookie memastikan session dapat dikirim dan diterima dengan benar. Selain itu, Android memerlukan izin internet pada manifest agar aplikasi dapat melakukan request jaringan. Jika konfigurasi ini tidak dilakukan, request akan gagal karena host ditolak, cookie tidak terbaca, request diblokir CORS, atau aplikasi tidak bisa mengakses internet sama sekali.
<hr>
</details>

<details>
<summary>5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.</summary>
<hr>
Pengiriman data dari input hingga ditampilkan kembali di Flutter mengikuti alur sederhana: pengguna mengisi form, Flutter mengirim data ke Django, Django memproses dan menyimpan data, lalu mengirim respons dalam bentuk JSON. Flutter kemudian mem-parsing JSON tersebut menjadi model Dart dan memperbarui UI sehingga data dapat ditampilkan secara real-time sesuai perubahan state.
<hr>
</details>

<details>
<summary>6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.</summary>
<hr>
Proses autentikasi dimulai dari input credential di Flutter yang dikirim ke Django melalui CookieRequest. Django memvalidasi data login atau registrasi, membuat atau memperbarui session, lalu mengirim cookie session kembali. Cookie tersebut disimpan oleh CookieRequest dan digunakan untuk setiap request selanjutnya sehingga Django dapat mengenali pengguna. Setelah proses berhasil, Flutter memperbarui state aplikasi dan menampilkan menu atau halaman yang sesuai. Pada saat logout, Flutter mengirim permintaan ke Django untuk menghapus session, kemudian state lokal di Flutter dibersihkan dan aplikasi kembali ke halaman login.
<hr>
</details>

<details>
<summary>7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).</summary>
<hr>
Pertama aku pastikan Django sudah ter-deploy dengan benar di domain PBP UI. Setelah backend stabil, aku mulai mengerjakan sisi Flutter.

Langkah awal adalah membuat fitur register di Flutter. Di sini aku membangun form register, lalu menghubungkannya dengan endpoint Django menggunakan postJson() dari CookieRequest. Setelah itu aku bikin halaman login, lengkap dengan validasi dan proses autentikasi. Login dan register ini aku sesuaikan supaya ketika username/password benar, Django mengirim cookie sesi dan Flutter bisa menyimpannya lewat Provider.

Setelah autentikasi beres, aku integrasikan sistem login Django ↔ Flutter. Caranya dengan menempatkan instance CookieRequest di paling atas aplikasi (di main.dart) menggunakan Provider, biar semua page bisa akses status login dan cookie tanpa harus lempar parameter manual.

Selanjutnya aku bikin model Dart kustom (ProductEntry) supaya data dari JSON Django bisa diparse dengan aman. Model ini penting karena tanpa model, semua data bakal diperlakukan sebagai map biasa dan rawan error tipe, null, dan susah di-maintain.

Setelah model jadi, aku membuat halaman daftar produk yang mengambil data dari endpoint /json/. Di halaman ini aku menampilkan seluruh field yang diperlukan: name/title, price, description, thumbnail, category, dan is_featured. Untuk tampilan, aku bangun widget ProductEntryCard agar tiap item rapi dan konsisten.

Setelah itu aku menambahkan fitur halaman detail produk. Saat user menekan salah satu card di daftar, aku navigasikan ke halaman detail lewat Navigator.push(), sambil mengirim data lengkap dari model yang sudah di-parse. Halaman detail ini menampilkan seluruh atribut produk dan tombol kembali ke list.

Selanjutnya aku menerapkan filter item berdasarkan user yang login. Caranya dengan memanfaatkan data username dari session CookieRequest, lalu memfilter list produk di Flutter sebelum ditampilkan. Dengan begitu, halaman “My Products” hanya menampilkan item milik pengguna yang sedang login.

Untuk proses input data, aku membuat form tambah produk yang mengirim data ke Django lewat endpoint create-flutter/. Data dari form -> diproses oleh postJson() -> diterima Django -> disimpan di database -> lalu langsung muncul kembali saat halaman list melakukan fetch.

Terakhir, aku lengkapi semuanya dengan logout, memastikan cookie Django terhapus dan user diarahkan kembali ke halaman login. Setelah semua fitur selesai, aku mengupdate README, menjawab seluruh pertanyaan penjelasan, lalu melakukan add-commit-push ke GitHub.
<hr>
</details>