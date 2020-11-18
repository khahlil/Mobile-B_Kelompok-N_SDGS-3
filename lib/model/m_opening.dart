class OpeningModel {
  String imageAssetPath, title, desc;

  OpeningModel({this.imageAssetPath, this.title, this.desc});

  String setImageAssetPath(String s) {
    return imageAssetPath = s;
  }

  String setTitle(String s) {
    return title = s;
  }

  String setDesc(String s) {
    return desc = s;
  }
}

List<OpeningModel> getSlides() {
  List<OpeningModel> slides = new List<OpeningModel>();
  OpeningModel sliderModel = new OpeningModel();

  //1
  sliderModel.setImageAssetPath("assets/images/gambar3.png");
  sliderModel.setTitle("Enemy");
  sliderModel.setDesc("Ayo bersama kita lawan virus Covid-19");
  slides.add(sliderModel);

  //2
  sliderModel = new OpeningModel();
  sliderModel.setImageAssetPath("assets/images/gambar5.png");
  sliderModel.setTitle("Wear Mask");
  sliderModel.setDesc("Jangan lupa pakai masker kemanapun anda pergi, supaya tidak terjangkit virus Covid-19");
  slides.add(sliderModel);

  //3
  sliderModel = new OpeningModel();
  sliderModel.setImageAssetPath("assets/images/gambar4.png");
  sliderModel.setTitle("Time");
  sliderModel.setDesc("Jangan lupa selalu mengganti masker anda dengan masker yang baru dan pastinya bersih");
  slides.add(sliderModel);

  return slides;
}
