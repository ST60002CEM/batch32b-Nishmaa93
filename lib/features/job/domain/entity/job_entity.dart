import 'package:equatable/equatable.dart';

class JobEntity extends Equatable {
  final String? id;
  final String? name;
  final String? price;
  final String? category;
  final String? description;
  final String? imageUrl;

  const JobEntity({
    this.id,
    this.name,
    this.price,
    this.category,
    this.description,
    this.imageUrl,
  });

  @override
  List<Object?> get props =>
      [id, name, price, category, description, imageUrl];
}
