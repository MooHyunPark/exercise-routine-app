import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//final baseUrl = "http://192.168.0.88:8080"; // 박무현
final baseUrl = "http://192.168.219.109:8080"; // 박무현
//final baseUrl = "http://192.168.0.65:8080"; // 송승현
//final baseUrl = "http://192.168.0.88:8080"; // 박무현
// final baseUrl = "http://192.168.0.87:8080"; // 김인범
// final baseUrl = "http://192.168.0.42:8080"; // 조세은
//final baseUrl = "http://192.168.0.40:8080"; // 이나겸

//로그인 되면, dio에 jwt 추가하기
final dio = Dio(
  BaseOptions(
    baseUrl: baseUrl, // 내 IP 입력
    contentType: "application/json; charset=utf-8",
    validateStatus: (status) => true, // 200 이 아니어도 예외 발생안하게 설정
  ),
);

const secureStorage = FlutterSecureStorage();
