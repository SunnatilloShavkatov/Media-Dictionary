class DataModel {
  String title;
  String body;
  String? image;

  DataModel({
    required this.title,
    required this.body,
    this.image,
  });
}