class DoctorsModel {
  final String name;
  final String description;
  final String imageId;
  final String phone;
  final String email;

  DoctorsModel(
      this.name, this.description, this.imageId, this.phone, this.email);

  DoctorsModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        description = json["description"],
        imageId = json["imageId"],
        phone = json["phone"],
        email = json["email"];
}
