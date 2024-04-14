import 'dart:convert';
import 'package:http/http.dart';

class CharacterRepository {
  String url = "https://rickandmortyapi.com/api/character";
  getCharacters() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['results'];
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
