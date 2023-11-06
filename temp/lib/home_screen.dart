import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> searchNaver() async {
    const requestUrl = 'https://openapi.naver.com/v1/search/encyc.json';

    try {
      http.Response response =
          await http.get(Uri.parse('$requestUrl?query=테스트'), headers: {
        'X-Naver-Client-Id': dotenv.env['Client_ID']!,
        'X-Naver-Client-Secret': dotenv.env['Client_Secret']!,
      });
      print(response.body);
      if (response.statusCode != 200) {
        print('error');
      }
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: searchNaver,
              icon: const Icon(Icons.favorite_outline_rounded))
        ],
        title: const Text(
          'title',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: const Text(''),
    );
  }
}
