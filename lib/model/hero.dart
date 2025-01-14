import 'package:freezed_annotation/freezed_annotation.dart';

part 'hero.freezed.dart';
part 'hero.g.dart';

@freezed
class Hero with _$Hero {
  const factory Hero({
    required String name,
    required int level,
    required int currentExp,
    required int expToLevel,
    // int? runtime,
    // String? backdrop_path,
  }) = _Hero;

  factory Hero.fromJson(Map<String, dynamic> json) => _$HeroFromJson(json);
}
