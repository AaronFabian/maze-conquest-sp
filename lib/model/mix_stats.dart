import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maze_conquest_sp/helper/constant.dart' as constant;

part 'mix_stats.freezed.dart';
part 'mix_stats.g.dart';

@freezed
class MixStats with _$MixStats {
  const factory MixStats({
    required String uid,
    required int power,
    required String ownerUsername,
    required String photoUrl,
    // int? runtime,
    // String? backdrop_path,
  }) = _MixStats;

  factory MixStats.fromJson(Map<String, dynamic> json) => _$MixStatsFromJson(json);

  const MixStats._(); // A private constructor; freeze required this

  ImageProvider<Object> get safetyPhotoWidget =>
      photoUrl.isEmpty ? const AssetImage(constant.imgPlaceholderWhenCrash) : NetworkImage(photoUrl);
  String get safetyOwnerUsername => ownerUsername.isEmpty ? "User${uid.substring(0, 5)}" : ownerUsername;
}

// flutter packages pub run build_runner build --delete-conflicting-outputs