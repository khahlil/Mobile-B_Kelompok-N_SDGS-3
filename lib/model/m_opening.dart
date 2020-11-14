class OpeningModel{
  String imageAssetPath, title, desc;

  OpeningModel({this.imageAssetPath,this.title,this.desc});

  String setImageAssetPath(String s){
    return imageAssetPath = s;
  }

  String setTitle(String s){
    return title = s;
  }

  String setDesc(String s){
    return desc = s;
  }
}


List<OpeningModel> getSlides(){
  List<OpeningModel> slides = new List<OpeningModel>();
  OpeningModel sliderModel = new OpeningModel();

  //1
  sliderModel.setImageAssetPath("assets/images/illustration.png");
  sliderModel.setTitle("Search");
  sliderModel.setDesc("Discover Restaurants offering the best fast food near you on Foodwalk");
  slides.add(sliderModel);

  //2
  sliderModel = new OpeningModel();
  sliderModel.setImageAssetPath("assets/images/illustration2.png");
  sliderModel.setTitle("Order");
  sliderModel.setDesc("Our veggie plan is filled with delicious seasonal vegetables, whole grains, beautiful cheeses and vegetarian proteins");
  slides.add(sliderModel);

  //3
  sliderModel = new OpeningModel();
  sliderModel.setImageAssetPath("assets/images/illustration3.png");
  sliderModel.setTitle("Eat");
  sliderModel.setDesc("Food delivery or pickup from local restaurants, Explore restaurants that deliver near you.");
  slides.add(sliderModel);

  return slides;
}
