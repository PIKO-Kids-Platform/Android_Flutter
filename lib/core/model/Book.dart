import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String ageRange;
  final String coverUrl;
  final String description;
  final String illustrator;
  final int pageLength;
  final String publishDate;
  final String publisher;
  final String readingTime;
  final String title;
  final String author;

  Book(
    this.ageRange,
    this.coverUrl,
    this.description,
    this.illustrator,
    this.pageLength,
    this.publishDate,
    this.publisher,
    this.readingTime,
    this.title,
    this.author,
  );

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      json['Age'],
      json['CoverURL'],
      json['Description'],
      json['Illustrator'],
      json['PageAmount'],
      json['PublishedDate'],
      json['Publisher'],
      json['ReadingTime'],
      json['Title'],
      json['Writer'],
    );
  }

  @override
  List<Object> get props => [
        this.ageRange,
        this.coverUrl,
        this.description,
        this.illustrator,
        this.pageLength,
        this.publishDate,
        this.publisher,
        this.readingTime,
        this.title,
        this.author,
      ];
  // Map<String, dynamic> toJson() => _$ExampleToJson(this);
}
