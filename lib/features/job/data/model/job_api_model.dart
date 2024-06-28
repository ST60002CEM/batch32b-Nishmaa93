import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kaamkuro/features/job/domain/entity/job_entity.dart';

final jobApiModelProvider = Provider<JobApiModel>(
  (ref) => const JobApiModel.empty(),
);

@JsonSerializable()
class JobApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? price;
  final String? category;
  final String? description;
  final String? imageUrl;

  const JobApiModel({
    this.id,
    this.name,
    this.price,
    this.category,
    this.description,
    this.imageUrl,
  });
  const JobApiModel.empty()
      : id = '',
        name = '',
        price = '',
        category = '',
        description = '',
        imageUrl = '';

  // From Json , write full code without generator
  factory JobApiModel.fromJson(Map<String, dynamic> json) {
    return JobApiModel(
      id: json['_id'],
      name: json['name'],
      price: json['price'],
      category: json['category'],
      description: json['description'],
      imageUrl: json['imageUrl'],


    );
  }

  // To Json , write full code without generator
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  // Convert API Object to Entity
  JobEntity toEntity() => JobEntity(
        id: id,
        name: name,
        price: price,
        category: category,
        description: description,
        imageUrl: imageUrl,

      );

  // Convert Entity to API Object
  JobApiModel fromEntity(JobEntity entity) => JobApiModel(
        id: entity.id ?? '',
        name: entity.name,
        price: entity.price,
        category: entity.category,
        description: entity.description,
        imageUrl: entity.imageUrl,


      );

  // Convert API List to Entity List
  List<JobEntity> toEntityList(List<JobApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [id, name, price, category, description, imageUrl];
}
