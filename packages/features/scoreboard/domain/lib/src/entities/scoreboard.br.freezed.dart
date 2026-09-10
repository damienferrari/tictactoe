// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scoreboard.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Scoreboard {

 int get draws; int get losses; int get wins;
/// Create a copy of Scoreboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreboardCopyWith<Scoreboard> get copyWith => _$ScoreboardCopyWithImpl<Scoreboard>(this as Scoreboard, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Scoreboard&&(identical(other.draws, draws) || other.draws == draws)&&(identical(other.losses, losses) || other.losses == losses)&&(identical(other.wins, wins) || other.wins == wins));
}


@override
int get hashCode => Object.hash(runtimeType,draws,losses,wins);

@override
String toString() {
  return 'Scoreboard(draws: $draws, losses: $losses, wins: $wins)';
}


}

/// @nodoc
abstract mixin class $ScoreboardCopyWith<$Res>  {
  factory $ScoreboardCopyWith(Scoreboard value, $Res Function(Scoreboard) _then) = _$ScoreboardCopyWithImpl;
@useResult
$Res call({
 int draws, int losses, int wins
});




}
/// @nodoc
class _$ScoreboardCopyWithImpl<$Res>
    implements $ScoreboardCopyWith<$Res> {
  _$ScoreboardCopyWithImpl(this._self, this._then);

  final Scoreboard _self;
  final $Res Function(Scoreboard) _then;

/// Create a copy of Scoreboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? draws = null,Object? losses = null,Object? wins = null,}) {
  return _then(_self.copyWith(
draws: null == draws ? _self.draws : draws // ignore: cast_nullable_to_non_nullable
as int,losses: null == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Scoreboard].
extension ScoreboardPatterns on Scoreboard {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Scoreboard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Scoreboard() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Scoreboard value)  $default,){
final _that = this;
switch (_that) {
case _Scoreboard():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Scoreboard value)?  $default,){
final _that = this;
switch (_that) {
case _Scoreboard() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int draws,  int losses,  int wins)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Scoreboard() when $default != null:
return $default(_that.draws,_that.losses,_that.wins);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int draws,  int losses,  int wins)  $default,) {final _that = this;
switch (_that) {
case _Scoreboard():
return $default(_that.draws,_that.losses,_that.wins);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int draws,  int losses,  int wins)?  $default,) {final _that = this;
switch (_that) {
case _Scoreboard() when $default != null:
return $default(_that.draws,_that.losses,_that.wins);case _:
  return null;

}
}

}

/// @nodoc


class _Scoreboard extends Scoreboard {
  const _Scoreboard({this.draws = 0, this.losses = 0, this.wins = 0}): super._();
  

@override@JsonKey() final  int draws;
@override@JsonKey() final  int losses;
@override@JsonKey() final  int wins;

/// Create a copy of Scoreboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScoreboardCopyWith<_Scoreboard> get copyWith => __$ScoreboardCopyWithImpl<_Scoreboard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Scoreboard&&(identical(other.draws, draws) || other.draws == draws)&&(identical(other.losses, losses) || other.losses == losses)&&(identical(other.wins, wins) || other.wins == wins));
}


@override
int get hashCode => Object.hash(runtimeType,draws,losses,wins);

@override
String toString() {
  return 'Scoreboard(draws: $draws, losses: $losses, wins: $wins)';
}


}

/// @nodoc
abstract mixin class _$ScoreboardCopyWith<$Res> implements $ScoreboardCopyWith<$Res> {
  factory _$ScoreboardCopyWith(_Scoreboard value, $Res Function(_Scoreboard) _then) = __$ScoreboardCopyWithImpl;
@override @useResult
$Res call({
 int draws, int losses, int wins
});




}
/// @nodoc
class __$ScoreboardCopyWithImpl<$Res>
    implements _$ScoreboardCopyWith<$Res> {
  __$ScoreboardCopyWithImpl(this._self, this._then);

  final _Scoreboard _self;
  final $Res Function(_Scoreboard) _then;

/// Create a copy of Scoreboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draws = null,Object? losses = null,Object? wins = null,}) {
  return _then(_Scoreboard(
draws: null == draws ? _self.draws : draws // ignore: cast_nullable_to_non_nullable
as int,losses: null == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
