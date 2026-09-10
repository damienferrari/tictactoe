// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoreboard_dto.br.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScoreboardDto _$ScoreboardDtoFromJson(Map<String, dynamic> json) => _ScoreboardDto(
  draws: (json['draws'] as num?)?.toInt() ?? 0,
  losses: (json['losses'] as num?)?.toInt() ?? 0,
  wins: (json['wins'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ScoreboardDtoToJson(_ScoreboardDto instance) => <String, dynamic>{
  'draws': instance.draws,
  'losses': instance.losses,
  'wins': instance.wins,
};
