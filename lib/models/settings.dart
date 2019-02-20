import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
// To parse this JSON data, do
//
//     final settings = settingsFromJson(jsonString);

Settings settingsFromJson(String str) {
  final jsonData = json.decode(str);
  return Settings.fromJson(jsonData);
}

String settingsToJson(Settings data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Settings {
  String settingsId;

  Settings({
    this.settingsId,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => new Settings(
        settingsId: json["settingsId"],
      );

  Map<String, dynamic> toJson() => {
        "settingsId": settingsId,
      };

  factory Settings.fromDocument(DocumentSnapshot doc) {
    return Settings.fromJson(doc.data);
  }
}
