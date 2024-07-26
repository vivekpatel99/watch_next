// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'created_by.g.dart';

@HiveType(typeId: 5) // Adjust typeId if needed
class CreatedBy extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String creditId;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String originalName;

  @HiveField(4)
  final int gender;

  @HiveField(5)
  final String? profilePath;

  CreatedBy({
    required this.id,
    required this.creditId,
    required this.name,
    required this.originalName,
    required this.gender,
    this.profilePath,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json['id'] as int,
        creditId: json['credit_id'] as String,
        name: json['name'] as String,
        originalName: json['original_name'] as String,
        gender: json['gender'] as int,
        profilePath: json['profile_path'] as String?,
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
