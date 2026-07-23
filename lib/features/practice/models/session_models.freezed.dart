// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExerciseDetail {

 String get id; String get slug; String get name; ExerciseType get exerciseType; List<String> get primaryMuscles; List<String> get secondaryMuscles; List<String> get equipment; int get difficulty; String? get movementPattern;/// Step-by-step cues for the guide sheet. Never sent to the LLM.
 List<String> get instructions; Map<String, dynamic>? get media;
/// Create a copy of ExerciseDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseDetailCopyWith<ExerciseDetail> get copyWith => _$ExerciseDetailCopyWithImpl<ExerciseDetail>(this as ExerciseDetail, _$identity);

  /// Serializes this ExerciseDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.exerciseType, exerciseType) || other.exerciseType == exerciseType)&&const DeepCollectionEquality().equals(other.primaryMuscles, primaryMuscles)&&const DeepCollectionEquality().equals(other.secondaryMuscles, secondaryMuscles)&&const DeepCollectionEquality().equals(other.equipment, equipment)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.movementPattern, movementPattern) || other.movementPattern == movementPattern)&&const DeepCollectionEquality().equals(other.instructions, instructions)&&const DeepCollectionEquality().equals(other.media, media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,exerciseType,const DeepCollectionEquality().hash(primaryMuscles),const DeepCollectionEquality().hash(secondaryMuscles),const DeepCollectionEquality().hash(equipment),difficulty,movementPattern,const DeepCollectionEquality().hash(instructions),const DeepCollectionEquality().hash(media));

@override
String toString() {
  return 'ExerciseDetail(id: $id, slug: $slug, name: $name, exerciseType: $exerciseType, primaryMuscles: $primaryMuscles, secondaryMuscles: $secondaryMuscles, equipment: $equipment, difficulty: $difficulty, movementPattern: $movementPattern, instructions: $instructions, media: $media)';
}


}

/// @nodoc
abstract mixin class $ExerciseDetailCopyWith<$Res>  {
  factory $ExerciseDetailCopyWith(ExerciseDetail value, $Res Function(ExerciseDetail) _then) = _$ExerciseDetailCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String name, ExerciseType exerciseType, List<String> primaryMuscles, List<String> secondaryMuscles, List<String> equipment, int difficulty, String? movementPattern, List<String> instructions, Map<String, dynamic>? media
});




}
/// @nodoc
class _$ExerciseDetailCopyWithImpl<$Res>
    implements $ExerciseDetailCopyWith<$Res> {
  _$ExerciseDetailCopyWithImpl(this._self, this._then);

  final ExerciseDetail _self;
  final $Res Function(ExerciseDetail) _then;

/// Create a copy of ExerciseDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? exerciseType = null,Object? primaryMuscles = null,Object? secondaryMuscles = null,Object? equipment = null,Object? difficulty = null,Object? movementPattern = freezed,Object? instructions = null,Object? media = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,exerciseType: null == exerciseType ? _self.exerciseType : exerciseType // ignore: cast_nullable_to_non_nullable
as ExerciseType,primaryMuscles: null == primaryMuscles ? _self.primaryMuscles : primaryMuscles // ignore: cast_nullable_to_non_nullable
as List<String>,secondaryMuscles: null == secondaryMuscles ? _self.secondaryMuscles : secondaryMuscles // ignore: cast_nullable_to_non_nullable
as List<String>,equipment: null == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as List<String>,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int,movementPattern: freezed == movementPattern ? _self.movementPattern : movementPattern // ignore: cast_nullable_to_non_nullable
as String?,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,media: freezed == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExerciseDetail].
extension ExerciseDetailPatterns on ExerciseDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExerciseDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExerciseDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExerciseDetail value)  $default,){
final _that = this;
switch (_that) {
case _ExerciseDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExerciseDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ExerciseDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  ExerciseType exerciseType,  List<String> primaryMuscles,  List<String> secondaryMuscles,  List<String> equipment,  int difficulty,  String? movementPattern,  List<String> instructions,  Map<String, dynamic>? media)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseDetail() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.exerciseType,_that.primaryMuscles,_that.secondaryMuscles,_that.equipment,_that.difficulty,_that.movementPattern,_that.instructions,_that.media);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  ExerciseType exerciseType,  List<String> primaryMuscles,  List<String> secondaryMuscles,  List<String> equipment,  int difficulty,  String? movementPattern,  List<String> instructions,  Map<String, dynamic>? media)  $default,) {final _that = this;
switch (_that) {
case _ExerciseDetail():
return $default(_that.id,_that.slug,_that.name,_that.exerciseType,_that.primaryMuscles,_that.secondaryMuscles,_that.equipment,_that.difficulty,_that.movementPattern,_that.instructions,_that.media);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String name,  ExerciseType exerciseType,  List<String> primaryMuscles,  List<String> secondaryMuscles,  List<String> equipment,  int difficulty,  String? movementPattern,  List<String> instructions,  Map<String, dynamic>? media)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseDetail() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.exerciseType,_that.primaryMuscles,_that.secondaryMuscles,_that.equipment,_that.difficulty,_that.movementPattern,_that.instructions,_that.media);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExerciseDetail extends ExerciseDetail {
  const _ExerciseDetail({required this.id, required this.slug, required this.name, this.exerciseType = ExerciseType.resistance, final  List<String> primaryMuscles = const <String>[], final  List<String> secondaryMuscles = const <String>[], final  List<String> equipment = const <String>[], this.difficulty = 1, this.movementPattern, final  List<String> instructions = const <String>[], final  Map<String, dynamic>? media}): _primaryMuscles = primaryMuscles,_secondaryMuscles = secondaryMuscles,_equipment = equipment,_instructions = instructions,_media = media,super._();
  factory _ExerciseDetail.fromJson(Map<String, dynamic> json) => _$ExerciseDetailFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String name;
@override@JsonKey() final  ExerciseType exerciseType;
 final  List<String> _primaryMuscles;
@override@JsonKey() List<String> get primaryMuscles {
  if (_primaryMuscles is EqualUnmodifiableListView) return _primaryMuscles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_primaryMuscles);
}

 final  List<String> _secondaryMuscles;
@override@JsonKey() List<String> get secondaryMuscles {
  if (_secondaryMuscles is EqualUnmodifiableListView) return _secondaryMuscles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_secondaryMuscles);
}

 final  List<String> _equipment;
@override@JsonKey() List<String> get equipment {
  if (_equipment is EqualUnmodifiableListView) return _equipment;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_equipment);
}

@override@JsonKey() final  int difficulty;
@override final  String? movementPattern;
/// Step-by-step cues for the guide sheet. Never sent to the LLM.
 final  List<String> _instructions;
/// Step-by-step cues for the guide sheet. Never sent to the LLM.
@override@JsonKey() List<String> get instructions {
  if (_instructions is EqualUnmodifiableListView) return _instructions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instructions);
}

 final  Map<String, dynamic>? _media;
