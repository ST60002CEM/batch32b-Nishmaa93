import 'package:equatable/equatable.dart';


class AuthEntity extends Equatable {
  final String? id;
  final String name;
  
  final String? image;
  final String phone;
  
  final String email;
  final String password;

  const AuthEntity({
    this.id,
    required this.name,
    this.image,
    required this.phone,
  
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [id, name, image, phone, email, password];
}
