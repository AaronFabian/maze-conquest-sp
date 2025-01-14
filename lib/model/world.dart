import 'package:freezed_annotation/freezed_annotation.dart';

part 'world.freezed.dart';
part 'world.g.dart';

@freezed
class World with _$World {
  const factory World({
    required String name,
    required int level,
    // int? runtime,
    // String? backdrop_path,
  }) = _World;

  factory World.fromJson(Map<String, dynamic> json) => _$WorldFromJson(json);
}
