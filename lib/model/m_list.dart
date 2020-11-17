class ListModel {
  String image, title, subtitle, content1, content2;

  ListModel(
      {this.image, this.title, this.subtitle, this.content1, this.content2});

  String setImage(String s) {
    return image = s;
  }

  String setTitle(String s) {
    return title = s;
  }

  String setSubtitle(String s) {
    return subtitle = s;
  }

  String setContent1(String s) {
    return content1 = s;
  }

  String setContent2(String s) {
    return content2 = s;
  }
}

List<ListModel> getList() {
  List<ListModel> list = new List<ListModel>();
  ListModel listss = new ListModel();

  //0
  listss.setImage("assets/images/masker.jpg");
  listss.setTitle(
      "Yuk mengenal jenis masker rekomendasi terbaru WHO untuk melawan virus corona");
  listss.setSubtitle(
      "Berikut merupakan tipe dan klasifikasi masker yang perlu diketahui oleh masyarkat umum berdasarkan panduan dari Badan Nasional Penanggulangan Bencana (BNPB).");
  listss.setContent1("1. Masker Kain\n"
      "Masker kain dapat digunakan untuk mencegah penularan sekaligus mengantisipasi kelangkaan masker yang terjadi di pasar seperto apotek dan toko-toko kesehatan."
      "\n\n"
      "Masker kain yang dibuat perlu memiliki 3 (tiga) lapisan yaitu lapisan non-anyaman tahan air (depan), microfibre melt-blown kain non-anyaman (tengah), dan kain biasa non-tenunan (belakang)."
      "\n\n"
      "Masker kain perlu dicuci dan dapat dipakai berkali-kali. Bahan yang digunakan untuk masker kain berupa bahan kain katun, scarf, dan sebagainya.");
  listss.setContent2("2. Masker Bedah 2(Surgical Mask 2 Ply)\n"
      "Masker bedah 2 Ply alias urgical Mask 2 Ply ini, hanya terdiri dari 2 lapisan (layers) yaitu lapisan luar dan lapisan dalam tanpa lapisan tengah yang berfungsi sebagai filter."
      "\n\n"
      "Karena mudah tembus jensi masker ini tidak direkomendasikan untuk dipakai oleh tenaga medis di fasilitas layanan kesehatan, apalagi mengani pasien yang terpapar virus corona Covid-19.");
  list.add(listss);

  //1
  listss = new ListModel();
  listss.setImage("assets/images/masker_2.jpg");
  listss.setTitle("3 Manfaat Memakai Masker Saat Bepergian");
  listss.setSubtitle(
      "Manfaat memakai masker saat bepergian tentunya harus segera disadari oleh pengendara kendaraan bermotor. Asap kendaraan yang bertebaran dimana-mana bisa memberikan banyak sekali dampak buruk bagi kesehatan.");
  listss.setContent1("1. Menjaga Paru-paru Terhindar dari Polusi\n"
      "Dengan memakai masker, kamu bisa melindungi paru-paru kamu dari udara kotor yang bertebaran di sekitar. Masker bisa menyaring udara kotor yang kamu hirup sebelum masuk ke hidung. Polusi yang berbahaya dapat disaring dan menempel di salah satu lapisan masker dan menjaga udara yang dihirup hidung tetap bersih.");
  listss.setContent2("2. Mencegah Penularan Penyakit\n"
      "Orang-orang yang sedang mengalami masalah kesehatan seperti flu dan batuk sangat dianjurkan untuk memakai masker. Karena virus flu sangat mudah menular kemana-mana melalui udara. Jadi bila kamu sudah memakai masker ketika sedang flu, maka kamu sudah mencegah penularan yang terjadi kepada orang lain."
      "\n\n"
      "3. Mencegah Wajah Terpapar Sinar Matahari yang Berlebihan.\n"
      "Ketika kamu memakai masker, otomatis kamu sudah menutupi sebagian wajahmu. Mulai dari hidung dan mulut yang paling utama, hingga dagu dan pipi. Dari fakta ini bisa disimpulkan bahwa masker tidak hanya melindungi kamu dari paparan polusi udara yang dihirup, tetapi juga bisa mencegah wajah terkena paparan sinar matahai yang berlebihan pada wajah.");
  list.add(listss);

  //2
  listss = new ListModel();
  listss.setImage("assets/images/covid-19.jpg");
  listss.setTitle("Apa itu COVID-19 (Coronavirus)");
  listss.setSubtitle(
      "Coronavirus adalah kumpulan virus yang bisa menginfeksi sistem pernapasan.");
  listss.setContent1(
      "Coronavirus adalah kumpulan virus yang bisa menginfeksi sistem pernapasan. Pada banyak kasus, virus ini hanya menyebabkan infeksi pernapasan ringan, seperti flu. Namun, virus ini juga bisa menyebabkan infeksi pernapasan berat, seperti infeksi paru-paru (pneumonia).");
  listss.setContent2(
      "Selain virus SARS-CoV-2 atau virus Corona, virus yang juga termasuk dalam kelompok ini adalah virus penyebab Severe Acute Respiratory Syndrome (SARS) dan virus penyebab Middle-East Respiratory Syndrome (MERS). Meski disebabkan oleh virus dari kelompok yang sama, yaitu coronavirus, COVID-19 memiliki beberapa perbedaan dengan SARS dan MERS, antara lain dalam hal kecepatan penyebaran dan keparahan gejala.");
  list.add(listss);

  // //3
  // listss = new ListModel();
  // listss.setImage("assets/images/logo-copy.png");
  // listss.setTitle("Title Four");
  // listss.setSubtitle("Subtitle Four Subtitle Four Subtitle Four Subtitle Four Subtitle Four Subtitle Four");
  // listss.setContent1("Content Four Content Four Content Four Content Four Content Four Content Four");
  // listss.setContent2("Content Four Content Four Content Four Content Four Content Four Content Four");
  // list.add(listss);

  // //4
  // listss = new ListModel();
  // listss.setImage("assets/images/logo-copy.png");
  // listss.setTitle("Title Five");
  // listss.setSubtitle("Subtitle Five Subtitle Five Subtitle Five Subtitle Five Subtitle Five Subtitle Five");
  // listss.setContent1("Content Five Content Five Content Five Content Five Content Five Content Five");
  // listss.setContent2("Content Five Content Five Content Five Content Five Content Five Content Five");
  // list.add(listss);

  return list;
}
