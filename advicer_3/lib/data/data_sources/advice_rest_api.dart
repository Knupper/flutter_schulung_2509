import 'dart:convert';

import 'package:advicer_3/data/dtos/advice_dto.dart';
import 'package:advicer_3/data/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;
class AdviceRestApi {
  AdviceRestApi({required this.client});
  final http.Client client;

  Future<AdviceDto> readById({required String id}) async {
    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice/$id'),
      headers: {
        'accept': 'application/json',
      },
    );

    if(response.statusCode != 200){
      throw ServerException();
    } else {
      final responseBody = jsonDecode(response.body);
      return AdviceDto.fromJson(responseBody);
    }
  }

  Future<AdviceDto> read() async{
    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
      headers: {
        'accept': 'application/json',
      },
    );

    if(response.statusCode != 200){
      throw ServerException();
    } else {
      final responseBody = jsonDecode(response.body);
      return AdviceDto.fromJson(responseBody);
    }
  }
}