// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Game {

 Board get board; Difficulty get difficulty; Mark get humanMark; GameOutcome get outcome; Mark get turn;
/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameCopyWith<Game> get copyWith => _$GameCopyWithImpl<Game>(this as Game, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Game&&(identical(other.board, board) || other.board == board)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.humanMark, humanMark) || other.humanMark == humanMark)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.turn, turn) || other.turn == turn));
}


@override
int get hashCode => Object.hash(runtimeType,board,difficulty,humanMark,outcome,turn);

@override
String toString() {
  return 'Game(board: $board, difficulty: $difficulty, humanMark: $humanMark, outcome: $outcome, turn: $turn)';
}


}

/// @nodoc
abstract mixin class $GameCopyWith<$Res>  {
  factory $GameCopyWith(Game value, $Res Function(Game) _then) = _$GameCopyWithImpl;
@useResult
$Res call({
 Board board, Difficulty difficulty, Mark humanMark, GameOutcome outcome, Mark turn
});


$BoardCopyWith<$Res> get board;$GameOutcomeCopyWith<$Res> get outcome;

}
/// @nodoc
class _$GameCopyWithImpl<$Res>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._self, this._then);

  final Game _self;
  final $Res Function(Game) _then;

/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? board = null,Object? difficulty = null,Object? humanMark = null,Object? outcome = null,Object? turn = null,}) {
  return _then(_self.copyWith(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as Board,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,humanMark: null == humanMark ? _self.humanMark : humanMark // ignore: cast_nullable_to_non_nullable
as Mark,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as GameOutcome,turn: null == turn ? _self.turn : turn // ignore: cast_nullable_to_non_nullable
as Mark,
  ));
}
/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoardCopyWith<$Res> get board {
  
  return $BoardCopyWith<$Res>(_self.board, (value) {
    return _then(_self.copyWith(board: value));
  });
}/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameOutcomeCopyWith<$Res> get outcome {
  
  return $GameOutcomeCopyWith<$Res>(_self.outcome, (value) {
    return _then(_self.copyWith(outcome: value));
  });
}
}


/// Adds pattern-matching-related methods to [Game].
extension GamePatterns on Game {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Game value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Game() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Game value)  $default,){
final _that = this;
switch (_that) {
case _Game():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Game value)?  $default,){
final _that = this;
switch (_that) {
case _Game() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Board board,  Difficulty difficulty,  Mark humanMark,  GameOutcome outcome,  Mark turn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Game() when $default != null:
return $default(_that.board,_that.difficulty,_that.humanMark,_that.outcome,_that.turn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Board board,  Difficulty difficulty,  Mark humanMark,  GameOutcome outcome,  Mark turn)  $default,) {final _that = this;
switch (_that) {
case _Game():
return $default(_that.board,_that.difficulty,_that.humanMark,_that.outcome,_that.turn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Board board,  Difficulty difficulty,  Mark humanMark,  GameOutcome outcome,  Mark turn)?  $default,) {final _that = this;
switch (_that) {
case _Game() when $default != null:
return $default(_that.board,_that.difficulty,_that.humanMark,_that.outcome,_that.turn);case _:
  return null;

}
}

}

/// @nodoc


class _Game extends Game {
  const _Game({required this.board, required this.difficulty, required this.humanMark, required this.outcome, required this.turn}): super._();
  

@override final  Board board;
@override final  Difficulty difficulty;
@override final  Mark humanMark;
@override final  GameOutcome outcome;
@override final  Mark turn;

/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameCopyWith<_Game> get copyWith => __$GameCopyWithImpl<_Game>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Game&&(identical(other.board, board) || other.board == board)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.humanMark, humanMark) || other.humanMark == humanMark)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.turn, turn) || other.turn == turn));
}


@override
int get hashCode => Object.hash(runtimeType,board,difficulty,humanMark,outcome,turn);

@override
String toString() {
  return 'Game(board: $board, difficulty: $difficulty, humanMark: $humanMark, outcome: $outcome, turn: $turn)';
}


}

/// @nodoc
abstract mixin class _$GameCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$GameCopyWith(_Game value, $Res Function(_Game) _then) = __$GameCopyWithImpl;
@override @useResult
$Res call({
 Board board, Difficulty difficulty, Mark humanMark, GameOutcome outcome, Mark turn
});


@override $BoardCopyWith<$Res> get board;@override $GameOutcomeCopyWith<$Res> get outcome;

}
/// @nodoc
class __$GameCopyWithImpl<$Res>
    implements _$GameCopyWith<$Res> {
  __$GameCopyWithImpl(this._self, this._then);

  final _Game _self;
  final $Res Function(_Game) _then;

/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? board = null,Object? difficulty = null,Object? humanMark = null,Object? outcome = null,Object? turn = null,}) {
  return _then(_Game(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as Board,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,humanMark: null == humanMark ? _self.humanMark : humanMark // ignore: cast_nullable_to_non_nullable
as Mark,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as GameOutcome,turn: null == turn ? _self.turn : turn // ignore: cast_nullable_to_non_nullable
as Mark,
  ));
}

/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoardCopyWith<$Res> get board {
  
  return $BoardCopyWith<$Res>(_self.board, (value) {
    return _then(_self.copyWith(board: value));
  });
}/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameOutcomeCopyWith<$Res> get outcome {
  
  return $GameOutcomeCopyWith<$Res>(_self.outcome, (value) {
    return _then(_self.copyWith(outcome: value));
  });
}
}

// dart format on
