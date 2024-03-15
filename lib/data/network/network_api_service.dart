import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:Dozer/data/network/api_exceptions.dart';
import 'package:Dozer/data/network/base_api_service.dart';
import 'package:Dozer/utils%20-%20Copy/get_storage_helper.dart';
import 'package:Dozer/utils%20-%20Copy/logger.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization':
          //     "Bearer ${GetStorageHelper.getValue(GetStorageKeys.keyToken) ?? ""}",
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBlNTFlMzkxLThiYjItNGIwNy1iMDc3LWE4NWU5MTMwNTA3NyIsImlhdCI6MTcwNjM4MzkwNCwiZXhwIjoxNzE0MTU5OTA0fQ.sdMNBsmp9V1wSyE_sNrtCwCz_aMW-bZ9Xyqh6j0stq8'
        },
      );
      Logger.log('STATUS CODE: ${response.statusCode}');
      Logger.log('RESPONSE BODY: ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('');
    } on RequestTimeoutException {
      throw RequestTimeoutException('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postResponse(
    String url,
    Map<String, dynamic> jsonBody,
  ) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(jsonBody),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization':
              "Bearer ${GetStorageHelper.getValue(GetStorageKeys.keyToken) ?? ""}",
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Please Try Again..');
        },
      );
      Logger.log('STATUS CODE: ${response.statusCode}');
      Logger.log('RESPONSE BODY: ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('');
    } on RequestTimeoutException {
      throw RequestTimeoutException('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> putResponse(
    String url,
    Map<String, dynamic> jsonBody,
  ) async {
    dynamic responseJson;
    try {
      final response = await http.put(
        Uri.parse(url),
        body: jsonEncode(jsonBody),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization':
              "Bearer ${GetStorageHelper.getValue(GetStorageKeys.keyToken) ?? ""}",
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Please Try Again..');
        },
      );
      Logger.log('STATUS CODE: ${response.statusCode}');
      Logger.log('RESPONSE BODY: ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('');
    } on RequestTimeoutException {
      throw RequestTimeoutException('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> patchResponse(
    String url,
    Map<String, dynamic> jsonBody,
  ) async {
    dynamic responseJson;
    try {
      final response = await http.patch(
        Uri.parse(url),
        body: jsonEncode(jsonBody),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization':
              "Bearer ${GetStorageHelper.getValue(GetStorageKeys.keyToken) ?? ""}",
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Please Try Again..');
        },
      );
      Logger.log('STATUS CODE: ${response.statusCode}');
      Logger.log('RESPONSE BODY: ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('');
    } on RequestTimeoutException {
      throw RequestTimeoutException('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> deleteResponse(
    String url,
  ) async {
    dynamic responseJson;
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization':
              "Bearer ${GetStorageHelper.getValue(GetStorageKeys.keyToken) ?? ""}",
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Please Try Again..');
        },
      );
      Logger.log('STATUS CODE: ${response.statusCode}');
      Logger.log('RESPONSE BODY: ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('');
    } on RequestTimeoutException {
      throw RequestTimeoutException('');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        final dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 204:
        final dynamic responseJson = response.body;
        return responseJson;
      case 400:
        throw BadRequestException('Please Check Again..');
      case 401:
        throw UnauthorizedException(
          (jsonDecode(response.body) as Map<String, dynamic>)['detail']
              as String,
        );
      case 403:
        throw UnauthorisedRequestException('Please Try Again..');
      case 404:
        throw UnauthorisedRequestException('Please Try Again..');
      case 500:
        throw ServerException('Error occurred while communication with server');
      default:
        throw DefaultException(
          (jsonDecode(response.body) as Map<String, dynamic>)['detail']
              .toString(),
        );
    }
  }
  
  jsonEncode(Map<String, dynamic> jsonBody) {}
}
