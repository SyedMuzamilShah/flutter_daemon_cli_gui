class RemoteTodoModel {
  final String userId;
  final String id;
  final String title;
  final bool completed;
  const RemoteTodoModel(this.userId, this.id, this.title, this.completed);

  factory RemoteTodoModel.fromJson(Map<String, dynamic> json) {
    return RemoteTodoModel(
      json['userId'].toString(),
      json['id'].toString(),
      json['title'],
      json['completed'],
    );
  }
}