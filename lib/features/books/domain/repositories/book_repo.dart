import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:design_pattern/core/error/failure.dart';

import '../entities/book.dart';

abstract class BookRepository {
  Future<Either<Failure,List<Book>>> getBooks();
  Future<Either<Failure,List<Book>>> getFavBooks();
  Future<Either<Failure,Unit>> favBooks(Book book);


}