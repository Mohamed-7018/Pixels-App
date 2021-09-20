class TrackModel {
  String logo;
  String description;
  String name;
  List videos;
  List courses;
  List books;

  TrackModel({
    this.name,
    this.description,
    this.logo,
    this.videos,
    this.courses,
    this.books,
  });

  factory TrackModel.fromJson(dynamic json) {
    return TrackModel(
      name: "${json['name']}",
      description: "${json['description']}",
      logo: "${json['logo']}",
      videos: json['videos'],
      courses: json['courses'],
      books: json['books'],
    );
  }

  Map toJson() => {
        "name": name,
        "description": description,
        "logo": logo,
        "videos": videos,
        "courses": courses,
        "books": books,
      };
}
