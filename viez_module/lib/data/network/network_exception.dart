import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../common/utils/network_utils.dart';

class NetworkException {
  final String? message;
  final String? errorCode;
  final int? statusCode;

  const NetworkException({
    this.message,
    this.errorCode,
    this.statusCode,
  });

  @override
  String toString() {
    return 'NetworkException{message: $message, errorCode: $errorCode, statusCode: $statusCode}';
  }

  static NetworkException handleResponse(int statusCode) {
    switch (statusCode) {
      case 400:
        return const NetworkException(message: "Bad Request");
      case 401:
        return const NetworkException(message: "Unauthorized");
      case 403:
        return const NetworkException(message: "Forbidden");
      case 404:
        return const NetworkException(message: "Not Found");
      case 409:
        return const NetworkException(message: "Error due to a conflict");
      case 408:
        return const NetworkException(message: "Request Timeout");
      case 500:
        return const NetworkException(message: "Internal Server Error");
      case 502:
        return const NetworkException(message: "Bad Gateway");
      case 503:
        return const NetworkException(message: "Service Unavailable");
      default:
        return NetworkException(message: "Received invalid status code: $statusCode");
    }
  }

  static Future<NetworkException> getNetworkException(error) async {
    var isNetworkAvailable = await NetworkUtils.isNetworkAvailable();
    if (!isNetworkAvailable) {
      return const NetworkException(message: "không có kết nối Internet");
    }
    if (error is NetworkException) return error;
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              return const NetworkException(message: "Request Cancelled");
            case DioErrorType.connectTimeout:
              return const NetworkException(message: "Connection request timeout");
            case DioErrorType.other:
              return NetworkException(message: error.error.toString());
            case DioErrorType.sendTimeout:
              return const NetworkException(message: "Send timeout in connection with API server");
            case DioErrorType.response:
              if (error.error.toString().contains("XMLHttpRequest")) {
                return const NetworkException(message: "Connection Failed");
              } else {
                return NetworkException.handleResponse(
                    error.response!.statusCode!);
              }
            case DioErrorType.receiveTimeout:
              return const NetworkException(message: "Receive timeout in connection with API server");
          }
        } else if (error is SocketException) {
          return const NetworkException(message: "Không có kết nối mạng");
        } else {
          return const NetworkException(message: "Unexpected error occurred");
        }
      } on FormatException catch (e) {
        debugPrint(e.toString());
        return const NetworkException(message: "Format Exception");
      } catch (_) {
        return const NetworkException(message: "Unexpected error occurred");
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkException(message: "Unable to process the data");
      } else {
        return const NetworkException(message: "Unexpected error occurred");
      }
    }
  }
}