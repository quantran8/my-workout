// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramResponse {

 String get programId; String get goalSummary; List<ProgramPhase> get phasePlan; ProgramNutrition? get nutrition; ProgramRevision get revision;
/// Create a copy of ProgramResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramResponseCopyWith<ProgramResponse> get copyWith => _$ProgramResponseCopyWithImpl<ProgramResponse>(this as ProgramResponse, _$identity);

  /// Serializes this ProgramResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramResponse&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.goalSummary, goalSummary) || other.goalSummary == goalSummary)&&const DeepCollectionEquality().equals(other.phasePlan, phasePlan)&&(identical(other.nutrition, nutrition) || other.nutrition == nutrition)&&(identical(other.revision, revision) || other.revision == revision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,programId,goalSummary,const DeepCollectionEquality().hash(phasePlan),nutrition,revision);

@override
String toString() {
  return 'ProgramResponse(programId: $programId, goalSummary: $goalSummary, phasePlan: $phasePlan, nutrition: $nutrition, revision: $revision)';
}


}

/// @nodoc
abstract mixin class $ProgramResponseCopyWith<$Res>  {
  factory $ProgramResponseCopyWith(ProgramResponse value, $Res Function(ProgramResponse) _then) = _$ProgramResponseCopyWithImpl;
@useResult
$Res call({
 String programId, String goalSummary, List<ProgramPhase> phasePlan, ProgramNutrition? nutrition, ProgramRevision revision
});


$ProgramNutritionCopyWith<$Res>? get nutrition;$ProgramRevisionCopyWith<$Res> get revision;

}
/// @nodoc
class _$ProgramResponseCopyWithImpl<$Res>
    implements $ProgramResponseCopyWith<$Res> {
  _$ProgramResponseCopyWithImpl(this._self, this._then);

  final ProgramResponse _self;
  final $Res Function(ProgramResponse) _then;

/// Create a copy of ProgramResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? programId = null,Object? goalSummary = null,Object? phasePlan = null,Object? nutrition = freezed,Object? revision = null,}) {
  return _then(_self.copyWith(
programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,goalSummary: null == goalSummary ? _self.goalSummary : goalSummary // ignore: cast_nullable_to_non_nullable
as String,phasePlan: null == phasePlan ? _self.phasePlan : phasePlan // ignore: cast_nullable_to_non_nullable
as List<ProgramPhase>,nutrition: freezed == nutrition ? _self.nutrition : nutrition // ignore: cast_nullable_to_non_nullable
as ProgramNutrition?,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as ProgramRevision,
  ));
}
/// Create a copy of ProgramResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramNutritionCopyWith<$Res>? get nutrition {
    if (_self.nutrition == null) {
    return null;
  }

  return $ProgramNutritionCopyWith<$Res>(_self.nutrition!, (value) {
    return _then(_self.copyWith(nutrition: value));
  });
}/// Create a copy of ProgramResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramRevisionCopyWith<$Res> get revision {
  
  return $ProgramRevisionCopyWith<$Res>(_self.revision, (value) {
    return _then(_self.copyWith(revision: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProgramResponse].
extension ProgramResponsePatterns on ProgramResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProgramResponse():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String programId,  String goalSummary,  List<ProgramPhase> phasePlan,  ProgramNutrition? nutrition,  ProgramRevision revision)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramResponse() when $default != null:
return $default(_that.programId,_that.goalSummary,_that.phasePlan,_that.nutrition,_that.revision);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String programId,  String goalSummary,  List<ProgramPhase> phasePlan,  ProgramNutrition? nutrition,  ProgramRevision revision)  $default,) {final _that = this;
switch (_that) {
case _ProgramResponse():
return $default(_that.programId,_that.goalSummary,_that.phasePlan,_that.nutrition,_that.revision);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String programId,  String goalSummary,  List<ProgramPhase> phasePlan,  ProgramNutrition? nutrition,  ProgramRevision revision)?  $default,) {final _that = this;
switch (_that) {
case _ProgramResponse() when $default != null:
return $default(_that.programId,_that.goalSummary,_that.phasePlan,_that.nutrition,_that.revision);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramResponse implements ProgramResponse {
  const _ProgramResponse({required this.programId, required this.goalSummary, final  List<ProgramPhase> phasePlan = const [], this.nutrition, required this.revision}): _phasePlan = phasePlan;
  factory _ProgramResponse.fromJson(Map<String, dynamic> json) => _$ProgramResponseFromJson(json);

@override final  String programId;
@override final  String goalSummary;
 final  List<ProgramPhase> _phasePlan;
@override@JsonKey() List<ProgramPhase> get phasePlan {
  if (_phasePlan is EqualUnmodifiableListView) return _phasePlan;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phasePlan);
}

@override final  ProgramNutrition? nutrition;
@override final  ProgramRevision revision;

/// Create a copy of ProgramResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramResponseCopyWith<_ProgramResponse> get copyWith => __$ProgramResponseCopyWithImpl<_ProgramResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramResponse&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.goalSummary, goalSummary) || other.goalSummary == goalSummary)&&const DeepCollectionEquality().equals(other._phasePlan, _phasePlan)&&(identical(other.nutrition, nutrition) || other.nutrition == nutrition)&&(identical(other.revision, revision) || other.revision == revision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,programId,goalSummary,const DeepCollectionEquality().hash(_phasePlan),nutrition,revision);

@override
String toString() {
  return 'ProgramResponse(programId: $programId, goalSummary: $goalSummary, phasePlan: $phasePlan, nutrition: $nutrition, revision: $revision)';
}


}

/// @nodoc
abstract mixin class _$ProgramResponseCopyWith<$Res> implements $ProgramResponseCopyWith<$Res> {
  factory _$ProgramResponseCopyWith(_ProgramResponse value, $Res Function(_ProgramResponse) _then) = __$ProgramResponseCopyWithImpl;
@override @useResult
$Res call({
 String programId, String goalSummary, List<ProgramPhase> phasePlan, ProgramNutrition? nutrition, ProgramRevision revision
});


@override $ProgramNutritionCopyWith<$Res>? get nutrition;@override $ProgramRevisionCopyWith<$Res> get revision;

}
/// @nodoc
class __$ProgramResponseCopyWithImpl<$Res>
    implements _$ProgramResponseCopyWith<$Res> {
  __$ProgramResponseCopyWithImpl(this._self, this._then);

  final _ProgramResponse _self;
  final $Res Function(_ProgramResponse) _then;

/// Create a copy of ProgramResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? programId = null,Object? goalSummary = null,Object? phasePlan = null,Object? nutrition = freezed,Object? revision = null,}) {
  return _then(_ProgramResponse(
programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,goalSummary: null == goalSummary ? _self.goalSummary : goalSummary // ignore: cast_nullable_to_non_nullable
as String,phasePlan: null == phasePlan ? _self._phasePlan : phasePlan // ignore: cast_nullable_to_non_nullable
as List<ProgramPhase>,nutrition: freezed == nutrition ? _self.nutrition : nutrition // ignore: cast_nullable_to_non_nullable
as ProgramNutrition?,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as ProgramRevision,
  ));
}

/// Create a copy of ProgramResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramNutritionCopyWith<$Res>? get nutrition {
    if (_self.nutrition == null) {
    return null;
  }

  return $ProgramNutritionCopyWith<$Res>(_self.nutrition!, (value) {
    return _then(_self.copyWith(nutrition: value));
  });
}/// Create a copy of ProgramResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramRevisionCopyWith<$Res> get revision {
  
  return $ProgramRevisionCopyWith<$Res>(_self.revision, (value) {
    return _then(_self.copyWith(revision: value));
  });
}
}


