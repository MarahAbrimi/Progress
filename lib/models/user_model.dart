import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? fullName;
  String? gender;
  int? age;
  UserModel({
    this.id,
    this.fullName,
    this.gender,
    this.age
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'gender': gender,
      'age': age,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      gender: json['gender'] as String?,
      age: json['age'] as int?,
    );
  }

  factory UserModel.fromMap(String id, Map<String, dynamic> data) {
    final UserModel userModel = UserModel.fromJson(data);
    userModel.id = id;
    return userModel;
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel.fromJson(data);
  }
}
