class PostingModel {
  // String id,
  String image, title, subtitle, content1, content2;

  //BUAT CONSTRUCTOR AGAR KETIKA CLASS INI DILOAD, MAKA DATA YANG DIMINTA HARUS DIPASSING SESUAI TIPE DATA YANG DITETAPKAN
  PostingModel(
      {
      // this.id,
      this.image,
      this.title,
      this.subtitle,
      this.content1,
      this.content2});

  //FUNGSI INI UNTUK MENGUBAH FORMAT DATA DARI JSON KE FORMAT YANG SESUAI DENGAN EMPLOYEE MODEL
  factory PostingModel.fromJson(Map<String, dynamic> json) => PostingModel(
      // id: json['id'],
      image: json['image'],
      title: json['title'],
      subtitle: json['subtitle'],
      content1: json['content1'],
      content2: json['content2']);
}
