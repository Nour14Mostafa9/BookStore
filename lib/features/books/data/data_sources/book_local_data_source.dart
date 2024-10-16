import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:design_pattern/core/error/exceptions.dart';
import 'package:design_pattern/features/books/data/models/book_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BookLocalDataSource {
  Future<List<BookModel>> getCachedBooks();
  Future<Unit> addFavBooks(BookModel book);
}


class BookLocalImp implements BookLocalDataSource{

  SharedPreferences preferences ;

  BookLocalImp(this.preferences);

  @override
  Future<Unit> addFavBooks(BookModel book) async {
    final bookJson = book.toJson();
    final existingBooksString = preferences.getString("CachedBooks") ?? '[]';
    final existingBooks = List<Map<String, dynamic>>.from(json.decode(existingBooksString));

    bool bookExists = existingBooks.any((b) => b['id'] == book.title);

    if (!bookExists) {
      existingBooks.add(bookJson);

      await preferences.setString("CachedBooks", json.encode(existingBooks));
    }

    return unit;
  }


  @override
  Future<List<BookModel>> getCachedBooks() async {
    try {
      final cachedBooksJson = preferences.getString("CachedBooks");
      print("Retrieved books from cache: $cachedBooksJson");

      if (cachedBooksJson != null && cachedBooksJson.isNotEmpty) {
        List<dynamic> jsonList = json.decode(cachedBooksJson);
        List<BookModel> jsonToBooks = jsonList.map<BookModel>((jsonMap) => BookModel.fromJsonLocal(jsonMap)).toList();
        print("Books from cache: $jsonToBooks");
        return jsonToBooks;
      } else {
        return [];
      }
    } catch (e) {
      print("Error occurred: $e");
      throw CacheException();
    }
  }


}