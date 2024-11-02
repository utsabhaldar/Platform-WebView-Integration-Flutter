import 'dart:convert';

class RecordModel {
  final String name;
  final String password;
  final String encryptedPassword;
  final String videoHashValue;
  RecordModel({
    required this.name,
    required this.password,
    required this.encryptedPassword,
    required this.videoHashValue,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'password': password,
      'encryptedPassword': encryptedPassword,
      'videoHashValue': videoHashValue,
    };
  }

  factory RecordModel.fromMap(Map<String, dynamic> map) {
    return RecordModel(
      name: map['name'] as String,
      password: map['password'] as String,
      encryptedPassword: map['encryptedPassword'] as String,
      videoHashValue: map['videoHashValue'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecordModel.fromJson(String source) => RecordModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
