import 'dart:developer';

import 'package:dio/dio.dart';

class ApiServices {
  Dio dio= Dio();
  Future<Response> getProducts() async{
    var response = await dio.get('https://jsonkeeper.com/b/YIDG');
    // log(response.data.toString());
  return response;
  }
}