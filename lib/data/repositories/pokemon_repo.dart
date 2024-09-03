// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class PokemonRepo {
  PokemonRepo({required this.dio});
  final Dio dio;

  Future<Response> getResult(
      {required String name, required int currentPage}) async {
    return await dio.get(
      'character/',
      queryParameters: {
        'name': name,
        'page': currentPage,
      },
    );
  }
}
