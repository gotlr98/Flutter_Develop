import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  Future<void> searchNaver() async {
    const requestUrl = 'https://openapi.naver.com/v1/search/encyc.json';

    try {
      http.Response response =
          await http.get(Uri.parse('$requestUrl?query=테스트'), headers: {
        'X-Naver-Client-Id': dotenv.env['Client_ID']!,
        'X-Naver-Client-Secret': dotenv.env['Client_Secret']!,
      });
      if (response.statusCode == 200) {
        print('error');
      }
    } catch (error) {}
  }
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