@override Map<String, dynamic>? get media {
  final value = _media;
  if (value == null) return null;
  if (_media is EqualUnmodifiableMapView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ExerciseDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseDetailCopyWith<_ExerciseDetail> get copyWith => __$ExerciseDetailCopyWithImpl<_ExerciseDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExerciseDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.exerciseType, exerciseType) || other.exerciseType == exerciseType)&&const DeepCollectionEquality().equals(other._primaryMuscles, _primaryMuscles)&&const DeepCollectionEquality().equals(other._secondaryMuscles, _secondaryMuscles)&&const DeepCollectionEquality().equals(other._equipment, _equipment)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.movementPattern, movementPattern) || other.movementPattern == movementPattern)&&const DeepCollectionEquality().equals(other._instructions, _instructions)&&const DeepCollectionEquality().equals(other._media, _media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,exerciseType,const DeepCollectionEquality().hash(_primaryMuscles),const DeepCollectionEquality().hash(_secondaryMuscles),const DeepCollectionEquality().hash(_equipment),difficulty,movementPattern,const DeepCollectionEquality().hash(_instructions),const DeepCollectionEquality().hash(_media));

@override
String toString() {
  return 'ExerciseDetail(id: $id, slug: $slug, name: $name, exerciseType: $exerciseType, primaryMuscles: $primaryMuscles, secondaryMuscles: $secondaryMuscles, equipment: $equipment, difficulty: $difficulty, movementPattern: $movementPattern, instructions: $instructions, media: $media)';
}


}

