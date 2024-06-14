import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kaamkuro/app/constants/hive_table_constant.dart';
import 'package:kaamkuro/features/authentication/domain/entity/auth_entity.dart';

import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

final authHiveModelProvider = Provider(
  (ref) => AuthHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String name;

  

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String password;

  // Constructor
  AuthHiveModel({
    String? userId,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  // empty constructor
  AuthHiveModel.empty()
      : this(
          userId: '',
          name: '',
          
          phone: '',
          
          email: '',
          password: '',
        );

  // Convert Hive Object to Entity
  AuthEntity toEntity() => AuthEntity(
        id: userId,
        name: name,
       
        phone: phone,
        
        email: email,
        password: password,
      );

  // Convert Entity to Hive Object
  AuthHiveModel toHiveModel(AuthEntity entity) => AuthHiveModel(
        userId: const Uuid().v4(),
        name: entity.name,
        
        phone: entity.phone,
       
        email: entity.email,
        password: entity.password,
      );

  // Convert Entity List to Hive List
  List<AuthHiveModel> toHiveModelList(List<AuthEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'userId: $userId, name: $name,  phone: $phone, email: $email, password: $password';
  }
}
