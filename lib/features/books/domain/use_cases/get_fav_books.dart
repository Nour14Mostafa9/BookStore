import 'package:dartz/dartz.dart';
import 'package:design_pattern/core/error/failure.dart';

import '../entities/book.dart';
import '../repositories/book_repo.dart';

class GetFavBooks {
  final BookRepository repository;

  GetFavBooks(this.repository);


  Future<Either<Failure,List<Book>>> call()async{
    return await repository.getFavBooks();
  }

}