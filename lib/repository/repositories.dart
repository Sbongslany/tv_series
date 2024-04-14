import 'dart:convert';
import 'package:http/http.dart';

import '../models/character_model.dart';

class CharacterRepository {
  String url = "https://rickandmortyapi.com/api/character";
  Future<List<CharacterModel>>getCharacters() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['results'];
      return result.map(((e) => CharacterModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
