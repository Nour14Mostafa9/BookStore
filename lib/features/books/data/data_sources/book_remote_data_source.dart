import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:design_pattern/core/api/end_point.dart';
import 'package:design_pattern/core/error/exceptions.dart';
import 'package:design_pattern/features/books/data/models/book_model.dart';
import 'package:http/http.dart' as http;


abstract class BookRemoteDataSource {
  Future<List<BookModel>> getBooks(String subject);
}

class BookRemoteImpWithHttp implements BookRemoteDataSource{
  http.Client client;


  BookRemoteImpWithHttp({required this.client});

  @override
  Future<List<BookModel>> getBooks(String subject) async {
    try {
      print(Uri.parse('${EndPoint.baseUrl}${EndPoint.endPoint}')
          .replace(queryParameters: {
        'q': 'subject:adventure',
        'key': EndPoint.apiKey,
      }).toString());
      final response = await client.get(
        Uri.parse('${EndPoint.baseUrl}${EndPoint.endPoint}')
            .replace(queryParameters: {
          'q': 'subject:${subject}',
          'key': EndPoint.apiKey,
        }),

      );


      if (response.statusCode == 200) {
        print("object");
        final Map<String, dynamic> decodedData = json.decode(response.body);
        final List jsonDecoded = decodedData['items'] as List;
        final List<BookModel> bookModels = jsonDecoded
            .map<BookModel>((jsonBookModel) => BookModel.fromJson(jsonBookModel))
            .toList();
        return bookModels;
      } else {
        throw ServerException();
      }
    } catch (e) {
      print("Error occurred: $e");
      throw ServerException();
    }
  }


}