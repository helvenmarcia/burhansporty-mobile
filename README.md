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