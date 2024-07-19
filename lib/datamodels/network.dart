// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'network.g.dart';

@HiveType(typeId: 2) // Adjust typeId if needed
class Network extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? logoPath;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String? originCountry;

  Network({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json['id'] as int,
        logoPath: json['logo_path'] as String,
        name: json['name'] as String,
        originCountry: json['origin_country'] as String,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'logoPath': logoPath,
      'name': name,
      'originCountry': originCountry,
    };
  }

  factory Network.fromMap(Map<String, dynamic> map) {
    return Network(
      id: map['id'] as int,
      logoPath: map['logoPath'] as String,
      name: map['name'] as String,
      originCountry: map['originCountry'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  // factory Network.fromJson(String source) => Network.fromMap(json.decode(source) as Map<String, dynamic>);
}
