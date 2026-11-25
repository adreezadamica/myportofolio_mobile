import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

/// Portfolio project synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Project {
  const Project({
    required this.title,
    required this.description,
    this.category = 'web',
    this.thumbnail,
    this.id,
    this.categoryDisplay = '',
    this.startedAt,
    this.endedAt,
    this.isOngoing = true,
    this.starCount = 0,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;
  final String title;
  final String description;
  @JsonKey(defaultValue: 'web')
  final String category;
  final String? thumbnail;

  @JsonKey(includeToJson: false, defaultValue: '')
  final String categoryDisplay;
  @JsonKey(includeToJson: false)
  final String? startedAt;
  final String? endedAt;
  @JsonKey(includeToJson: false, defaultValue: true)
  final bool isOngoing;
  @JsonKey(includeToJson: false, defaultValue: 0)
  final int starCount;

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
