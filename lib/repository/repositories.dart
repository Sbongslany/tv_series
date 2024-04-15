import 'dart:convert';
import 'package:http/http.dart';

import '../models/character_model.dart';

class CharacterRepository {
  String baseUrl = "https://rickandmortyapi.com/api/character";
  int currentPage = 1; // Initial page number

  Future<List<CharacterModel>> getCharacters() async {
    String url = "$baseUrl?page=$currentPage";
    Response response = await get(Uri.parse(url));// Making HTTP GET request

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);// Parsing JSON response
      final List result = data['results'];// Extracting list of characters

      // Check if there are more pages available
      if (data['info']['next'] != null) {
        currentPage++;// Incrementing page number for next request

      }

      return result.map((e) => CharacterModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
