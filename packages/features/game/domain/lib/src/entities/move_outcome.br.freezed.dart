// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'move_outcome.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MoveOutcome {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveOutcome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoveOutcome()';
}


}

/// @nodoc
class $MoveOutcomeCopyWith<$Res>  {
$MoveOutcomeCopyWith(MoveOutcome _, $Res Function(MoveOutcome) __);
}


/// Adds pattern-matching-related methods to [MoveOutcome].
extension MoveOutcomePatterns on MoveOutcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MoveAccepted value)?  accepted,TResult Function( MoveRejected value)?  rejected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MoveAccepted() when accepted != null:
return accepted(_that);case MoveRejected() when rejected != null:
return rejected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MoveAccepted value)  accepted,required TResult Function( MoveRejected value)  rejected,}){
final _that = this;
switch (_that) {
case MoveAccepted():
return accepted(_that);case MoveRejected():
return rejected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MoveAccepted value)?  accepted,TResult? Function( MoveRejected value)?  rejected,}){
final _that = this;
switch (_that) {
case MoveAccepted() when accepted != null:
return accepted(_that);case MoveRejected() when rejected != null:
return rejected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Game game)?  accepted,TResult Function( MoveRejection reason)?  rejected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MoveAccepted() when accepted != null:
return accepted(_that.game);case MoveRejected() when rejected != null:
return rejected(_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Game game)  accepted,required TResult Function( MoveRejection reason)  rejected,}) {final _that = this;
switch (_that) {
case MoveAccepted():
return accepted(_that.game);case MoveRejected():
return rejected(_that.reason);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Game game)?  accepted,TResult? Function( MoveRejection reason)?  rejected,}) {final _that = this;
switch (_that) {
case MoveAccepted() when accepted != null:
return accepted(_that.game);case MoveRejected() when rejected != null:
return rejected(_that.reason);case _:
  return null;

}
}

}

/// @nodoc


class MoveAccepted implements MoveOutcome {
  const MoveAccepted(this.game);
  

 final  Game game;

/// Create a copy of MoveOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveAcceptedCopyWith<MoveAccepted> get copyWith => _$MoveAcceptedCopyWithImpl<MoveAccepted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveAccepted&&(identical(other.game, game) || other.game == game));
}


@override
int get hashCode => Object.hash(runtimeType,game);

@override
String toString() {
  return 'MoveOutcome.accepted(game: $game)';
}


}

/// @nodoc
abstract mixin class $MoveAcceptedCopyWith<$Res> implements $MoveOutcomeCopyWith<$Res> {
  factory $MoveAcceptedCopyWith(MoveAccepted value, $Res Function(MoveAccepted) _then) = _$MoveAcceptedCopyWithImpl;
@useResult
$Res call({
 Game game
});


$GameCopyWith<$Res> get game;

}
/// @nodoc
class _$MoveAcceptedCopyWithImpl<$Res>
    implements $MoveAcceptedCopyWith<$Res> {
  _$MoveAcceptedCopyWithImpl(this._self, this._then);

  final MoveAccepted _self;
  final $Res Function(MoveAccepted) _then;

/// Create a copy of MoveOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? game = null,}) {
  return _then(MoveAccepted(
null == game ? _self.game : game // ignore: cast_nullable_to_non_nullable
as Game,
  ));
}

/// Create a copy of MoveOutcome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameCopyWith<$Res> get game {
  
  return $GameCopyWith<$Res>(_self.game, (value) {
    return _then(_self.copyWith(game: value));
  });
}
}

/// @nodoc


class MoveRejected implements MoveOutcome {
  const MoveRejected(this.reason);
  

 final  MoveRejection reason;

/// Create a copy of MoveOutcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveRejectedCopyWith<MoveRejected> get copyWith => _$MoveRejectedCopyWithImpl<MoveRejected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveRejected&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'MoveOutcome.rejected(reason: $reason)';
}


}

/// @nodoc
abstract mixin class $MoveRejectedCopyWith<$Res> implements $MoveOutcomeCopyWith<$Res> {
  factory $MoveRejectedCopyWith(MoveRejected value, $Res Function(MoveRejected) _then) = _$MoveRejectedCopyWithImpl;
@useResult
$Res call({
 MoveRejection reason
});




}
/// @nodoc
class _$MoveRejectedCopyWithImpl<$Res>
    implements $MoveRejectedCopyWith<$Res> {
  _$MoveRejectedCopyWithImpl(this._self, this._then);

  final MoveRejected _self;
  final $Res Function(MoveRejected) _then;

/// Create a copy of MoveOutcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(MoveRejected(
null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as MoveRejection,
  ));
}


}

// dart format on
