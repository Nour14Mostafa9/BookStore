import 'package:dartz/dartz.dart';
import 'package:design_pattern/core/error/failure.dart';

import '../entities/book.dart';
import '../repositories/book_repo.dart';

class FavouriteBooks {
  final BookRepository repository;

  FavouriteBooks(this.repository);


  Future<Either<Failure,Unit>> call(Book book)async{
    return await repository.favBooks(book);
  }

}