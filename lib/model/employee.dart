// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final String? id;
  final String? name;
  final String? role;
  final String? startDate;
  final String? endDate;
  const Employee({
    this.id,
    this.name,
    this.role,
    this.startDate,
    this.endDate,
  });

  @override
  List<Object?> get props => [id, name, role, startDate, endDate];

  Employee copyWith({
    String? id,
    String? name,
    String? role,
    String? startDate,
    String? endDate,
  }) {
    return Employee(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        role: role ?? this.role,
        name: name ?? this.name,
        id: id ?? this.id);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'role': role,
      'startDate': startDate ?? "",
      'endDate': endDate ?? "",
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'] as String,
      name: map['name'] as String,
      role: map['role'] as String,
      startDate: map['startDate'],
      endDate: map['endDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source) as Map<String, dynamic>);
}
