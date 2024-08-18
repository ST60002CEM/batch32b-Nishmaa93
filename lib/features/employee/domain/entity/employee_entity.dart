import 'package:equatable/equatable.dart';

class EmployeeEntity extends Equatable {
  final String? id;
  final String? name;
  final String? phone;
  final String? address;
  final String? imageUrl;

  const EmployeeEntity({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, phone, address, imageUrl];
}
