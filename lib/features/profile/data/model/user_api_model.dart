import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kaamkuro/features/profile/domain/entity/user_entity.dart';

final userApiModelProvider = Provider<UserApiModel>(
  (ref) => UserApiModel.empty(),
);

@JsonSerializable()
class UserApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? image;
  final String? email;
  final String? phone;
  final String? password;
  final String? newPassword;
  final String? confirmPassword;

  const UserApiModel(
      {this.id,
      this.name,
      this.image,
      this.email,
      this.password,
      this.phone,
      this.newPassword,
      this.confirmPassword});

  const UserApiModel.empty()
      : id = '',
        name = '',
        image = '',
        email = '',
        password = '',
        phone = '',
        newPassword = '',
        confirmPassword = '';

  // From Json , write full code without generator
  factory UserApiModel.fromJson(Map<String, dynamic> json) {
    return UserApiModel(
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
      image: json['image'],
      email: json['email'],
      password: json['password'],
      newPassword: json['newPassword'],
      confirmPassword: json['confirmPassword'],
    );
  }

  // To Json , write full code without generator
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'phone': phone,
      'email': email,
      'password': password,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    };
  }

  // Convert API Object to Entity
  UserEntity toEntity() => UserEntity(
        id: id,
        name: name,
        image: image,
        phone: phone,
        email: email,
        password: password,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );

  // Convert Entity to API Object
  UserApiModel fromEntity(UserEntity entity) => UserApiModel(
      id: entity.id ?? '',
      name: entity.name,
      image: entity.image,
      phone: entity.phone,
      email: entity.email,
      password: entity.password,
      newPassword: entity.newPassword,
      confirmPassword: entity.confirmPassword);

  // Convert API List to Entity List
  List<UserEntity> toEntityList(List<UserApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props =>
      [id, name, image, phone, email, password, newPassword, confirmPassword];
}