/// @nodoc
abstract mixin class _$ExerciseDetailCopyWith<$Res> implements $ExerciseDetailCopyWith<$Res> {
  factory _$ExerciseDetailCopyWith(_ExerciseDetail value, $Res Function(_ExerciseDetail) _then) = __$ExerciseDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String name, ExerciseType exerciseType, List<String> primaryMuscles, List<String> secondaryMuscles, List<String> equipment, int difficulty, String? movementPattern, List<String> instructions, Map<String, dynamic>? media
});




}
/// @nodoc
class __$ExerciseDetailCopyWithImpl<$Res>
    implements _$ExerciseDetailCopyWith<$Res> {
  __$ExerciseDetailCopyWithImpl(this._self, this._then);

  final _ExerciseDetail _self;
  final $Res Function(_ExerciseDetail) _then;

/// Create a copy of ExerciseDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? exerciseType = null,Object? primaryMuscles = null,Object? secondaryMuscles = null,Object? equipment = null,Object? difficulty = null,Object? movementPattern = freezed,Object? instructions = null,Object? media = freezed,}) {
  return _then(_ExerciseDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,exerciseType: null == exerciseType ? _self.exerciseType : exerciseType // ignore: cast_nullable_to_non_nullable
as ExerciseType,primaryMuscles: null == primaryMuscles ? _self._primaryMuscles : primaryMuscles // ignore: cast_nullable_to_non_nullable
as List<String>,secondaryMuscles: null == secondaryMuscles ? _self._secondaryMuscles : secondaryMuscles // ignore: cast_nullable_to_non_nullable
as List<String>,equipment: null == equipment ? _self._equipment : equipment // ignore: cast_nullable_to_non_nullable
as List<String>,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int,movementPattern: freezed == movementPattern ? _self.movementPattern : movementPattern // ignore: cast_nullable_to_non_nullable
as String?,instructions: null == instructions ? _self._instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,media: freezed == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$EffectiveRx {

 int get targetSets;/// `int` or `[min, max]` on the wire — see [repsLabel].
@JsonKey(name: 'targetReps') dynamic get rawTargetReps; double? get targetWeightKg; int? get targetDurationSec; int? get targetDistanceM; int? get targetRpe; int get restSec;
/// Create a copy of EffectiveRx
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EffectiveRxCopyWith<EffectiveRx> get copyWith => _$EffectiveRxCopyWithImpl<EffectiveRx>(this as EffectiveRx, _$identity);

  /// Serializes this EffectiveRx to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EffectiveRx&&(identical(other.targetSets, targetSets) || other.targetSets == targetSets)&&const DeepCollectionEquality().equals(other.rawTargetReps, rawTargetReps)&&(identical(other.targetWeightKg, targetWeightKg) || other.targetWeightKg == targetWeightKg)&&(identical(other.targetDurationSec, targetDurationSec) || other.targetDurationSec == targetDurationSec)&&(identical(other.targetDistanceM, targetDistanceM) || other.targetDistanceM == targetDistanceM)&&(identical(other.targetRpe, targetRpe) || other.targetRpe == targetRpe)&&(identical(other.restSec, restSec) || other.restSec == restSec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetSets,const DeepCollectionEquality().hash(rawTargetReps),targetWeightKg,targetDurationSec,targetDistanceM,targetRpe,restSec);

@override
String toString() {
  return 'EffectiveRx(targetSets: $targetSets, rawTargetReps: $rawTargetReps, targetWeightKg: $targetWeightKg, targetDurationSec: $targetDurationSec, targetDistanceM: $targetDistanceM, targetRpe: $targetRpe, restSec: $restSec)';
}


}

/// @nodoc
abstract mixin class $EffectiveRxCopyWith<$Res>  {
  factory $EffectiveRxCopyWith(EffectiveRx value, $Res Function(EffectiveRx) _then) = _$EffectiveRxCopyWithImpl;
@useResult
$Res call({
 int targetSets,@JsonKey(name: 'targetReps') dynamic rawTargetReps, double? targetWeightKg, int? targetDurationSec, int? targetDistanceM, int? targetRpe, int restSec
});




}
/// @nodoc
class _$EffectiveRxCopyWithImpl<$Res>
    implements $EffectiveRxCopyWith<$Res> {
  _$EffectiveRxCopyWithImpl(this._self, this._then);

  final EffectiveRx _self;
  final $Res Function(EffectiveRx) _then;

/// Create a copy of EffectiveRx
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? targetSets = null,Object? rawTargetReps = freezed,Object? targetWeightKg = freezed,Object? targetDurationSec = freezed,Object? targetDistanceM = freezed,Object? targetRpe = freezed,Object? restSec = null,}) {
  return _then(_self.copyWith(
targetSets: null == targetSets ? _self.targetSets : targetSets // ignore: cast_nullable_to_non_nullable
as int,rawTargetReps: freezed == rawTargetReps ? _self.rawTargetReps : rawTargetReps // ignore: cast_nullable_to_non_nullable
as dynamic,targetWeightKg: freezed == targetWeightKg ? _self.targetWeightKg : targetWeightKg // ignore: cast_nullable_to_non_nullable
as double?,targetDurationSec: freezed == targetDurationSec ? _self.targetDurationSec : targetDurationSec // ignore: cast_nullable_to_non_nullable
as int?,targetDistanceM: freezed == targetDistanceM ? _self.targetDistanceM : targetDistanceM // ignore: cast_nullable_to_non_nullable
as int?,targetRpe: freezed == targetRpe ? _self.targetRpe : targetRpe // ignore: cast_nullable_to_non_nullable
as int?,restSec: null == restSec ? _self.restSec : restSec // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EffectiveRx].
extension EffectiveRxPatterns on EffectiveRx {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EffectiveRx value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EffectiveRx() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EffectiveRx value)  $default,){
final _that = this;
switch (_that) {
case _EffectiveRx():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EffectiveRx value)?  $default,){
final _that = this;
switch (_that) {
case _EffectiveRx() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int targetSets, @JsonKey(name: 'targetReps')  dynamic rawTargetReps,  double? targetWeightKg,  int? targetDurationSec,  int? targetDistanceM,  int? targetRpe,  int restSec)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EffectiveRx() when $default != null:
return $default(_that.targetSets,_that.rawTargetReps,_that.targetWeightKg,_that.targetDurationSec,_that.targetDistanceM,_that.targetRpe,_that.restSec);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int targetSets, @JsonKey(name: 'targetReps')  dynamic rawTargetReps,  double? targetWeightKg,  int? targetDurationSec,  int? targetDistanceM,  int? targetRpe,  int restSec)  $default,) {final _that = this;
switch (_that) {
case _EffectiveRx():
return $default(_that.targetSets,_that.rawTargetReps,_that.targetWeightKg,_that.targetDurationSec,_that.targetDistanceM,_that.targetRpe,_that.restSec);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int targetSets, @JsonKey(name: 'targetReps')  dynamic rawTargetReps,  double? targetWeightKg,  int? targetDurationSec,  int? targetDistanceM,  int? targetRpe,  int restSec)?  $default,) {final _that = this;
switch (_that) {
case _EffectiveRx() when $default != null:
return $default(_that.targetSets,_that.rawTargetReps,_that.targetWeightKg,_that.targetDurationSec,_that.targetDistanceM,_that.targetRpe,_that.restSec);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EffectiveRx extends EffectiveRx {
  const _EffectiveRx({this.targetSets = 1, @JsonKey(name: 'targetReps') this.rawTargetReps, this.targetWeightKg, this.targetDurationSec, this.targetDistanceM, this.targetRpe, this.restSec = 60}): super._();
  factory _EffectiveRx.fromJson(Map<String, dynamic> json) => _$EffectiveRxFromJson(json);

@override@JsonKey() final  int targetSets;
/// `int` or `[min, max]` on the wire — see [repsLabel].
@override@JsonKey(name: 'targetReps') final  dynamic rawTargetReps;
@override final  double? targetWeightKg;
@override final  int? targetDurationSec;
@override final  int? targetDistanceM;
@override final  int? targetRpe;
@override@JsonKey() final  int restSec;

/// Create a copy of EffectiveRx
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EffectiveRxCopyWith<_EffectiveRx> get copyWith => __$EffectiveRxCopyWithImpl<_EffectiveRx>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EffectiveRxToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EffectiveRx&&(identical(other.targetSets, targetSets) || other.targetSets == targetSets)&&const DeepCollectionEquality().equals(other.rawTargetReps, rawTargetReps)&&(identical(other.targetWeightKg, targetWeightKg) || other.targetWeightKg == targetWeightKg)&&(identical(other.targetDurationSec, targetDurationSec) || other.targetDurationSec == targetDurationSec)&&(identical(other.targetDistanceM, targetDistanceM) || other.targetDistanceM == targetDistanceM)&&(identical(other.targetRpe, targetRpe) || other.targetRpe == targetRpe)&&(identical(other.restSec, restSec) || other.restSec == restSec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetSets,const DeepCollectionEquality().hash(rawTargetReps),targetWeightKg,targetDurationSec,targetDistanceM,targetRpe,restSec);

@override
String toString() {
  return 'EffectiveRx(targetSets: $targetSets, rawTargetReps: $rawTargetReps, targetWeightKg: $targetWeightKg, targetDurationSec: $targetDurationSec, targetDistanceM: $targetDistanceM, targetRpe: $targetRpe, restSec: $restSec)';
}


}

/// @nodoc
abstract mixin class _$EffectiveRxCopyWith<$Res> implements $EffectiveRxCopyWith<$Res> {
  factory _$EffectiveRxCopyWith(_EffectiveRx value, $Res Function(_EffectiveRx) _then) = __$EffectiveRxCopyWithImpl;
@override @useResult
$Res call({
 int targetSets,@JsonKey(name: 'targetReps') dynamic rawTargetReps, double? targetWeightKg, int? targetDurationSec, int? targetDistanceM, int? targetRpe, int restSec
});




}
/// @nodoc
class __$EffectiveRxCopyWithImpl<$Res>
    implements _$EffectiveRxCopyWith<$Res> {
  __$EffectiveRxCopyWithImpl(this._self, this._then);

  final _EffectiveRx _self;
  final $Res Function(_EffectiveRx) _then;

/// Create a copy of EffectiveRx
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? targetSets = null,Object? rawTargetReps = freezed,Object? targetWeightKg = freezed,Object? targetDurationSec = freezed,Object? targetDistanceM = freezed,Object? targetRpe = freezed,Object? restSec = null,}) {
  return _then(_EffectiveRx(
targetSets: null == targetSets ? _self.targetSets : targetSets // ignore: cast_nullable_to_non_nullable
as int,rawTargetReps: freezed == rawTargetReps ? _self.rawTargetReps : rawTargetReps // ignore: cast_nullable_to_non_nullable
as dynamic,targetWeightKg: freezed == targetWeightKg ? _self.targetWeightKg : targetWeightKg // ignore: cast_nullable_to_non_nullable
as double?,targetDurationSec: freezed == targetDurationSec ? _self.targetDurationSec : targetDurationSec // ignore: cast_nullable_to_non_nullable
as int?,targetDistanceM: freezed == targetDistanceM ? _self.targetDistanceM : targetDistanceM // ignore: cast_nullable_to_non_nullable
as int?,targetRpe: freezed == targetRpe ? _self.targetRpe : targetRpe // ignore: cast_nullable_to_non_nullable
as int?,restSec: null == restSec ? _self.restSec : restSec // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ExecutionItem {

 String get id; String get exerciseId; int get order; EffectiveRx get effectiveRx; EffectiveRx? get plannedRx; String? get movementPattern; ExecutionItemStatus get status;/// ReadinessMod codes applied to this item, e.g. `reduce_volume`.
 List<String> get appliedModifications;/// Null when the movement is missing or no longer PT-reviewed.
 ExerciseDetail? get exercise;/// Interval steps for a structured cardio prescription; empty for a simple
/// one, which is then driven by [effectiveRx] alone.
 List<CardioBlock> get blocks;
/// Create a copy of ExecutionItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionItemCopyWith<ExecutionItem> get copyWith => _$ExecutionItemCopyWithImpl<ExecutionItem>(this as ExecutionItem, _$identity);

  /// Serializes this ExecutionItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionItem&&(identical(other.id, id) || other.id == id)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.order, order) || other.order == order)&&(identical(other.effectiveRx, effectiveRx) || other.effectiveRx == effectiveRx)&&(identical(other.plannedRx, plannedRx) || other.plannedRx == plannedRx)&&(identical(other.movementPattern, movementPattern) || other.movementPattern == movementPattern)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.appliedModifications, appliedModifications)&&(identical(other.exercise, exercise) || other.exercise == exercise)&&const DeepCollectionEquality().equals(other.blocks, blocks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,exerciseId,order,effectiveRx,plannedRx,movementPattern,status,const DeepCollectionEquality().hash(appliedModifications),exercise,const DeepCollectionEquality().hash(blocks));

@override
String toString() {
  return 'ExecutionItem(id: $id, exerciseId: $exerciseId, order: $order, effectiveRx: $effectiveRx, plannedRx: $plannedRx, movementPattern: $movementPattern, status: $status, appliedModifications: $appliedModifications, exercise: $exercise, blocks: $blocks)';
}


}

/// @nodoc
abstract mixin class $ExecutionItemCopyWith<$Res>  {
  factory $ExecutionItemCopyWith(ExecutionItem value, $Res Function(ExecutionItem) _then) = _$ExecutionItemCopyWithImpl;
@useResult
$Res call({
 String id, String exerciseId, int order, EffectiveRx effectiveRx, EffectiveRx? plannedRx, String? movementPattern, ExecutionItemStatus status, List<String> appliedModifications, ExerciseDetail? exercise, List<CardioBlock> blocks
});


$EffectiveRxCopyWith<$Res> get effectiveRx;$EffectiveRxCopyWith<$Res>? get plannedRx;$ExerciseDetailCopyWith<$Res>? get exercise;

}
/// @nodoc
class _$ExecutionItemCopyWithImpl<$Res>
    implements $ExecutionItemCopyWith<$Res> {
  _$ExecutionItemCopyWithImpl(this._self, this._then);

  final ExecutionItem _self;
  final $Res Function(ExecutionItem) _then;

/// Create a copy of ExecutionItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? exerciseId = null,Object? order = null,Object? effectiveRx = null,Object? plannedRx = freezed,Object? movementPattern = freezed,Object? status = null,Object? appliedModifications = null,Object? exercise = freezed,Object? blocks = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,effectiveRx: null == effectiveRx ? _self.effectiveRx : effectiveRx // ignore: cast_nullable_to_non_nullable
as EffectiveRx,plannedRx: freezed == plannedRx ? _self.plannedRx : plannedRx // ignore: cast_nullable_to_non_nullable
as EffectiveRx?,movementPattern: freezed == movementPattern ? _self.movementPattern : movementPattern // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ExecutionItemStatus,appliedModifications: null == appliedModifications ? _self.appliedModifications : appliedModifications // ignore: cast_nullable_to_non_nullable
as List<String>,exercise: freezed == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as ExerciseDetail?,blocks: null == blocks ? _self.blocks : blocks // ignore: cast_nullable_to_non_nullable
as List<CardioBlock>,
  ));
}
/// Create a copy of ExecutionItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EffectiveRxCopyWith<$Res> get effectiveRx {
  
  return $EffectiveRxCopyWith<$Res>(_self.effectiveRx, (value) {
    return _then(_self.copyWith(effectiveRx: value));
  });
}/// Create a copy of ExecutionItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EffectiveRxCopyWith<$Res>? get plannedRx {
    if (_self.plannedRx == null) {
    return null;
  }

  return $EffectiveRxCopyWith<$Res>(_self.plannedRx!, (value) {
    return _then(_self.copyWith(plannedRx: value));
  });
}/// Create a copy of ExecutionItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExerciseDetailCopyWith<$Res>? get exercise {
    if (_self.exercise == null) {
    return null;
  }

  return $ExerciseDetailCopyWith<$Res>(_self.exercise!, (value) {
    return _then(_self.copyWith(exercise: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExecutionItem].
extension ExecutionItemPatterns on ExecutionItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExecutionItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExecutionItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExecutionItem value)  $default,){
final _that = this;
switch (_that) {
case _ExecutionItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExecutionItem value)?  $default,){
final _that = this;
switch (_that) {
case _ExecutionItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String exerciseId,  int order,  EffectiveRx effectiveRx,  EffectiveRx? plannedRx,  String? movementPattern,  ExecutionItemStatus status,  List<String> appliedModifications,  ExerciseDetail? exercise,  List<CardioBlock> blocks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExecutionItem() when $default != null:
return $default(_that.id,_that.exerciseId,_that.order,_that.effectiveRx,_that.plannedRx,_that.movementPattern,_that.status,_that.appliedModifications,_that.exercise,_that.blocks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String exerciseId,  int order,  EffectiveRx effectiveRx,  EffectiveRx? plannedRx,  String? movementPattern,  ExecutionItemStatus status,  List<String> appliedModifications,  ExerciseDetail? exercise,  List<CardioBlock> blocks)  $default,) {final _that = this;
switch (_that) {
case _ExecutionItem():
return $default(_that.id,_that.exerciseId,_that.order,_that.effectiveRx,_that.plannedRx,_that.movementPattern,_that.status,_that.appliedModifications,_that.exercise,_that.blocks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String exerciseId,  int order,  EffectiveRx effectiveRx,  EffectiveRx? plannedRx,  String? movementPattern,  ExecutionItemStatus status,  List<String> appliedModifications,  ExerciseDetail? exercise,  List<CardioBlock> blocks)?  $default,) {final _that = this;
switch (_that) {
case _ExecutionItem() when $default != null:
return $default(_that.id,_that.exerciseId,_that.order,_that.effectiveRx,_that.plannedRx,_that.movementPattern,_that.status,_that.appliedModifications,_that.exercise,_that.blocks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExecutionItem extends ExecutionItem {
  const _ExecutionItem({required this.id, required this.exerciseId, required this.order, required this.effectiveRx, this.plannedRx, this.movementPattern, this.status = ExecutionItemStatus.planned, final  List<String> appliedModifications = const <String>[], this.exercise, final  List<CardioBlock> blocks = const <CardioBlock>[]}): _appliedModifications = appliedModifications,_blocks = blocks,super._();
  factory _ExecutionItem.fromJson(Map<String, dynamic> json) => _$ExecutionItemFromJson(json);

@override final  String id;
@override final  String exerciseId;
@override final  int order;
@override final  EffectiveRx effectiveRx;
@override final  EffectiveRx? plannedRx;
@override final  String? movementPattern;
@override@JsonKey() final  ExecutionItemStatus status;
/// ReadinessMod codes applied to this item, e.g. `reduce_volume`.
 final  List<String> _appliedModifications;
/// ReadinessMod codes applied to this item, e.g. `reduce_volume`.
@override@JsonKey() List<String> get appliedModifications {
  if (_appliedModifications is EqualUnmodifiableListView) return _appliedModifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appliedModifications);
}

/// Null when the movement is missing or no longer PT-reviewed.
@override final  ExerciseDetail? exercise;
/// Interval steps for a structured cardio prescription; empty for a simple
/// one, which is then driven by [effectiveRx] alone.
 final  List<CardioBlock> _blocks;
/// Interval steps for a structured cardio prescription; empty for a simple
/// one, which is then driven by [effectiveRx] alone.
@override@JsonKey() List<CardioBlock> get blocks {
  if (_blocks is EqualUnmodifiableListView) return _blocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blocks);
}


/// Create a copy of ExecutionItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExecutionItemCopyWith<_ExecutionItem> get copyWith => __$ExecutionItemCopyWithImpl<_ExecutionItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExecutionItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExecutionItem&&(identical(other.id, id) || other.id == id)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.order, order) || other.order == order)&&(identical(other.effectiveRx, effectiveRx) || other.effectiveRx == effectiveRx)&&(identical(other.plannedRx, plannedRx) || other.plannedRx == plannedRx)&&(identical(other.movementPattern, movementPattern) || other.movementPattern == movementPattern)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._appliedModifications, _appliedModifications)&&(identical(other.exercise, exercise) || other.exercise == exercise)&&const DeepCollectionEquality().equals(other._blocks, _blocks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,exerciseId,order,effectiveRx,plannedRx,movementPattern,status,const DeepCollectionEquality().hash(_appliedModifications),exercise,const DeepCollectionEquality().hash(_blocks));

@override
String toString() {
  return 'ExecutionItem(id: $id, exerciseId: $exerciseId, order: $order, effectiveRx: $effectiveRx, plannedRx: $plannedRx, movementPattern: $movementPattern, status: $status, appliedModifications: $appliedModifications, exercise: $exercise, blocks: $blocks)';
}


}

/// @nodoc
abstract mixin class _$ExecutionItemCopyWith<$Res> implements $ExecutionItemCopyWith<$Res> {
  factory _$ExecutionItemCopyWith(_ExecutionItem value, $Res Function(_ExecutionItem) _then) = __$ExecutionItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String exerciseId, int order, EffectiveRx effectiveRx, EffectiveRx? plannedRx, String? movementPattern, ExecutionItemStatus status, List<String> appliedModifications, ExerciseDetail? exercise, List<CardioBlock> blocks
});


@override $EffectiveRxCopyWith<$Res> get effectiveRx;@override $EffectiveRxCopyWith<$Res>? get plannedRx;@override $ExerciseDetailCopyWith<$Res>? get exercise;

}
/// @nodoc
class __$ExecutionItemCopyWithImpl<$Res>
    implements _$ExecutionItemCopyWith<$Res> {
  __$ExecutionItemCopyWithImpl(this._self, this._then);

  final _ExecutionItem _self;
  final $Res Function(_ExecutionItem) _then;

/// Create a copy of ExecutionItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? exerciseId = null,Object? order = null,Object? effectiveRx = null,Object? plannedRx = freezed,Object? movementPattern = freezed,Object? status = null,Object? appliedModifications = null,Object? exercise = freezed,Object? blocks = null,}) {
  return _then(_ExecutionItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,effectiveRx: null == effectiveRx ? _self.effectiveRx : effectiveRx // ignore: cast_nullable_to_non_nullable
as EffectiveRx,plannedRx: freezed == plannedRx ? _self.plannedRx : plannedRx // ignore: cast_nullable_to_non_nullable
as EffectiveRx?,movementPattern: freezed == movementPattern ? _self.movementPattern : movementPattern // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ExecutionItemStatus,appliedModifications: null == appliedModifications ? _self._appliedModifications : appliedModifications // ignore: cast_nullable_to_non_nullable
as List<String>,exercise: freezed == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as ExerciseDetail?,blocks: null == blocks ? _self._blocks : blocks // ignore: cast_nullable_to_non_nullable
as List<CardioBlock>,
  ));
}

/// Create a copy of ExecutionItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EffectiveRxCopyWith<$Res> get effectiveRx {
  
  return $EffectiveRxCopyWith<$Res>(_self.effectiveRx, (value) {
    return _then(_self.copyWith(effectiveRx: value));
  });
}/// Create a copy of ExecutionItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EffectiveRxCopyWith<$Res>? get plannedRx {
    if (_self.plannedRx == null) {
    return null;
  }

  return $EffectiveRxCopyWith<$Res>(_self.plannedRx!, (value) {
    return _then(_self.copyWith(plannedRx: value));
  });
}/// Create a copy of ExecutionItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExerciseDetailCopyWith<$Res>? get exercise {
    if (_self.exercise == null) {
    return null;
  }

  return $ExerciseDetailCopyWith<$Res>(_self.exercise!, (value) {
    return _then(_self.copyWith(exercise: value));
  });
}
}


