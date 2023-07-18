class Autogenerated {
  String status;
  int? totalResults;
  List<Articles> articles;

  Autogenerated(this.status, this.totalResults, this.articles);

  factory Autogenerated.fromJson(Map<String, dynamic> json) {
    final status = json['status'] as String;
    final totalResults = json['totalResults'] as int;
    final List<Articles> articles = [];
    if (json['articles'] != null) {
      json['articles'].forEach((v) {
        articles.add(Articles.fromJson(v));
      });
    }
    return Autogenerated(status, totalResults, articles);
  }
}

class Articles {
  Source source;
  dynamic author;
  dynamic title;
  dynamic description;
  dynamic url;
  dynamic urlToImage;
  dynamic publishedAt;
  dynamic content;

  Articles(
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  );

  factory Articles.fromJson(Map<String, dynamic> json) {
    final source = Source.fromJson(json['source']);
    final author = json['author'] as dynamic;
    final title = json['title'] as dynamic;
    final description = json['description'] as dynamic;
    final url = json['url'] as dynamic;
    final urlToImage = json['urlToImage'] as dynamic;
    final publishedAt = json['publishedAt'] as dynamic;
    final content = json['content'] as dynamic;
    return Articles(
         source, author, title, description, url, urlToImage, publishedAt, content);
  }
}

class Source {
  String? id = '';
  String? name = '';
  Source(this.id, this.name);
  factory Source.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String?;
    final name = json['name'] as String?;
    return Source(id, name);
  }
}