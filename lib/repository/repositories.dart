import 'dart:convert';
import 'package:http/http.dart';

import '../models/character_model.dart';

class CharacterRepository {
  String baseUrl = "https://rickandmortyapi.com/api/character";
  int currentPage = 4;

  Future<List<CharacterModel>> getCharacters() async {
    String url = "$baseUrl?page=$currentPage";
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List result = data['results'];

      // Check if there are more pages available
      if (data['info']['next'] != null) {
        currentPage++;
      }

      return result.map((e) => CharacterModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
