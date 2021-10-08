final String imageAssetsRoot = "images/";
final String logo = _getImagePath("logo.png");

final String inster = _getImagePath("inster.png");
final String facebook = _getImagePath("fb.png");
final String twitter = _getImagePath("twitter.png");

String _getImagePath(String fileName){
  return imageAssetsRoot + fileName;
}