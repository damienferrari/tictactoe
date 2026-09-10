import 'package:freezed_annotation/freezed_annotation.dart';

part 'scoreboard_dto.br.freezed.dart';
part 'scoreboard_dto.br.g.dart';

/// The stored shape, kept apart from the entity so a change of storage format does not
/// reach the domain. Defaults make a partial payload readable instead of fatal.
@freezed
abstract class ScoreboardDto with _$ScoreboardDto {
  const factory ScoreboardDto({
    @Default(0) int draws,
    @Default(0) int losses,
    @Default(0) int wins,
  }) = _ScoreboardDto;

  factory ScoreboardDto.fromJson(Map<String, dynamic> json) => _$ScoreboardDtoFromJson(json);
}
