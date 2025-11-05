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
