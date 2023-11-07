import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:temp/dict.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Dict>> searchNaver() async {
    const requestUrl = 'https://openapi.naver.com/v1/search/encyc.json';
    List<Dict> dict = [];
    http.Response response =
        await http.get(Uri.parse('$requestUrl?query=테스트'), headers: {
      'X-Naver-Client-Id': dotenv.env['Client_ID']!,
      'X-Naver-Client-Secret': dotenv.env['Client_Secret']!,
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> content = json.decode(response.body);
      List<dynamic> data = List.from(content['items']).toList();
      List<String> title = data.map((e) {
        String title = e['title'];
        title = title.replaceAll('</b>', '');
        title = title.replaceAll('<b>', '');
        return title;
      }).toList();

      List<String> description = data.map((e) {
        String description = e['description'];
        description = description.replaceAll('</b>', '');
        description = description.replaceAll('<b>', '');
        return description;
      }).toList();

      for (var i in data) {
        dict.add(Dict.fromJson(i));
      }
    } else {
      throw Error();
    }
    return dict;
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
