class Quote {
  final String text;
  final String author;

  Quote({
    required this.text,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['text'] ?? json['q'] ?? '',
      author: json['author'] ?? json['a'] ?? 'Bilinmeyen',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'author': author,
    };
  }
} 