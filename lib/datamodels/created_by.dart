// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CreatedBy {
  final int id;
  final String creditId;
  final String name;
  final String originalName;
  final int gender;
  final String profilePath;

  CreatedBy({
    required this.id,
    required this.creditId,
    required this.name,
    required this.originalName,
    required this.gender,
    required this.profilePath,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json['id'] as int,
        creditId: json['credit_id'] as String,
        name: json['name'] as String,
        originalName: json['original_name'] as String,
        gender: json['gender'] as int,
        profilePath: json['profile_path'] as String,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'creditId': creditId,
      'name': name,
      'originalName': originalName,
      'gender': gender,
      'profilePath': profilePath,
    };
  }

  factory CreatedBy.fromMap(Map<String, dynamic> map) {
    return CreatedBy(
      id: map['id'] as int,
      creditId: map['creditId'] as String,
      name: map['name'] as String,
      originalName: map['originalName'] as String,
      gender: map['gender'] as int,
      profilePath: map['profilePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  // factory CreatedBy.fromJson(String source) =>
  //     CreatedBy.fromMap(json.decode(source) as Map<String, dynamic>);
}
