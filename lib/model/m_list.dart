
class ListModel {
  String image, title, subtitle, content;

  ListModel({this.image, this.title, this.subtitle, this.content});

  String setImage(String s) {
    return image = s;
  }

  String setTitle(String s) {
    return title = s;
  }

  String setSubtitle(String s) {
    return subtitle = s;
  }

  String setContent(String s) {
    return content = s;
  }
}

List<ListModel> getList() {
  List<ListModel> list = new List<ListModel>();
  ListModel listss = new ListModel();

  //0
  listss.setImage("assets/images/logo-copy.png");
  listss.setTitle("Title One");
  listss.setSubtitle("Subtitle One Subtitle One Subtitle One Subtitle One Subtitle One Subtitle One");
  listss.setContent("Content One Content One Content One Content One Content One Content One");
  list.add(listss);

  //1
  listss = new ListModel();
  listss.setImage("assets/images/logo-copy.png");
  listss.setTitle("Title Two");
  listss.setSubtitle("Subtitle Two Subtitle Two Subtitle Two Subtitle Two Subtitle Two Subtitle Two");
  listss.setContent("Content Two Content Two Content Two Content Two Content Two Content Two");
  list.add(listss);

  //2
  listss = new ListModel();
  listss.setImage("assets/images/logo-copy.png");
  listss.setTitle("Title Three");
  listss.setSubtitle("Subtitle Three subtitle Three subtitle Three subtitle Three subtitle Three subtitle Three");
  listss.setContent("Content Three Content Three Content Three Content Three Content Three Content Three");
  list.add(listss);

  // //3
  // listss = new ListModel();
  // listss.setImage("assets/images/logo-copy.png");
  // listss.setTitle("Title Four");
  // listss.setSubtitle("Subtitle Four Subtitle Four Subtitle Four Subtitle Four Subtitle Four Subtitle Four");
  // listss.setContent("Content Four Content Four Content Four Content Four Content Four Content Four");
  // list.add(listss);

  // //4
  // listss = new ListModel();
  // listss.setImage("assets/images/logo-copy.png");
  // listss.setTitle("Title Five");
  // listss.setSubtitle("Subtitle Five Subtitle Five Subtitle Five Subtitle Five Subtitle Five Subtitle Five");
  // list.add(listss);

  return list;
}
