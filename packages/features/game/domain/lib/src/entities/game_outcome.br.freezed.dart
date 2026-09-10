// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_outcome.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameOutcome {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameOutcome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameOutcome()';
}


}

/// @nodoc
class $GameOutcomeCopyWith<$Res>  {
$GameOutcomeCopyWith(GameOutcome _, $Res Function(GameOutcome) __);
}


/// Adds pattern-matching-related methods to [GameOutcome].
extension GameOutcomePatterns on GameOutcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GameDraw value)?  draw,TResult Function( GameInProgress value)?  inProgress,TResult Function( GameWin value)?  win,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GameDraw() when draw != null:
return draw(_that);case GameInProgress() when inProgress != null:
return inProgress(_that);case GameWin() when win != null:
return win(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GameDraw value)  draw,required TResult Function( GameInProgress value)  inProgress,required TResult Function( GameWin value)  win,}){
final _that = this;
switch (_that) {
case GameDraw():
return draw(_that);case GameInProgress():
return inProgress(_that);case GameWin():
return win(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GameDraw value)?  draw,TResult? Function( GameInProgress value)?  inProgress,TResult? Function( GameWin value)?  win,}){
final _that = this;
switch (_that) {
case GameDraw() when draw != null:
return draw(_that);case GameInProgress() when inProgress != null:
return inProgress(_that);case GameWin() when win != null:
return win(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  draw,TResult Function()?  inProgress,TResult Function( WinningLine line,  Mark mark)?  win,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GameDraw() when draw != null:
return draw();case GameInProgress() when inProgress != null:
return inProgress();case GameWin() when win != null:
return win(_that.line,_that.mark);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  draw,required TResult Function()  inProgress,required TResult Function( WinningLine line,  Mark mark)  win,}) {final _that = this;
switch (_that) {
case GameDraw():
return draw();case GameInProgress():
return inProgress();case GameWin():
return win(_that.line,_that.mark);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  draw,TResult? Function()?  inProgress,TResult? Function( WinningLine line,  Mark mark)?  win,}) {final _that = this;
switch (_that) {
case GameDraw() when draw != null:
return draw();case GameInProgress() when inProgress != null:
return inProgress();case GameWin() when win != null:
return win(_that.line,_that.mark);case _:
  return null;

}
}

}

/// @nodoc


class GameDraw implements GameOutcome {
  const GameDraw();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameDraw);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameOutcome.draw()';
}


}




/// @nodoc


class GameInProgress implements GameOutcome {
  const GameInProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameOutcome.inProgress()';
}


}




/// @nodoc


class GameWin implements GameOutcome {
  const GameWin({required this.line, required this.mark});
  

 final  WinningLine line;
 final  Mark mark;

/// Create a copy of GameOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameWinCopyWith<GameWin> get copyWith => _$GameWinCopyWithImpl<GameWin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameWin&&(identical(other.line, line) || other.line == line)&&(identical(other.mark, mark) || other.mark == mark));
}


@override
int get hashCode => Object.hash(runtimeType,line,mark);

@override
String toString() {
  return 'GameOutcome.win(line: $line, mark: $mark)';
}


}

/// @nodoc
abstract mixin class $GameWinCopyWith<$Res> implements $GameOutcomeCopyWith<$Res> {
  factory $GameWinCopyWith(GameWin value, $Res Function(GameWin) _then) = _$GameWinCopyWithImpl;
@useResult
$Res call({
 WinningLine line, Mark mark
});




}
/// @nodoc
class _$GameWinCopyWithImpl<$Res>
    implements $GameWinCopyWith<$Res> {
  _$GameWinCopyWithImpl(this._self, this._then);

  final GameWin _self;
  final $Res Function(GameWin) _then;

/// Create a copy of GameOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? line = null,Object? mark = null,}) {
  return _then(GameWin(
line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as WinningLine,mark: null == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as Mark,
  ));
}


}

// dart format on
