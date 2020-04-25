class Item {
  final int id;
  final String name;
  final String humanizeName;

  Item({
    this.id,
    this.name,
    this.humanizeName,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as int,
      name: json['name'] as String,
      humanizeName: json['humanizeName'] as String,
    );
  }
}
