import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? name;
  final String? image;
  final String? phone;
  final String? email;
  final String? password;
  final String? newPassword;
  final String? confirmPassword;

  const UserEntity(
      {this.id,
      this.name,
      this.image,
      this.phone,
      this.email,
      this.password,
      this.newPassword,
      this.confirmPassword});

  @override
  List<Object?> get props =>
      [id, name, image, phone, email, password, newPassword, confirmPassword];
}
