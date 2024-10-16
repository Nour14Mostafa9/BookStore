import 'package:equatable/equatable.dart';

class Book extends Equatable{
  final String? title;
  final String? description;
  final double averageRating;
  final String? smallThumbnail;
  final String? previewLink;

  Book({ required this.title,required this.description, required this.averageRating, required this.smallThumbnail,required this.previewLink});

  List<Object?> get props => [title,description,smallThumbnail,previewLink];

}