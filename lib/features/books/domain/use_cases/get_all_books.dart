import 'package:dartz/dartz.dart';
import 'package:design_pattern/core/error/failure.dart';

import '../entities/book.dart';
import '../repositories/book_repo.dart';

class GetAllBooks {
  final BookRepository repository;

  GetAllBooks(this.repository);


  Future<Either<Failure,List<Book>>> call(String subject)async{
     return await repository.getBooks(subject);
  }

}