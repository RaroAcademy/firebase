import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String email;
  final String cpf;
  final FieldValue createData;
  final String uid;
  final String phone;

  UserData({
    required this.email,
    required this.cpf,
    required this.createData,
    required this.uid,
    required this.phone,
  });

  UserData copyWith({
    String? email,
    String? cpf,
    FieldValue? createData,
    String? uid,
    String? phone,
  }) {
    return UserData(
      email: email ?? this.email,
      cpf: cpf ?? this.cpf,
      createData: createData ?? this.createData,
      uid: uid ?? this.uid,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'cpf': cpf,
      'createData': createData,
      'uid': uid,
      'phone': phone,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      email: map['email'],
      cpf: map['cpf'],
      createData: map['createData'],
      uid: map['uid'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserData(email: $email, cpf: $cpf, createData: $createData, uid: $uid, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserData &&
        other.email == email &&
        other.cpf == cpf &&
        other.createData == createData &&
        other.uid == uid &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        cpf.hashCode ^
        createData.hashCode ^
        uid.hashCode ^
        phone.hashCode;
  }
}
