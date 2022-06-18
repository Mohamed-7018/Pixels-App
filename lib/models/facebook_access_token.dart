class FaceBookGraphAPI {
  String url;


  FaceBookGraphAPI({
    this.url,

  });

  factory FaceBookGraphAPI.fromJson(dynamic json) {
    return FaceBookGraphAPI(
      url: "${json['url']}",
    );
  }

  Map toJson() => {
    "name": url,
  };
}
