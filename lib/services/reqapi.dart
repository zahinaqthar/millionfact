class Source {
  final String id, name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}

class Artcicle {
  Source source;
  String author, title, description, url, urlToImage, publishedAt, content;

  Artcicle(
      {required this.author,
      required this.source,
      required this.title,
      required this.content,
      required this.description,
      required this.publishedAt,
      required this.url,
      required this.urlToImage});

  factory Artcicle.fromJson(Map<String, dynamic> json) {
    return Artcicle(
        title: json['title'] as String,
        content: json['content'] as String,
        description: json['description'] as String,
        publishedAt: json['publishedAt'] as String,
        url: json['url'] as String,
        urlToImage: json['urlToImage'] as String,
        author: json['author'] as String,
        source: Source.fromJson(json['source']));
  }
}
