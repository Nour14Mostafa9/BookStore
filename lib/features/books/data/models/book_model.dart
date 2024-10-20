import '../../domain/entities/book.dart';

class BookModel extends Book{
  BookModel({
    required String? title,
    required String? description,
    required double averageRating,
    required String? smallThumbnail,
    required String? previewLink,
  }) : super(
    title: title,
    description: description,
    averageRating: averageRating,
    smallThumbnail: smallThumbnail,
    previewLink: previewLink,
  );


  factory BookModel.fromJson(Map<String,dynamic>json){
    return BookModel(title: json['volumeInfo']['title'],
        description: json['volumeInfo']['description'],
        averageRating: json['volumeInfo']['averageRating']?.toDouble() ?? 0.0,
        smallThumbnail:  json['volumeInfo']['imageLinks'] != null
            ? json['volumeInfo']['imageLinks']['thumbnail']
            : null,
      previewLink: json['volumeInfo']['previewLink']
    );
  }


  Map<String,dynamic>toJson(){
    return {
      'title':title,
      'description':description,
      'averageRating':averageRating,
      'thumbnail':smallThumbnail,
      'previewLink':previewLink
    };
  }


  factory BookModel.fromJsonLocal(Map<String,dynamic>json){
    return BookModel(title: json['title'],
        description: json['description'],
        averageRating: json['averageRating']?.toDouble() ?? 0.0,
        smallThumbnail: json['thumbnail'],
        previewLink: json['previewLink']
    );
  }

}