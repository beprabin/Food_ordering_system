import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  List<String> existingitemcart;

  Post({
    required this.existingitemcart,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        existingitemcart: json["existingitemcart"],
      );

  Map<String, dynamic> toJson() => {
        "existingitemcart": existingitemcart,
      };
}
