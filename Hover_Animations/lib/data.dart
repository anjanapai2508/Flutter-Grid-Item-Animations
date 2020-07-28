class Data {
  String initial;
  String image;
  String imageName;

  Data(this.initial, this.image, this.imageName);

  static List<Data> getTestData() {
    List<Data> dataToDisplay = [];
    dataToDisplay.add(new Data("N", "new-york.jpg", "New York"));
    dataToDisplay.add(new Data("J", "japan.jpg", "Japan"));
    dataToDisplay.add(new Data("P", "paris.jpg", "Paris"));
    dataToDisplay.add(new Data("I", "italy.jpg", "Italy"));
    return dataToDisplay;
  }
}
