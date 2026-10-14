
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }

  Map<String, dynamic> toJson() => {"userId":userId, "id":id, "title":title, "body":body};

}

final post = Post.fromJson({
  "userId": 1,
  "id": 10,
  "title": "Holy Diver",
  "body": "1983"
});

final map = post.toJson();

void main(){
  print("${post.title} \n$map");
}