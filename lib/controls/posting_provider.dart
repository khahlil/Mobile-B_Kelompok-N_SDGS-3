import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:e_Masker/models/m_posting.dart';

class PostingProvider extends ChangeNotifier {
  List<PostingModel> _data = [];
  List<PostingModel> get dataPosting => _data;

  Future<List<PostingModel>> getPosting() async {
    final url = 'http://localhost/quotes/home/json';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result =
          json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      _data = result
          .map<PostingModel>((json) => PostingModel.fromJson(json))
          .toList();
      return _data;
    } else {
      throw Exception();
    }
  }
}
