class SentimentResponse {
  final String sentiment;
  final String emoji;
  final String slangMeaning;
  final String example;
  final String link;
  final String error;

  SentimentResponse({
    required this.sentiment,
    required this.emoji,
    required this.slangMeaning,
    required this.example,
    required this.link,
    required this.error,
  });

  factory SentimentResponse.fromJson(Map<String, dynamic> json) {
    return SentimentResponse(
      sentiment: json['Sentiment'],
      emoji: json['Emoji'],
      slangMeaning: json['Slang Meaning'],
      example: json['Example'],
      link: json['Link'],
      error: json['error'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Sentiment': sentiment,
      'Emoji': emoji,
      'Slang Meaning': slangMeaning,
      'Example': example,
      'Link': link,
      'error': error,
    };
  }
}