/// @nodoc
mixin _$ProgramPhase {

 String get phase; List<int> get weeks; String get focus;
/// Create a copy of ProgramPhase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramPhaseCopyWith<ProgramPhase> get copyWith => _$ProgramPhaseCopyWithImpl<ProgramPhase>(this as ProgramPhase, _$identity);

  /// Serializes this ProgramPhase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramPhase&&(identical(other.phase, phase) || other.phase == phase)&&const DeepCollectionEquality().equals(other.weeks, weeks)&&(identical(other.focus, focus) || other.focus == focus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phase,const DeepCollectionEquality().hash(weeks),focus);

@override
String toString() {
  return 'ProgramPhase(phase: $phase, weeks: $weeks, focus: $focus)';
}


}

/// @nodoc
abstract mixin class $ProgramPhaseCopyWith<$Res>  {
  factory $ProgramPhaseCopyWith(ProgramPhase value, $Res Function(ProgramPhase) _then) = _$ProgramPhaseCopyWithImpl;
@useResult
$Res call({
 String phase, List<int> weeks, String focus
});




}
/// @nodoc
class _$ProgramPhaseCopyWithImpl<$Res>
    implements $ProgramPhaseCopyWith<$Res> {
  _$ProgramPhaseCopyWithImpl(this._self, this._then);

  final ProgramPhase _self;
  final $Res Function(ProgramPhase) _then;

/// Create a copy of ProgramPhase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phase = null,Object? weeks = null,Object? focus = null,}) {
  return _then(_self.copyWith(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String,weeks: null == weeks ? _self.weeks : weeks // ignore: cast_nullable_to_non_nullable
as List<int>,focus: null == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramPhase].
extension ProgramPhasePatterns on ProgramPhase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramPhase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramPhase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramPhase value)  $default,){
final _that = this;
switch (_that) {
case _ProgramPhase():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramPhase value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramPhase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phase,  List<int> weeks,  String focus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramPhase() when $default != null:
return $default(_that.phase,_that.weeks,_that.focus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phase,  List<int> weeks,  String focus)  $default,) {final _that = this;
switch (_that) {
case _ProgramPhase():
return $default(_that.phase,_that.weeks,_that.focus);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phase,  List<int> weeks,  String focus)?  $default,) {final _that = this;
switch (_that) {
case _ProgramPhase() when $default != null:
return $default(_that.phase,_that.weeks,_that.focus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramPhase implements ProgramPhase {
  const _ProgramPhase({required this.phase, final  List<int> weeks = const [], required this.focus}): _weeks = weeks;
  factory _ProgramPhase.fromJson(Map<String, dynamic> json) => _$ProgramPhaseFromJson(json);

@override final  String phase;
 final  List<int> _weeks;
@override@JsonKey() List<int> get weeks {
  if (_weeks is EqualUnmodifiableListView) return _weeks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weeks);
}

@override final  String focus;

/// Create a copy of ProgramPhase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramPhaseCopyWith<_ProgramPhase> get copyWith => __$ProgramPhaseCopyWithImpl<_ProgramPhase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramPhaseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramPhase&&(identical(other.phase, phase) || other.phase == phase)&&const DeepCollectionEquality().equals(other._weeks, _weeks)&&(identical(other.focus, focus) || other.focus == focus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phase,const DeepCollectionEquality().hash(_weeks),focus);

@override
String toString() {
  return 'ProgramPhase(phase: $phase, weeks: $weeks, focus: $focus)';
}


}

/// @nodoc
abstract mixin class _$ProgramPhaseCopyWith<$Res> implements $ProgramPhaseCopyWith<$Res> {
  factory _$ProgramPhaseCopyWith(_ProgramPhase value, $Res Function(_ProgramPhase) _then) = __$ProgramPhaseCopyWithImpl;
@override @useResult
$Res call({
 String phase, List<int> weeks, String focus
});




}
/// @nodoc
class __$ProgramPhaseCopyWithImpl<$Res>
    implements _$ProgramPhaseCopyWith<$Res> {
  __$ProgramPhaseCopyWithImpl(this._self, this._then);

  final _ProgramPhase _self;
  final $Res Function(_ProgramPhase) _then;

/// Create a copy of ProgramPhase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phase = null,Object? weeks = null,Object? focus = null,}) {
  return _then(_ProgramPhase(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String,weeks: null == weeks ? _self._weeks : weeks // ignore: cast_nullable_to_non_nullable
as List<int>,focus: null == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProgramNutrition {

 int get calorieLow; int get calorieHigh; int get proteinLow; int get proteinHigh;/// 'surplus' when underweight, 'maintain' otherwise.
 String get intent;
/// Create a copy of ProgramNutrition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramNutritionCopyWith<ProgramNutrition> get copyWith => _$ProgramNutritionCopyWithImpl<ProgramNutrition>(this as ProgramNutrition, _$identity);

  /// Serializes this ProgramNutrition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramNutrition&&(identical(other.calorieLow, calorieLow) || other.calorieLow == calorieLow)&&(identical(other.calorieHigh, calorieHigh) || other.calorieHigh == calorieHigh)&&(identical(other.proteinLow, proteinLow) || other.proteinLow == proteinLow)&&(identical(other.proteinHigh, proteinHigh) || other.proteinHigh == proteinHigh)&&(identical(other.intent, intent) || other.intent == intent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calorieLow,calorieHigh,proteinLow,proteinHigh,intent);

@override
String toString() {
  return 'ProgramNutrition(calorieLow: $calorieLow, calorieHigh: $calorieHigh, proteinLow: $proteinLow, proteinHigh: $proteinHigh, intent: $intent)';
}


}

/// @nodoc
abstract mixin class $ProgramNutritionCopyWith<$Res>  {
  factory $ProgramNutritionCopyWith(ProgramNutrition value, $Res Function(ProgramNutrition) _then) = _$ProgramNutritionCopyWithImpl;
@useResult
$Res call({
 int calorieLow, int calorieHigh, int proteinLow, int proteinHigh, String intent
});




}
/// @nodoc
class _$ProgramNutritionCopyWithImpl<$Res>
    implements $ProgramNutritionCopyWith<$Res> {
  _$ProgramNutritionCopyWithImpl(this._self, this._then);

  final ProgramNutrition _self;
  final $Res Function(ProgramNutrition) _then;

/// Create a copy of ProgramNutrition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calorieLow = null,Object? calorieHigh = null,Object? proteinLow = null,Object? proteinHigh = null,Object? intent = null,}) {
  return _then(_self.copyWith(
calorieLow: null == calorieLow ? _self.calorieLow : calorieLow // ignore: cast_nullable_to_non_nullable
as int,calorieHigh: null == calorieHigh ? _self.calorieHigh : calorieHigh // ignore: cast_nullable_to_non_nullable
as int,proteinLow: null == proteinLow ? _self.proteinLow : proteinLow // ignore: cast_nullable_to_non_nullable
as int,proteinHigh: null == proteinHigh ? _self.proteinHigh : proteinHigh // ignore: cast_nullable_to_non_nullable
as int,intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramNutrition].
extension ProgramNutritionPatterns on ProgramNutrition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramNutrition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramNutrition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramNutrition value)  $default,){
final _that = this;
switch (_that) {
case _ProgramNutrition():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramNutrition value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramNutrition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int calorieLow,  int calorieHigh,  int proteinLow,  int proteinHigh,  String intent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramNutrition() when $default != null:
return $default(_that.calorieLow,_that.calorieHigh,_that.proteinLow,_that.proteinHigh,_that.intent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int calorieLow,  int calorieHigh,  int proteinLow,  int proteinHigh,  String intent)  $default,) {final _that = this;
switch (_that) {
case _ProgramNutrition():
return $default(_that.calorieLow,_that.calorieHigh,_that.proteinLow,_that.proteinHigh,_that.intent);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int calorieLow,  int calorieHigh,  int proteinLow,  int proteinHigh,  String intent)?  $default,) {final _that = this;
switch (_that) {
case _ProgramNutrition() when $default != null:
return $default(_that.calorieLow,_that.calorieHigh,_that.proteinLow,_that.proteinHigh,_that.intent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramNutrition implements ProgramNutrition {
  const _ProgramNutrition({required this.calorieLow, required this.calorieHigh, required this.proteinLow, required this.proteinHigh, required this.intent});
  factory _ProgramNutrition.fromJson(Map<String, dynamic> json) => _$ProgramNutritionFromJson(json);

@override final  int calorieLow;
@override final  int calorieHigh;
@override final  int proteinLow;
@override final  int proteinHigh;
/// 'surplus' when underweight, 'maintain' otherwise.
@override final  String intent;

/// Create a copy of ProgramNutrition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramNutritionCopyWith<_ProgramNutrition> get copyWith => __$ProgramNutritionCopyWithImpl<_ProgramNutrition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramNutritionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramNutrition&&(identical(other.calorieLow, calorieLow) || other.calorieLow == calorieLow)&&(identical(other.calorieHigh, calorieHigh) || other.calorieHigh == calorieHigh)&&(identical(other.proteinLow, proteinLow) || other.proteinLow == proteinLow)&&(identical(other.proteinHigh, proteinHigh) || other.proteinHigh == proteinHigh)&&(identical(other.intent, intent) || other.intent == intent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calorieLow,calorieHigh,proteinLow,proteinHigh,intent);

@override
String toString() {
  return 'ProgramNutrition(calorieLow: $calorieLow, calorieHigh: $calorieHigh, proteinLow: $proteinLow, proteinHigh: $proteinHigh, intent: $intent)';
}


}

/// @nodoc
abstract mixin class _$ProgramNutritionCopyWith<$Res> implements $ProgramNutritionCopyWith<$Res> {
  factory _$ProgramNutritionCopyWith(_ProgramNutrition value, $Res Function(_ProgramNutrition) _then) = __$ProgramNutritionCopyWithImpl;
@override @useResult
$Res call({
 int calorieLow, int calorieHigh, int proteinLow, int proteinHigh, String intent
});




}
/// @nodoc
class __$ProgramNutritionCopyWithImpl<$Res>
    implements _$ProgramNutritionCopyWith<$Res> {
  __$ProgramNutritionCopyWithImpl(this._self, this._then);

  final _ProgramNutrition _self;
  final $Res Function(_ProgramNutrition) _then;

/// Create a copy of ProgramNutrition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calorieLow = null,Object? calorieHigh = null,Object? proteinLow = null,Object? proteinHigh = null,Object? intent = null,}) {
  return _then(_ProgramNutrition(
calorieLow: null == calorieLow ? _self.calorieLow : calorieLow // ignore: cast_nullable_to_non_nullable
as int,calorieHigh: null == calorieHigh ? _self.calorieHigh : calorieHigh // ignore: cast_nullable_to_non_nullable
as int,proteinLow: null == proteinLow ? _self.proteinLow : proteinLow // ignore: cast_nullable_to_non_nullable
as int,proteinHigh: null == proteinHigh ? _self.proteinHigh : proteinHigh // ignore: cast_nullable_to_non_nullable
as int,intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProgramRevision {

 String get revisionId; int get revisionNumber; List<ProgramPlannedSession> get sessions;
/// Create a copy of ProgramRevision
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramRevisionCopyWith<ProgramRevision> get copyWith => _$ProgramRevisionCopyWithImpl<ProgramRevision>(this as ProgramRevision, _$identity);

  /// Serializes this ProgramRevision to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramRevision&&(identical(other.revisionId, revisionId) || other.revisionId == revisionId)&&(identical(other.revisionNumber, revisionNumber) || other.revisionNumber == revisionNumber)&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,revisionId,revisionNumber,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'ProgramRevision(revisionId: $revisionId, revisionNumber: $revisionNumber, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $ProgramRevisionCopyWith<$Res>  {
  factory $ProgramRevisionCopyWith(ProgramRevision value, $Res Function(ProgramRevision) _then) = _$ProgramRevisionCopyWithImpl;
@useResult
$Res call({
 String revisionId, int revisionNumber, List<ProgramPlannedSession> sessions
});




}
/// @nodoc
class _$ProgramRevisionCopyWithImpl<$Res>
    implements $ProgramRevisionCopyWith<$Res> {
  _$ProgramRevisionCopyWithImpl(this._self, this._then);

  final ProgramRevision _self;
  final $Res Function(ProgramRevision) _then;

/// Create a copy of ProgramRevision
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? revisionId = null,Object? revisionNumber = null,Object? sessions = null,}) {
  return _then(_self.copyWith(
revisionId: null == revisionId ? _self.revisionId : revisionId // ignore: cast_nullable_to_non_nullable
as String,revisionNumber: null == revisionNumber ? _self.revisionNumber : revisionNumber // ignore: cast_nullable_to_non_nullable
as int,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<ProgramPlannedSession>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramRevision].
extension ProgramRevisionPatterns on ProgramRevision {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramRevision value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramRevision() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramRevision value)  $default,){
final _that = this;
switch (_that) {
case _ProgramRevision():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramRevision value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramRevision() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String revisionId,  int revisionNumber,  List<ProgramPlannedSession> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramRevision() when $default != null:
return $default(_that.revisionId,_that.revisionNumber,_that.sessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String revisionId,  int revisionNumber,  List<ProgramPlannedSession> sessions)  $default,) {final _that = this;
switch (_that) {
case _ProgramRevision():
return $default(_that.revisionId,_that.revisionNumber,_that.sessions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String revisionId,  int revisionNumber,  List<ProgramPlannedSession> sessions)?  $default,) {final _that = this;
switch (_that) {
case _ProgramRevision() when $default != null:
return $default(_that.revisionId,_that.revisionNumber,_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramRevision implements ProgramRevision {
  const _ProgramRevision({required this.revisionId, required this.revisionNumber, final  List<ProgramPlannedSession> sessions = const []}): _sessions = sessions;
  factory _ProgramRevision.fromJson(Map<String, dynamic> json) => _$ProgramRevisionFromJson(json);

@override final  String revisionId;
@override final  int revisionNumber;
 final  List<ProgramPlannedSession> _sessions;
@override@JsonKey() List<ProgramPlannedSession> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of ProgramRevision
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramRevisionCopyWith<_ProgramRevision> get copyWith => __$ProgramRevisionCopyWithImpl<_ProgramRevision>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramRevisionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramRevision&&(identical(other.revisionId, revisionId) || other.revisionId == revisionId)&&(identical(other.revisionNumber, revisionNumber) || other.revisionNumber == revisionNumber)&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,revisionId,revisionNumber,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'ProgramRevision(revisionId: $revisionId, revisionNumber: $revisionNumber, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$ProgramRevisionCopyWith<$Res> implements $ProgramRevisionCopyWith<$Res> {
  factory _$ProgramRevisionCopyWith(_ProgramRevision value, $Res Function(_ProgramRevision) _then) = __$ProgramRevisionCopyWithImpl;
@override @useResult
$Res call({
 String revisionId, int revisionNumber, List<ProgramPlannedSession> sessions
});




}
/// @nodoc
class __$ProgramRevisionCopyWithImpl<$Res>
    implements _$ProgramRevisionCopyWith<$Res> {
  __$ProgramRevisionCopyWithImpl(this._self, this._then);

  final _ProgramRevision _self;
  final $Res Function(_ProgramRevision) _then;

/// Create a copy of ProgramRevision
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? revisionId = null,Object? revisionNumber = null,Object? sessions = null,}) {
  return _then(_ProgramRevision(
revisionId: null == revisionId ? _self.revisionId : revisionId // ignore: cast_nullable_to_non_nullable
as String,revisionNumber: null == revisionNumber ? _self.revisionNumber : revisionNumber // ignore: cast_nullable_to_non_nullable
as int,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<ProgramPlannedSession>,
  ));
}


}


/// @nodoc
mixin _$ProgramPlannedSession {

 String get plannedSessionId; int get weekNumber; int get dayNumber; String get focus; List<ProgramPrescription> get prescriptions;
/// Create a copy of ProgramPlannedSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramPlannedSessionCopyWith<ProgramPlannedSession> get copyWith => _$ProgramPlannedSessionCopyWithImpl<ProgramPlannedSession>(this as ProgramPlannedSession, _$identity);

  /// Serializes this ProgramPlannedSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramPlannedSession&&(identical(other.plannedSessionId, plannedSessionId) || other.plannedSessionId == plannedSessionId)&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&(identical(other.focus, focus) || other.focus == focus)&&const DeepCollectionEquality().equals(other.prescriptions, prescriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,plannedSessionId,weekNumber,dayNumber,focus,const DeepCollectionEquality().hash(prescriptions));

@override
String toString() {
  return 'ProgramPlannedSession(plannedSessionId: $plannedSessionId, weekNumber: $weekNumber, dayNumber: $dayNumber, focus: $focus, prescriptions: $prescriptions)';
}


}

/// @nodoc
abstract mixin class $ProgramPlannedSessionCopyWith<$Res>  {
  factory $ProgramPlannedSessionCopyWith(ProgramPlannedSession value, $Res Function(ProgramPlannedSession) _then) = _$ProgramPlannedSessionCopyWithImpl;
@useResult
$Res call({
 String plannedSessionId, int weekNumber, int dayNumber, String focus, List<ProgramPrescription> prescriptions
});




}
/// @nodoc
class _$ProgramPlannedSessionCopyWithImpl<$Res>
    implements $ProgramPlannedSessionCopyWith<$Res> {
  _$ProgramPlannedSessionCopyWithImpl(this._self, this._then);

  final ProgramPlannedSession _self;
  final $Res Function(ProgramPlannedSession) _then;

/// Create a copy of ProgramPlannedSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plannedSessionId = null,Object? weekNumber = null,Object? dayNumber = null,Object? focus = null,Object? prescriptions = null,}) {
  return _then(_self.copyWith(
plannedSessionId: null == plannedSessionId ? _self.plannedSessionId : plannedSessionId // ignore: cast_nullable_to_non_nullable
as String,weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,focus: null == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as String,prescriptions: null == prescriptions ? _self.prescriptions : prescriptions // ignore: cast_nullable_to_non_nullable
as List<ProgramPrescription>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramPlannedSession].
extension ProgramPlannedSessionPatterns on ProgramPlannedSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramPlannedSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramPlannedSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramPlannedSession value)  $default,){
final _that = this;
switch (_that) {
case _ProgramPlannedSession():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramPlannedSession value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramPlannedSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String plannedSessionId,  int weekNumber,  int dayNumber,  String focus,  List<ProgramPrescription> prescriptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramPlannedSession() when $default != null:
return $default(_that.plannedSessionId,_that.weekNumber,_that.dayNumber,_that.focus,_that.prescriptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String plannedSessionId,  int weekNumber,  int dayNumber,  String focus,  List<ProgramPrescription> prescriptions)  $default,) {final _that = this;
switch (_that) {
case _ProgramPlannedSession():
return $default(_that.plannedSessionId,_that.weekNumber,_that.dayNumber,_that.focus,_that.prescriptions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String plannedSessionId,  int weekNumber,  int dayNumber,  String focus,  List<ProgramPrescription> prescriptions)?  $default,) {final _that = this;
switch (_that) {
case _ProgramPlannedSession() when $default != null:
return $default(_that.plannedSessionId,_that.weekNumber,_that.dayNumber,_that.focus,_that.prescriptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramPlannedSession implements ProgramPlannedSession {
  const _ProgramPlannedSession({required this.plannedSessionId, required this.weekNumber, required this.dayNumber, required this.focus, final  List<ProgramPrescription> prescriptions = const []}): _prescriptions = prescriptions;
  factory _ProgramPlannedSession.fromJson(Map<String, dynamic> json) => _$ProgramPlannedSessionFromJson(json);

@override final  String plannedSessionId;
@override final  int weekNumber;
@override final  int dayNumber;
@override final  String focus;
 final  List<ProgramPrescription> _prescriptions;
@override@JsonKey() List<ProgramPrescription> get prescriptions {
  if (_prescriptions is EqualUnmodifiableListView) return _prescriptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_prescriptions);
}


/// Create a copy of ProgramPlannedSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramPlannedSessionCopyWith<_ProgramPlannedSession> get copyWith => __$ProgramPlannedSessionCopyWithImpl<_ProgramPlannedSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramPlannedSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramPlannedSession&&(identical(other.plannedSessionId, plannedSessionId) || other.plannedSessionId == plannedSessionId)&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&(identical(other.focus, focus) || other.focus == focus)&&const DeepCollectionEquality().equals(other._prescriptions, _prescriptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,plannedSessionId,weekNumber,dayNumber,focus,const DeepCollectionEquality().hash(_prescriptions));

@override
String toString() {
  return 'ProgramPlannedSession(plannedSessionId: $plannedSessionId, weekNumber: $weekNumber, dayNumber: $dayNumber, focus: $focus, prescriptions: $prescriptions)';
}


}

/// @nodoc
abstract mixin class _$ProgramPlannedSessionCopyWith<$Res> implements $ProgramPlannedSessionCopyWith<$Res> {
  factory _$ProgramPlannedSessionCopyWith(_ProgramPlannedSession value, $Res Function(_ProgramPlannedSession) _then) = __$ProgramPlannedSessionCopyWithImpl;
@override @useResult
$Res call({
 String plannedSessionId, int weekNumber, int dayNumber, String focus, List<ProgramPrescription> prescriptions
});




}
/// @nodoc
class __$ProgramPlannedSessionCopyWithImpl<$Res>
    implements _$ProgramPlannedSessionCopyWith<$Res> {
  __$ProgramPlannedSessionCopyWithImpl(this._self, this._then);

  final _ProgramPlannedSession _self;
  final $Res Function(_ProgramPlannedSession) _then;

/// Create a copy of ProgramPlannedSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plannedSessionId = null,Object? weekNumber = null,Object? dayNumber = null,Object? focus = null,Object? prescriptions = null,}) {
  return _then(_ProgramPlannedSession(
plannedSessionId: null == plannedSessionId ? _self.plannedSessionId : plannedSessionId // ignore: cast_nullable_to_non_nullable
as String,weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,focus: null == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as String,prescriptions: null == prescriptions ? _self._prescriptions : prescriptions // ignore: cast_nullable_to_non_nullable
as List<ProgramPrescription>,
  ));
}


}


/// @nodoc
mixin _$ProgramPrescription {

 String get prescriptionId; String get exerciseId; String get exerciseSlug;/// Display name the server stitched in (`PROGRAM-11`).
 String get exerciseName; int get order; int get targetSets;/// `int | [min, max] | null` on the wire — read via [repsLabel].
@JsonKey(name: 'targetReps') Object? get targetRepsRaw; int? get targetDurationSec; int? get restSec;
/// Create a copy of ProgramPrescription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramPrescriptionCopyWith<ProgramPrescription> get copyWith => _$ProgramPrescriptionCopyWithImpl<ProgramPrescription>(this as ProgramPrescription, _$identity);

  /// Serializes this ProgramPrescription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramPrescription&&(identical(other.prescriptionId, prescriptionId) || other.prescriptionId == prescriptionId)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.exerciseSlug, exerciseSlug) || other.exerciseSlug == exerciseSlug)&&(identical(other.exerciseName, exerciseName) || other.exerciseName == exerciseName)&&(identical(other.order, order) || other.order == order)&&(identical(other.targetSets, targetSets) || other.targetSets == targetSets)&&const DeepCollectionEquality().equals(other.targetRepsRaw, targetRepsRaw)&&(identical(other.targetDurationSec, targetDurationSec) || other.targetDurationSec == targetDurationSec)&&(identical(other.restSec, restSec) || other.restSec == restSec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prescriptionId,exerciseId,exerciseSlug,exerciseName,order,targetSets,const DeepCollectionEquality().hash(targetRepsRaw),targetDurationSec,restSec);

@override
String toString() {
  return 'ProgramPrescription(prescriptionId: $prescriptionId, exerciseId: $exerciseId, exerciseSlug: $exerciseSlug, exerciseName: $exerciseName, order: $order, targetSets: $targetSets, targetRepsRaw: $targetRepsRaw, targetDurationSec: $targetDurationSec, restSec: $restSec)';
}


}

/// @nodoc
abstract mixin class $ProgramPrescriptionCopyWith<$Res>  {
  factory $ProgramPrescriptionCopyWith(ProgramPrescription value, $Res Function(ProgramPrescription) _then) = _$ProgramPrescriptionCopyWithImpl;
@useResult
$Res call({
 String prescriptionId, String exerciseId, String exerciseSlug, String exerciseName, int order, int targetSets,@JsonKey(name: 'targetReps') Object? targetRepsRaw, int? targetDurationSec, int? restSec
});




}
/// @nodoc
class _$ProgramPrescriptionCopyWithImpl<$Res>
    implements $ProgramPrescriptionCopyWith<$Res> {
  _$ProgramPrescriptionCopyWithImpl(this._self, this._then);

  final ProgramPrescription _self;
  final $Res Function(ProgramPrescription) _then;

/// Create a copy of ProgramPrescription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prescriptionId = null,Object? exerciseId = null,Object? exerciseSlug = null,Object? exerciseName = null,Object? order = null,Object? targetSets = null,Object? targetRepsRaw = freezed,Object? targetDurationSec = freezed,Object? restSec = freezed,}) {
  return _then(_self.copyWith(
prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,exerciseSlug: null == exerciseSlug ? _self.exerciseSlug : exerciseSlug // ignore: cast_nullable_to_non_nullable
as String,exerciseName: null == exerciseName ? _self.exerciseName : exerciseName // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,targetSets: null == targetSets ? _self.targetSets : targetSets // ignore: cast_nullable_to_non_nullable
as int,targetRepsRaw: freezed == targetRepsRaw ? _self.targetRepsRaw : targetRepsRaw ,targetDurationSec: freezed == targetDurationSec ? _self.targetDurationSec : targetDurationSec // ignore: cast_nullable_to_non_nullable
as int?,restSec: freezed == restSec ? _self.restSec : restSec // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramPrescription].
extension ProgramPrescriptionPatterns on ProgramPrescription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramPrescription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramPrescription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramPrescription value)  $default,){
final _that = this;
switch (_that) {
case _ProgramPrescription():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramPrescription value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramPrescription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String prescriptionId,  String exerciseId,  String exerciseSlug,  String exerciseName,  int order,  int targetSets, @JsonKey(name: 'targetReps')  Object? targetRepsRaw,  int? targetDurationSec,  int? restSec)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramPrescription() when $default != null:
return $default(_that.prescriptionId,_that.exerciseId,_that.exerciseSlug,_that.exerciseName,_that.order,_that.targetSets,_that.targetRepsRaw,_that.targetDurationSec,_that.restSec);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String prescriptionId,  String exerciseId,  String exerciseSlug,  String exerciseName,  int order,  int targetSets, @JsonKey(name: 'targetReps')  Object? targetRepsRaw,  int? targetDurationSec,  int? restSec)  $default,) {final _that = this;
switch (_that) {
case _ProgramPrescription():
return $default(_that.prescriptionId,_that.exerciseId,_that.exerciseSlug,_that.exerciseName,_that.order,_that.targetSets,_that.targetRepsRaw,_that.targetDurationSec,_that.restSec);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String prescriptionId,  String exerciseId,  String exerciseSlug,  String exerciseName,  int order,  int targetSets, @JsonKey(name: 'targetReps')  Object? targetRepsRaw,  int? targetDurationSec,  int? restSec)?  $default,) {final _that = this;
switch (_that) {
case _ProgramPrescription() when $default != null:
return $default(_that.prescriptionId,_that.exerciseId,_that.exerciseSlug,_that.exerciseName,_that.order,_that.targetSets,_that.targetRepsRaw,_that.targetDurationSec,_that.restSec);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramPrescription extends ProgramPrescription {
  const _ProgramPrescription({required this.prescriptionId, required this.exerciseId, this.exerciseSlug = '', this.exerciseName = '', required this.order, required this.targetSets, @JsonKey(name: 'targetReps') this.targetRepsRaw, this.targetDurationSec, this.restSec}): super._();
  factory _ProgramPrescription.fromJson(Map<String, dynamic> json) => _$ProgramPrescriptionFromJson(json);

@override final  String prescriptionId;
@override final  String exerciseId;
@override@JsonKey() final  String exerciseSlug;
/// Display name the server stitched in (`PROGRAM-11`).
@override@JsonKey() final  String exerciseName;
@override final  int order;
@override final  int targetSets;
/// `int | [min, max] | null` on the wire — read via [repsLabel].
@override@JsonKey(name: 'targetReps') final  Object? targetRepsRaw;
@override final  int? targetDurationSec;
@override final  int? restSec;

/// Create a copy of ProgramPrescription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramPrescriptionCopyWith<_ProgramPrescription> get copyWith => __$ProgramPrescriptionCopyWithImpl<_ProgramPrescription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramPrescriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramPrescription&&(identical(other.prescriptionId, prescriptionId) || other.prescriptionId == prescriptionId)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.exerciseSlug, exerciseSlug) || other.exerciseSlug == exerciseSlug)&&(identical(other.exerciseName, exerciseName) || other.exerciseName == exerciseName)&&(identical(other.order, order) || other.order == order)&&(identical(other.targetSets, targetSets) || other.targetSets == targetSets)&&const DeepCollectionEquality().equals(other.targetRepsRaw, targetRepsRaw)&&(identical(other.targetDurationSec, targetDurationSec) || other.targetDurationSec == targetDurationSec)&&(identical(other.restSec, restSec) || other.restSec == restSec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prescriptionId,exerciseId,exerciseSlug,exerciseName,order,targetSets,const DeepCollectionEquality().hash(targetRepsRaw),targetDurationSec,restSec);

@override
String toString() {
  return 'ProgramPrescription(prescriptionId: $prescriptionId, exerciseId: $exerciseId, exerciseSlug: $exerciseSlug, exerciseName: $exerciseName, order: $order, targetSets: $targetSets, targetRepsRaw: $targetRepsRaw, targetDurationSec: $targetDurationSec, restSec: $restSec)';
}


}

/// @nodoc
abstract mixin class _$ProgramPrescriptionCopyWith<$Res> implements $ProgramPrescriptionCopyWith<$Res> {
  factory _$ProgramPrescriptionCopyWith(_ProgramPrescription value, $Res Function(_ProgramPrescription) _then) = __$ProgramPrescriptionCopyWithImpl;
@override @useResult
$Res call({
 String prescriptionId, String exerciseId, String exerciseSlug, String exerciseName, int order, int targetSets,@JsonKey(name: 'targetReps') Object? targetRepsRaw, int? targetDurationSec, int? restSec
});




}
/// @nodoc
class __$ProgramPrescriptionCopyWithImpl<$Res>
    implements _$ProgramPrescriptionCopyWith<$Res> {
  __$ProgramPrescriptionCopyWithImpl(this._self, this._then);

  final _ProgramPrescription _self;
  final $Res Function(_ProgramPrescription) _then;

/// Create a copy of ProgramPrescription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prescriptionId = null,Object? exerciseId = null,Object? exerciseSlug = null,Object? exerciseName = null,Object? order = null,Object? targetSets = null,Object? targetRepsRaw = freezed,Object? targetDurationSec = freezed,Object? restSec = freezed,}) {
  return _then(_ProgramPrescription(
prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,exerciseSlug: null == exerciseSlug ? _self.exerciseSlug : exerciseSlug // ignore: cast_nullable_to_non_nullable
as String,exerciseName: null == exerciseName ? _self.exerciseName : exerciseName // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,targetSets: null == targetSets ? _self.targetSets : targetSets // ignore: cast_nullable_to_non_nullable
as int,targetRepsRaw: freezed == targetRepsRaw ? _self.targetRepsRaw : targetRepsRaw ,targetDurationSec: freezed == targetDurationSec ? _self.targetDurationSec : targetDurationSec // ignore: cast_nullable_to_non_nullable
as int?,restSec: freezed == restSec ? _self.restSec : restSec // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
