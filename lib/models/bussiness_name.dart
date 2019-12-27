class BussinessName {
  final int id;
  final String name;
  final bool isLiked;

  BussinessName({this.id, this.name, this.isLiked});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isLike': isLiked ? 1 : 0,
    };
  }

  factory BussinessName.fromJson(Map<String, dynamic> json) {
    return BussinessName(
        id: json['definition'],
        name: json['example'],
        isLiked: json['isLiked'] == 1 ? true : false);
  }
}
