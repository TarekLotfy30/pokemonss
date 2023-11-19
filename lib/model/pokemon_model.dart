class Pokemon {
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  List<String>? weaknesses;

  Pokemon({
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.weaknesses,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    weaknesses = json['weaknesses'].cast<String>();
  }
}
