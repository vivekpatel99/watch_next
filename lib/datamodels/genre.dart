// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json['id'] as int,
        name: json['name'] as String,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Genre.fromMap(Map<String, dynamic> map) {
    return Genre(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  // factory Genre.fromJson(String source) => Genre.fromMap(json.decode(source) as Map<String, dynamic>);
}
