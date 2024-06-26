class CharacterModel {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
 String? image;
  List<String>? episode;
  String? url;
  String? created;

  CharacterModel(
      {this.id,
        this.name,
        this.status,
        this.species,
        this.type,
        this.gender,
        this.origin,
        this.location,
        required this.image,
        this.episode,
        this.url,
        this.created});

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? "";
    status = json['status'] ?? "";
    species = json['species'] ?? "";
    type = json['type'] ?? "";
    gender = json['gender'] ?? "";
    origin =
    json['origin'] != null ? new Origin.fromJson(json['origin']) : null;
    location =
    json['location'] != null ? new Origin.fromJson(json['location']) : null;
    image = json['image'] ?? "";
    episode = json['episode'].cast<String>();
    url = json['url'] ?? "";
    created = json['created'] ?? "";
  }
}

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    url = json['url'] ?? "";
  }
}