/// @nodoc
mixin _$CardioBlock {

 int get order; BlockPhase get phase; int? get durationSec; int? get distanceM; int? get targetRpeMin; int? get targetRpeMax; double? get targetPaceSecPerKm; String get instruction;
/// Create a copy of CardioBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardioBlockCopyWith<CardioBlock> get copyWith => _$CardioBlockCopyWithImpl<CardioBlock>(this as CardioBlock, _$identity);

  /// Serializes this CardioBlock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardioBlock&&(identical(other.order, order) || other.order == order)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.durationSec, durationSec) || other.durationSec == durationSec)&&(identical(other.distanceM, distanceM) || other.distanceM == distanceM)&&(identical(other.targetRpeMin, targetRpeMin) || other.targetRpeMin == targetRpeMin)&&(identical(other.targetRpeMax, targetRpeMax) || other.targetRpeMax == targetRpeMax)&&(identical(other.targetPaceSecPerKm, targetPaceSecPerKm) || other.targetPaceSecPerKm == targetPaceSecPerKm)&&(identical(other.instruction, instruction) || other.instruction == instruction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,order,phase,durationSec,distanceM,targetRpeMin,targetRpeMax,targetPaceSecPerKm,instruction);

@override
String toString() {
  return 'CardioBlock(order: $order, phase: $phase, durationSec: $durationSec, distanceM: $distanceM, targetRpeMin: $targetRpeMin, targetRpeMax: $targetRpeMax, targetPaceSecPerKm: $targetPaceSecPerKm, instruction: $instruction)';
}


}

