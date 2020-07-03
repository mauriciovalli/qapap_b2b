class AnyImage {
  int id;
  String title;
  String src;
  String alt;

  AnyImage({
    this.id,
    this.title,
    this.src,
    this.alt,
  });

  AnyImage.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        src = json['src'],
        alt = json['alt'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'src': src,
        'alt': alt,
      };
}
