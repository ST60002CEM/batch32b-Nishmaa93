import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kaamkuro/features/employee/domain/entity/employee_entity.dart';

final employeeApiModelProvider = Provider<EmployeeApiModel>(
  (ref) => const EmployeeApiModel.empty(),
);

@JsonSerializable()
class EmployeeApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? phone;
  final String? address;
  final String? imageUrl;

  const EmployeeApiModel({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.imageUrl,
  });
  const EmployeeApiModel.empty()
      : id = '',
        name = '',
        phone = '',
        address = '',
        imageUrl = '';

  // From Json , write full code without generator
  factory EmployeeApiModel.fromJson(Map<String, dynamic> json) {
    return EmployeeApiModel(
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      imageUrl: json['imageUrl'],
    );
  }

  // To Json , write full code without generator
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'imageUrl': imageUrl,
    };
  }

  // Convert API Object to Entity
  EmployeeEntity toEntity() => EmployeeEntity(
        id: id,
        name: name,
        phone: phone,
        address: address,
        imageUrl: imageUrl,
      );

  // Convert Entity to API Object
  EmployeeApiModel fromEntity(EmployeeEntity entity) => EmployeeApiModel(
        id: entity.id ?? '',
        name: entity.name,
        phone: entity.phone,
        address: entity.address,
        imageUrl: entity.imageUrl,
      );

  // Convert API List to Entity List
  List<EmployeeEntity> toEntityList(List<EmployeeApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [id, name, phone, address, imageUrl];
}
