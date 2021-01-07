class PostingModel {
  String image, title, subtitle, content1, content2;

  PostingModel(
      {this.image, this.title, this.subtitle, this.content1, this.content2});

  factory PostingModel.fromJson(Map<String, dynamic> json) => PostingModel(
      image: json['image'],
      title: json['title'],
      subtitle: json['subtitle'],
      content1: json['content1'],
      content2: json['content2']);
}
