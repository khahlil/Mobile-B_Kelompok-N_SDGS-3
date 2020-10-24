class OpeningModel{

  String imageAssetPath;
  String title;
  String desc;

  OpeningModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<OpeningModel> getSlides(){

  List<OpeningModel> slides = new List<OpeningModel>();
  OpeningModel sliderModel = new OpeningModel();

  //1
  sliderModel.setDesc("Discover Restaurants offering the best fast food near you on Foodwalk");
  sliderModel.setTitle("Search");
  sliderModel.setImageAssetPath("assets/images/illustration.png");
  slides.add(sliderModel);

  sliderModel = new OpeningModel();

  //2
  sliderModel.setDesc("Our veggie plan is filled with delicious seasonal vegetables, whole grains, beautiful cheeses and vegetarian proteins");
  sliderModel.setTitle("Order");
  sliderModel.setImageAssetPath("assets/images/illustration2.png");
  slides.add(sliderModel);

  sliderModel = new OpeningModel();

  //3
  sliderModel.setDesc("Food delivery or pickup from local restaurants, Explore restaurants that deliver near you.");
  sliderModel.setTitle("Eat");
  sliderModel.setImageAssetPath("assets/images/illustration3.png");
  slides.add(sliderModel);

  sliderModel = new OpeningModel();

  return slides;
}
