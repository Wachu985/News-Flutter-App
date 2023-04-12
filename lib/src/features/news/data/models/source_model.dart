import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import '../../domain/entities/source.dart';

part 'source_model.g.dart';

@Embedded(inheritance: false)
class SourceModel extends Equatable {
  const SourceModel({
    this.id,
    this.name,
  });

  final String? id;
  final String? name;

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"] ?? ' Not Found',
        name: json["name"] ?? 'Not Found',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  @ignore
  List<Object?> get props => [id, name];
}

extension SourceModelExtension on SourceModel {
  Source get toSource => Source(id: id ?? '', name: name ?? '');
}