/// @nodoc
abstract mixin class $CardioBlockCopyWith<$Res>  {
  factory $CardioBlockCopyWith(CardioBlock value, $Res Function(CardioBlock) _then) = _$CardioBlockCopyWithImpl;
@useResult
$Res call({
 int order, BlockPhase phase, int? durationSec, int? distanceM, int? targetRpeMin, int? targetRpeMax, double? targetPaceSecPerKm, String instruction
});




}
/// @nodoc
class _$CardioBlockCopyWithImpl<$Res>
    implements $CardioBlockCopyWith<$Res> {
  _$CardioBlockCopyWithImpl(this._self, this._then);

  final CardioBlock _self;
  final $Res Function(CardioBlock) _then;

/// Create a copy of CardioBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? order = null,Object? phase = null,Object? durationSec = freezed,Object? distanceM = freezed,Object? targetRpeMin = freezed,Object? targetRpeMax = freezed,Object? targetPaceSecPerKm = freezed,Object? instruction = null,}) {
  return _then(_self.copyWith(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as BlockPhase,durationSec: freezed == durationSec ? _self.durationSec : durationSec // ignore: cast_nullable_to_non_nullable
as int?,distanceM: freezed == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as int?,targetRpeMin: freezed == targetRpeMin ? _self.targetRpeMin : targetRpeMin // ignore: cast_nullable_to_non_nullable
as int?,targetRpeMax: freezed == targetRpeMax ? _self.targetRpeMax : targetRpeMax // ignore: cast_nullable_to_non_nullable
as int?,targetPaceSecPerKm: freezed == targetPaceSecPerKm ? _self.targetPaceSecPerKm : targetPaceSecPerKm // ignore: cast_nullable_to_non_nullable
as double?,instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CardioBlock].
extension CardioBlockPatterns on CardioBlock {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardioBlock value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardioBlock() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardioBlock value)  $default,){
final _that = this;
switch (_that) {
case _CardioBlock():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardioBlock value)?  $default,){
final _that = this;
switch (_that) {
case _CardioBlock() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int order,  BlockPhase phase,  int? durationSec,  int? distanceM,  int? targetRpeMin,  int? targetRpeMax,  double? targetPaceSecPerKm,  String instruction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardioBlock() when $default != null:
return $default(_that.order,_that.phase,_that.durationSec,_that.distanceM,_that.targetRpeMin,_that.targetRpeMax,_that.targetPaceSecPerKm,_that.instruction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int order,  BlockPhase phase,  int? durationSec,  int? distanceM,  int? targetRpeMin,  int? targetRpeMax,  double? targetPaceSecPerKm,  String instruction)  $default,) {final _that = this;
switch (_that) {
case _CardioBlock():
return $default(_that.order,_that.phase,_that.durationSec,_that.distanceM,_that.targetRpeMin,_that.targetRpeMax,_that.targetPaceSecPerKm,_that.instruction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int order,  BlockPhase phase,  int? durationSec,  int? distanceM,  int? targetRpeMin,  int? targetRpeMax,  double? targetPaceSecPerKm,  String instruction)?  $default,) {final _that = this;
switch (_that) {
case _CardioBlock() when $default != null:
return $default(_that.order,_that.phase,_that.durationSec,_that.distanceM,_that.targetRpeMin,_that.targetRpeMax,_that.targetPaceSecPerKm,_that.instruction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardioBlock extends CardioBlock {
  const _CardioBlock({required this.order, this.phase = BlockPhase.work, this.durationSec, this.distanceM, this.targetRpeMin, this.targetRpeMax, this.targetPaceSecPerKm, this.instruction = ''}): super._();
  factory _CardioBlock.fromJson(Map<String, dynamic> json) => _$CardioBlockFromJson(json);

@override final  int order;
@override@JsonKey() final  BlockPhase phase;
@override final  int? durationSec;
@override final  int? distanceM;
@override final  int? targetRpeMin;
@override final  int? targetRpeMax;
@override final  double? targetPaceSecPerKm;
@override@JsonKey() final  String instruction;

/// Create a copy of CardioBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardioBlockCopyWith<_CardioBlock> get copyWith => __$CardioBlockCopyWithImpl<_CardioBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardioBlockToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardioBlock&&(identical(other.order, order) || other.order == order)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.durationSec, durationSec) || other.durationSec == durationSec)&&(identical(other.distanceM, distanceM) || other.distanceM == distanceM)&&(identical(other.targetRpeMin, targetRpeMin) || other.targetRpeMin == targetRpeMin)&&(identical(other.targetRpeMax, targetRpeMax) || other.targetRpeMax == targetRpeMax)&&(identical(other.targetPaceSecPerKm, targetPaceSecPerKm) || other.targetPaceSecPerKm == targetPaceSecPerKm)&&(identical(other.instruction, instruction) || other.instruction == instruction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,order,phase,durationSec,distanceM,targetRpeMin,targetRpeMax,targetPaceSecPerKm,instruction);

@override
String toString() {
  return 'CardioBlock(order: $order, phase: $phase, durationSec: $durationSec, distanceM: $distanceM, targetRpeMin: $targetRpeMin, targetRpeMax: $targetRpeMax, targetPaceSecPerKm: $targetPaceSecPerKm, instruction: $instruction)';
}


}

/// @nodoc
abstract mixin class _$CardioBlockCopyWith<$Res> implements $CardioBlockCopyWith<$Res> {
  factory _$CardioBlockCopyWith(_CardioBlock value, $Res Function(_CardioBlock) _then) = __$CardioBlockCopyWithImpl;
@override @useResult
$Res call({
 int order, BlockPhase phase, int? durationSec, int? distanceM, int? targetRpeMin, int? targetRpeMax, double? targetPaceSecPerKm, String instruction
});




}
/// @nodoc
class __$CardioBlockCopyWithImpl<$Res>
    implements _$CardioBlockCopyWith<$Res> {
  __$CardioBlockCopyWithImpl(this._self, this._then);

  final _CardioBlock _self;
  final $Res Function(_CardioBlock) _then;

/// Create a copy of CardioBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? order = null,Object? phase = null,Object? durationSec = freezed,Object? distanceM = freezed,Object? targetRpeMin = freezed,Object? targetRpeMax = freezed,Object? targetPaceSecPerKm = freezed,Object? instruction = null,}) {
  return _then(_CardioBlock(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as BlockPhase,durationSec: freezed == durationSec ? _self.durationSec : durationSec // ignore: cast_nullable_to_non_nullable
as int?,distanceM: freezed == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as int?,targetRpeMin: freezed == targetRpeMin ? _self.targetRpeMin : targetRpeMin // ignore: cast_nullable_to_non_nullable
as int?,targetRpeMax: freezed == targetRpeMax ? _self.targetRpeMax : targetRpeMax // ignore: cast_nullable_to_non_nullable
as int?,targetPaceSecPerKm: freezed == targetPaceSecPerKm ? _self.targetPaceSecPerKm : targetPaceSecPerKm // ignore: cast_nullable_to_non_nullable
as double?,instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ExecutionSnapshot {

 List<ExecutionItem> get items; String? get ruleVersion;
/// Create a copy of ExecutionSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExecutionSnapshotCopyWith<ExecutionSnapshot> get copyWith => _$ExecutionSnapshotCopyWithImpl<ExecutionSnapshot>(this as ExecutionSnapshot, _$identity);

  /// Serializes this ExecutionSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExecutionSnapshot&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.ruleVersion, ruleVersion) || other.ruleVersion == ruleVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),ruleVersion);

@override
String toString() {
  return 'ExecutionSnapshot(items: $items, ruleVersion: $ruleVersion)';
}


}

/// @nodoc
abstract mixin class $ExecutionSnapshotCopyWith<$Res>  {
  factory $ExecutionSnapshotCopyWith(ExecutionSnapshot value, $Res Function(ExecutionSnapshot) _then) = _$ExecutionSnapshotCopyWithImpl;
@useResult
$Res call({
 List<ExecutionItem> items, String? ruleVersion
});




}
/// @nodoc
class _$ExecutionSnapshotCopyWithImpl<$Res>
    implements $ExecutionSnapshotCopyWith<$Res> {
  _$ExecutionSnapshotCopyWithImpl(this._self, this._then);

  final ExecutionSnapshot _self;
  final $Res Function(ExecutionSnapshot) _then;

/// Create a copy of ExecutionSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? ruleVersion = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ExecutionItem>,ruleVersion: freezed == ruleVersion ? _self.ruleVersion : ruleVersion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExecutionSnapshot].
extension ExecutionSnapshotPatterns on ExecutionSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExecutionSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExecutionSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExecutionSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _ExecutionSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExecutionSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _ExecutionSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ExecutionItem> items,  String? ruleVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExecutionSnapshot() when $default != null:
return $default(_that.items,_that.ruleVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ExecutionItem> items,  String? ruleVersion)  $default,) {final _that = this;
switch (_that) {
case _ExecutionSnapshot():
return $default(_that.items,_that.ruleVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ExecutionItem> items,  String? ruleVersion)?  $default,) {final _that = this;
switch (_that) {
case _ExecutionSnapshot() when $default != null:
return $default(_that.items,_that.ruleVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExecutionSnapshot implements ExecutionSnapshot {
  const _ExecutionSnapshot({final  List<ExecutionItem> items = const <ExecutionItem>[], this.ruleVersion}): _items = items;
  factory _ExecutionSnapshot.fromJson(Map<String, dynamic> json) => _$ExecutionSnapshotFromJson(json);

 final  List<ExecutionItem> _items;
@override@JsonKey() List<ExecutionItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? ruleVersion;

/// Create a copy of ExecutionSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExecutionSnapshotCopyWith<_ExecutionSnapshot> get copyWith => __$ExecutionSnapshotCopyWithImpl<_ExecutionSnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExecutionSnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExecutionSnapshot&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.ruleVersion, ruleVersion) || other.ruleVersion == ruleVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),ruleVersion);

@override
String toString() {
  return 'ExecutionSnapshot(items: $items, ruleVersion: $ruleVersion)';
}


}

/// @nodoc
abstract mixin class _$ExecutionSnapshotCopyWith<$Res> implements $ExecutionSnapshotCopyWith<$Res> {
  factory _$ExecutionSnapshotCopyWith(_ExecutionSnapshot value, $Res Function(_ExecutionSnapshot) _then) = __$ExecutionSnapshotCopyWithImpl;
@override @useResult
$Res call({
 List<ExecutionItem> items, String? ruleVersion
});




}
/// @nodoc
class __$ExecutionSnapshotCopyWithImpl<$Res>
    implements _$ExecutionSnapshotCopyWith<$Res> {
  __$ExecutionSnapshotCopyWithImpl(this._self, this._then);

  final _ExecutionSnapshot _self;
  final $Res Function(_ExecutionSnapshot) _then;

/// Create a copy of ExecutionSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? ruleVersion = freezed,}) {
  return _then(_ExecutionSnapshot(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ExecutionItem>,ruleVersion: freezed == ruleVersion ? _self.ruleVersion : ruleVersion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Discomfort {

 String get bodyArea; String get severity; bool get affectsNormalMovement;
/// Create a copy of Discomfort
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscomfortCopyWith<Discomfort> get copyWith => _$DiscomfortCopyWithImpl<Discomfort>(this as Discomfort, _$identity);

  /// Serializes this Discomfort to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Discomfort&&(identical(other.bodyArea, bodyArea) || other.bodyArea == bodyArea)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.affectsNormalMovement, affectsNormalMovement) || other.affectsNormalMovement == affectsNormalMovement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bodyArea,severity,affectsNormalMovement);

@override
String toString() {
  return 'Discomfort(bodyArea: $bodyArea, severity: $severity, affectsNormalMovement: $affectsNormalMovement)';
}


}

/// @nodoc
abstract mixin class $DiscomfortCopyWith<$Res>  {
  factory $DiscomfortCopyWith(Discomfort value, $Res Function(Discomfort) _then) = _$DiscomfortCopyWithImpl;
@useResult
$Res call({
 String bodyArea, String severity, bool affectsNormalMovement
});




}
/// @nodoc
class _$DiscomfortCopyWithImpl<$Res>
    implements $DiscomfortCopyWith<$Res> {
  _$DiscomfortCopyWithImpl(this._self, this._then);

  final Discomfort _self;
  final $Res Function(Discomfort) _then;

/// Create a copy of Discomfort
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bodyArea = null,Object? severity = null,Object? affectsNormalMovement = null,}) {
  return _then(_self.copyWith(
bodyArea: null == bodyArea ? _self.bodyArea : bodyArea // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,affectsNormalMovement: null == affectsNormalMovement ? _self.affectsNormalMovement : affectsNormalMovement // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Discomfort].
extension DiscomfortPatterns on Discomfort {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Discomfort value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Discomfort() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Discomfort value)  $default,){
final _that = this;
switch (_that) {
case _Discomfort():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Discomfort value)?  $default,){
final _that = this;
switch (_that) {
case _Discomfort() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bodyArea,  String severity,  bool affectsNormalMovement)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Discomfort() when $default != null:
return $default(_that.bodyArea,_that.severity,_that.affectsNormalMovement);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bodyArea,  String severity,  bool affectsNormalMovement)  $default,) {final _that = this;
switch (_that) {
case _Discomfort():
return $default(_that.bodyArea,_that.severity,_that.affectsNormalMovement);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bodyArea,  String severity,  bool affectsNormalMovement)?  $default,) {final _that = this;
switch (_that) {
case _Discomfort() when $default != null:
return $default(_that.bodyArea,_that.severity,_that.affectsNormalMovement);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Discomfort implements Discomfort {
  const _Discomfort({required this.bodyArea, required this.severity, this.affectsNormalMovement = false});
  factory _Discomfort.fromJson(Map<String, dynamic> json) => _$DiscomfortFromJson(json);

@override final  String bodyArea;
@override final  String severity;
@override@JsonKey() final  bool affectsNormalMovement;

/// Create a copy of Discomfort
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscomfortCopyWith<_Discomfort> get copyWith => __$DiscomfortCopyWithImpl<_Discomfort>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiscomfortToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Discomfort&&(identical(other.bodyArea, bodyArea) || other.bodyArea == bodyArea)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.affectsNormalMovement, affectsNormalMovement) || other.affectsNormalMovement == affectsNormalMovement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bodyArea,severity,affectsNormalMovement);

@override
String toString() {
  return 'Discomfort(bodyArea: $bodyArea, severity: $severity, affectsNormalMovement: $affectsNormalMovement)';
}


}

/// @nodoc
abstract mixin class _$DiscomfortCopyWith<$Res> implements $DiscomfortCopyWith<$Res> {
  factory _$DiscomfortCopyWith(_Discomfort value, $Res Function(_Discomfort) _then) = __$DiscomfortCopyWithImpl;
@override @useResult
$Res call({
 String bodyArea, String severity, bool affectsNormalMovement
});




}
/// @nodoc
class __$DiscomfortCopyWithImpl<$Res>
    implements _$DiscomfortCopyWith<$Res> {
  __$DiscomfortCopyWithImpl(this._self, this._then);

  final _Discomfort _self;
  final $Res Function(_Discomfort) _then;

/// Create a copy of Discomfort
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bodyArea = null,Object? severity = null,Object? affectsNormalMovement = null,}) {
  return _then(_Discomfort(
bodyArea: null == bodyArea ? _self.bodyArea : bodyArea // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,affectsNormalMovement: null == affectsNormalMovement ? _self.affectsNormalMovement : affectsNormalMovement // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ReadinessResult {

 ReadinessVerdict get verdict; List<Map<String, dynamic>> get modifications; String? get ruleVersion;
/// Create a copy of ReadinessResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadinessResultCopyWith<ReadinessResult> get copyWith => _$ReadinessResultCopyWithImpl<ReadinessResult>(this as ReadinessResult, _$identity);

  /// Serializes this ReadinessResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadinessResult&&(identical(other.verdict, verdict) || other.verdict == verdict)&&const DeepCollectionEquality().equals(other.modifications, modifications)&&(identical(other.ruleVersion, ruleVersion) || other.ruleVersion == ruleVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verdict,const DeepCollectionEquality().hash(modifications),ruleVersion);

@override
String toString() {
  return 'ReadinessResult(verdict: $verdict, modifications: $modifications, ruleVersion: $ruleVersion)';
}


}

/// @nodoc
abstract mixin class $ReadinessResultCopyWith<$Res>  {
  factory $ReadinessResultCopyWith(ReadinessResult value, $Res Function(ReadinessResult) _then) = _$ReadinessResultCopyWithImpl;
@useResult
$Res call({
 ReadinessVerdict verdict, List<Map<String, dynamic>> modifications, String? ruleVersion
});




}
/// @nodoc
class _$ReadinessResultCopyWithImpl<$Res>
    implements $ReadinessResultCopyWith<$Res> {
  _$ReadinessResultCopyWithImpl(this._self, this._then);

  final ReadinessResult _self;
  final $Res Function(ReadinessResult) _then;

/// Create a copy of ReadinessResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verdict = null,Object? modifications = null,Object? ruleVersion = freezed,}) {
  return _then(_self.copyWith(
verdict: null == verdict ? _self.verdict : verdict // ignore: cast_nullable_to_non_nullable
as ReadinessVerdict,modifications: null == modifications ? _self.modifications : modifications // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,ruleVersion: freezed == ruleVersion ? _self.ruleVersion : ruleVersion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReadinessResult].
extension ReadinessResultPatterns on ReadinessResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReadinessResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReadinessResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReadinessResult value)  $default,){
final _that = this;
switch (_that) {
case _ReadinessResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReadinessResult value)?  $default,){
final _that = this;
switch (_that) {
case _ReadinessResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReadinessVerdict verdict,  List<Map<String, dynamic>> modifications,  String? ruleVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadinessResult() when $default != null:
return $default(_that.verdict,_that.modifications,_that.ruleVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReadinessVerdict verdict,  List<Map<String, dynamic>> modifications,  String? ruleVersion)  $default,) {final _that = this;
switch (_that) {
case _ReadinessResult():
return $default(_that.verdict,_that.modifications,_that.ruleVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReadinessVerdict verdict,  List<Map<String, dynamic>> modifications,  String? ruleVersion)?  $default,) {final _that = this;
switch (_that) {
case _ReadinessResult() when $default != null:
return $default(_that.verdict,_that.modifications,_that.ruleVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReadinessResult extends ReadinessResult {
  const _ReadinessResult({this.verdict = ReadinessVerdict.unknown, final  List<Map<String, dynamic>> modifications = const <Map<String, dynamic>>[], this.ruleVersion}): _modifications = modifications,super._();
  factory _ReadinessResult.fromJson(Map<String, dynamic> json) => _$ReadinessResultFromJson(json);

@override@JsonKey() final  ReadinessVerdict verdict;
 final  List<Map<String, dynamic>> _modifications;
@override@JsonKey() List<Map<String, dynamic>> get modifications {
  if (_modifications is EqualUnmodifiableListView) return _modifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_modifications);
}

@override final  String? ruleVersion;

/// Create a copy of ReadinessResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadinessResultCopyWith<_ReadinessResult> get copyWith => __$ReadinessResultCopyWithImpl<_ReadinessResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReadinessResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadinessResult&&(identical(other.verdict, verdict) || other.verdict == verdict)&&const DeepCollectionEquality().equals(other._modifications, _modifications)&&(identical(other.ruleVersion, ruleVersion) || other.ruleVersion == ruleVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verdict,const DeepCollectionEquality().hash(_modifications),ruleVersion);

@override
String toString() {
  return 'ReadinessResult(verdict: $verdict, modifications: $modifications, ruleVersion: $ruleVersion)';
}


}

/// @nodoc
abstract mixin class _$ReadinessResultCopyWith<$Res> implements $ReadinessResultCopyWith<$Res> {
  factory _$ReadinessResultCopyWith(_ReadinessResult value, $Res Function(_ReadinessResult) _then) = __$ReadinessResultCopyWithImpl;
@override @useResult
$Res call({
 ReadinessVerdict verdict, List<Map<String, dynamic>> modifications, String? ruleVersion
});




}
/// @nodoc
class __$ReadinessResultCopyWithImpl<$Res>
    implements _$ReadinessResultCopyWith<$Res> {
  __$ReadinessResultCopyWithImpl(this._self, this._then);

  final _ReadinessResult _self;
  final $Res Function(_ReadinessResult) _then;

/// Create a copy of ReadinessResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verdict = null,Object? modifications = null,Object? ruleVersion = freezed,}) {
  return _then(_ReadinessResult(
verdict: null == verdict ? _self.verdict : verdict // ignore: cast_nullable_to_non_nullable
as ReadinessVerdict,modifications: null == modifications ? _self._modifications : modifications // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,ruleVersion: freezed == ruleVersion ? _self.ruleVersion : ruleVersion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
