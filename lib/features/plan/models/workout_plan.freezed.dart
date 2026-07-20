// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlanMetric {

 String get value; PlanText get caption;
/// Create a copy of PlanMetric
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanMetricCopyWith<PlanMetric> get copyWith => _$PlanMetricCopyWithImpl<PlanMetric>(this as PlanMetric, _$identity);

  /// Serializes this PlanMetric to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanMetric&&(identical(other.value, value) || other.value == value)&&(identical(other.caption, caption) || other.caption == caption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,caption);

@override
String toString() {
  return 'PlanMetric(value: $value, caption: $caption)';
}


}

/// @nodoc
abstract mixin class $PlanMetricCopyWith<$Res>  {
  factory $PlanMetricCopyWith(PlanMetric value, $Res Function(PlanMetric) _then) = _$PlanMetricCopyWithImpl;
@useResult
$Res call({
 String value, PlanText caption
});


$PlanTextCopyWith<$Res> get caption;

}
/// @nodoc
class _$PlanMetricCopyWithImpl<$Res>
    implements $PlanMetricCopyWith<$Res> {
  _$PlanMetricCopyWithImpl(this._self, this._then);

  final PlanMetric _self;
  final $Res Function(PlanMetric) _then;

/// Create a copy of PlanMetric
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? caption = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as PlanText,
  ));
}
/// Create a copy of PlanMetric
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get caption {
  
  return $PlanTextCopyWith<$Res>(_self.caption, (value) {
    return _then(_self.copyWith(caption: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlanMetric].
extension PlanMetricPatterns on PlanMetric {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanMetric value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanMetric() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanMetric value)  $default,){
final _that = this;
switch (_that) {
case _PlanMetric():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanMetric value)?  $default,){
final _that = this;
switch (_that) {
case _PlanMetric() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  PlanText caption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanMetric() when $default != null:
return $default(_that.value,_that.caption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  PlanText caption)  $default,) {final _that = this;
switch (_that) {
case _PlanMetric():
return $default(_that.value,_that.caption);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  PlanText caption)?  $default,) {final _that = this;
switch (_that) {
case _PlanMetric() when $default != null:
return $default(_that.value,_that.caption);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanMetric implements PlanMetric {
  const _PlanMetric({required this.value, required this.caption});
  factory _PlanMetric.fromJson(Map<String, dynamic> json) => _$PlanMetricFromJson(json);

@override final  String value;
@override final  PlanText caption;

/// Create a copy of PlanMetric
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanMetricCopyWith<_PlanMetric> get copyWith => __$PlanMetricCopyWithImpl<_PlanMetric>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanMetricToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanMetric&&(identical(other.value, value) || other.value == value)&&(identical(other.caption, caption) || other.caption == caption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,caption);

@override
String toString() {
  return 'PlanMetric(value: $value, caption: $caption)';
}


}

/// @nodoc
abstract mixin class _$PlanMetricCopyWith<$Res> implements $PlanMetricCopyWith<$Res> {
  factory _$PlanMetricCopyWith(_PlanMetric value, $Res Function(_PlanMetric) _then) = __$PlanMetricCopyWithImpl;
@override @useResult
$Res call({
 String value, PlanText caption
});


@override $PlanTextCopyWith<$Res> get caption;

}
/// @nodoc
class __$PlanMetricCopyWithImpl<$Res>
    implements _$PlanMetricCopyWith<$Res> {
  __$PlanMetricCopyWithImpl(this._self, this._then);

  final _PlanMetric _self;
  final $Res Function(_PlanMetric) _then;

/// Create a copy of PlanMetric
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? caption = null,}) {
  return _then(_PlanMetric(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,caption: null == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as PlanText,
  ));
}

/// Create a copy of PlanMetric
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get caption {
  
  return $PlanTextCopyWith<$Res>(_self.caption, (value) {
    return _then(_self.copyWith(caption: value));
  });
}
}


/// @nodoc
mixin _$TimelinePhase {

 PlanText get weekRange; PlanText get focus; PlanText get detail;
/// Create a copy of TimelinePhase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelinePhaseCopyWith<TimelinePhase> get copyWith => _$TimelinePhaseCopyWithImpl<TimelinePhase>(this as TimelinePhase, _$identity);

  /// Serializes this TimelinePhase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelinePhase&&(identical(other.weekRange, weekRange) || other.weekRange == weekRange)&&(identical(other.focus, focus) || other.focus == focus)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekRange,focus,detail);

@override
String toString() {
  return 'TimelinePhase(weekRange: $weekRange, focus: $focus, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $TimelinePhaseCopyWith<$Res>  {
  factory $TimelinePhaseCopyWith(TimelinePhase value, $Res Function(TimelinePhase) _then) = _$TimelinePhaseCopyWithImpl;
@useResult
$Res call({
 PlanText weekRange, PlanText focus, PlanText detail
});


$PlanTextCopyWith<$Res> get weekRange;$PlanTextCopyWith<$Res> get focus;$PlanTextCopyWith<$Res> get detail;

}
/// @nodoc
class _$TimelinePhaseCopyWithImpl<$Res>
    implements $TimelinePhaseCopyWith<$Res> {
  _$TimelinePhaseCopyWithImpl(this._self, this._then);

  final TimelinePhase _self;
  final $Res Function(TimelinePhase) _then;

/// Create a copy of TimelinePhase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekRange = null,Object? focus = null,Object? detail = null,}) {
  return _then(_self.copyWith(
weekRange: null == weekRange ? _self.weekRange : weekRange // ignore: cast_nullable_to_non_nullable
as PlanText,focus: null == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as PlanText,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as PlanText,
  ));
}
/// Create a copy of TimelinePhase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get weekRange {
  
  return $PlanTextCopyWith<$Res>(_self.weekRange, (value) {
    return _then(_self.copyWith(weekRange: value));
  });
}/// Create a copy of TimelinePhase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get focus {
  
  return $PlanTextCopyWith<$Res>(_self.focus, (value) {
    return _then(_self.copyWith(focus: value));
  });
}/// Create a copy of TimelinePhase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get detail {
  
  return $PlanTextCopyWith<$Res>(_self.detail, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}


/// Adds pattern-matching-related methods to [TimelinePhase].
extension TimelinePhasePatterns on TimelinePhase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimelinePhase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimelinePhase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimelinePhase value)  $default,){
final _that = this;
switch (_that) {
case _TimelinePhase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimelinePhase value)?  $default,){
final _that = this;
switch (_that) {
case _TimelinePhase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlanText weekRange,  PlanText focus,  PlanText detail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimelinePhase() when $default != null:
return $default(_that.weekRange,_that.focus,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlanText weekRange,  PlanText focus,  PlanText detail)  $default,) {final _that = this;
switch (_that) {
case _TimelinePhase():
return $default(_that.weekRange,_that.focus,_that.detail);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlanText weekRange,  PlanText focus,  PlanText detail)?  $default,) {final _that = this;
switch (_that) {
case _TimelinePhase() when $default != null:
return $default(_that.weekRange,_that.focus,_that.detail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimelinePhase implements TimelinePhase {
  const _TimelinePhase({required this.weekRange, required this.focus, required this.detail});
  factory _TimelinePhase.fromJson(Map<String, dynamic> json) => _$TimelinePhaseFromJson(json);

@override final  PlanText weekRange;
@override final  PlanText focus;
@override final  PlanText detail;

/// Create a copy of TimelinePhase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelinePhaseCopyWith<_TimelinePhase> get copyWith => __$TimelinePhaseCopyWithImpl<_TimelinePhase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimelinePhaseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimelinePhase&&(identical(other.weekRange, weekRange) || other.weekRange == weekRange)&&(identical(other.focus, focus) || other.focus == focus)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekRange,focus,detail);

@override
String toString() {
  return 'TimelinePhase(weekRange: $weekRange, focus: $focus, detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$TimelinePhaseCopyWith<$Res> implements $TimelinePhaseCopyWith<$Res> {
  factory _$TimelinePhaseCopyWith(_TimelinePhase value, $Res Function(_TimelinePhase) _then) = __$TimelinePhaseCopyWithImpl;
@override @useResult
$Res call({
 PlanText weekRange, PlanText focus, PlanText detail
});


@override $PlanTextCopyWith<$Res> get weekRange;@override $PlanTextCopyWith<$Res> get focus;@override $PlanTextCopyWith<$Res> get detail;

}
/// @nodoc
class __$TimelinePhaseCopyWithImpl<$Res>
    implements _$TimelinePhaseCopyWith<$Res> {
  __$TimelinePhaseCopyWithImpl(this._self, this._then);

  final _TimelinePhase _self;
  final $Res Function(_TimelinePhase) _then;

/// Create a copy of TimelinePhase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekRange = null,Object? focus = null,Object? detail = null,}) {
  return _then(_TimelinePhase(
weekRange: null == weekRange ? _self.weekRange : weekRange // ignore: cast_nullable_to_non_nullable
as PlanText,focus: null == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as PlanText,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as PlanText,
  ));
}

/// Create a copy of TimelinePhase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get weekRange {
  
  return $PlanTextCopyWith<$Res>(_self.weekRange, (value) {
    return _then(_self.copyWith(weekRange: value));
  });
}/// Create a copy of TimelinePhase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get focus {
  
  return $PlanTextCopyWith<$Res>(_self.focus, (value) {
    return _then(_self.copyWith(focus: value));
  });
}/// Create a copy of TimelinePhase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get detail {
  
  return $PlanTextCopyWith<$Res>(_self.detail, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}


/// @nodoc
mixin _$NutritionTarget {

 int get calorieLow; int get calorieHigh; int get proteinLow; int get proteinHigh; PlanText get body; PlanText get healthNote;
/// Create a copy of NutritionTarget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionTargetCopyWith<NutritionTarget> get copyWith => _$NutritionTargetCopyWithImpl<NutritionTarget>(this as NutritionTarget, _$identity);

  /// Serializes this NutritionTarget to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionTarget&&(identical(other.calorieLow, calorieLow) || other.calorieLow == calorieLow)&&(identical(other.calorieHigh, calorieHigh) || other.calorieHigh == calorieHigh)&&(identical(other.proteinLow, proteinLow) || other.proteinLow == proteinLow)&&(identical(other.proteinHigh, proteinHigh) || other.proteinHigh == proteinHigh)&&(identical(other.body, body) || other.body == body)&&(identical(other.healthNote, healthNote) || other.healthNote == healthNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calorieLow,calorieHigh,proteinLow,proteinHigh,body,healthNote);

@override
String toString() {
  return 'NutritionTarget(calorieLow: $calorieLow, calorieHigh: $calorieHigh, proteinLow: $proteinLow, proteinHigh: $proteinHigh, body: $body, healthNote: $healthNote)';
}


}

/// @nodoc
abstract mixin class $NutritionTargetCopyWith<$Res>  {
  factory $NutritionTargetCopyWith(NutritionTarget value, $Res Function(NutritionTarget) _then) = _$NutritionTargetCopyWithImpl;
@useResult
$Res call({
 int calorieLow, int calorieHigh, int proteinLow, int proteinHigh, PlanText body, PlanText healthNote
});


$PlanTextCopyWith<$Res> get body;$PlanTextCopyWith<$Res> get healthNote;

}
/// @nodoc
class _$NutritionTargetCopyWithImpl<$Res>
    implements $NutritionTargetCopyWith<$Res> {
  _$NutritionTargetCopyWithImpl(this._self, this._then);

  final NutritionTarget _self;
  final $Res Function(NutritionTarget) _then;

/// Create a copy of NutritionTarget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calorieLow = null,Object? calorieHigh = null,Object? proteinLow = null,Object? proteinHigh = null,Object? body = null,Object? healthNote = null,}) {
  return _then(_self.copyWith(
calorieLow: null == calorieLow ? _self.calorieLow : calorieLow // ignore: cast_nullable_to_non_nullable
as int,calorieHigh: null == calorieHigh ? _self.calorieHigh : calorieHigh // ignore: cast_nullable_to_non_nullable
as int,proteinLow: null == proteinLow ? _self.proteinLow : proteinLow // ignore: cast_nullable_to_non_nullable
as int,proteinHigh: null == proteinHigh ? _self.proteinHigh : proteinHigh // ignore: cast_nullable_to_non_nullable
as int,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as PlanText,healthNote: null == healthNote ? _self.healthNote : healthNote // ignore: cast_nullable_to_non_nullable
as PlanText,
  ));
}
/// Create a copy of NutritionTarget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get body {
  
  return $PlanTextCopyWith<$Res>(_self.body, (value) {
    return _then(_self.copyWith(body: value));
  });
}/// Create a copy of NutritionTarget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get healthNote {
  
  return $PlanTextCopyWith<$Res>(_self.healthNote, (value) {
    return _then(_self.copyWith(healthNote: value));
  });
}
}


/// Adds pattern-matching-related methods to [NutritionTarget].
extension NutritionTargetPatterns on NutritionTarget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutritionTarget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionTarget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutritionTarget value)  $default,){
final _that = this;
switch (_that) {
case _NutritionTarget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutritionTarget value)?  $default,){
final _that = this;
switch (_that) {
case _NutritionTarget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int calorieLow,  int calorieHigh,  int proteinLow,  int proteinHigh,  PlanText body,  PlanText healthNote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionTarget() when $default != null:
return $default(_that.calorieLow,_that.calorieHigh,_that.proteinLow,_that.proteinHigh,_that.body,_that.healthNote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int calorieLow,  int calorieHigh,  int proteinLow,  int proteinHigh,  PlanText body,  PlanText healthNote)  $default,) {final _that = this;
switch (_that) {
case _NutritionTarget():
return $default(_that.calorieLow,_that.calorieHigh,_that.proteinLow,_that.proteinHigh,_that.body,_that.healthNote);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int calorieLow,  int calorieHigh,  int proteinLow,  int proteinHigh,  PlanText body,  PlanText healthNote)?  $default,) {final _that = this;
switch (_that) {
case _NutritionTarget() when $default != null:
return $default(_that.calorieLow,_that.calorieHigh,_that.proteinLow,_that.proteinHigh,_that.body,_that.healthNote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NutritionTarget implements NutritionTarget {
  const _NutritionTarget({required this.calorieLow, required this.calorieHigh, required this.proteinLow, required this.proteinHigh, required this.body, required this.healthNote});
  factory _NutritionTarget.fromJson(Map<String, dynamic> json) => _$NutritionTargetFromJson(json);

@override final  int calorieLow;
@override final  int calorieHigh;
@override final  int proteinLow;
@override final  int proteinHigh;
@override final  PlanText body;
@override final  PlanText healthNote;

/// Create a copy of NutritionTarget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionTargetCopyWith<_NutritionTarget> get copyWith => __$NutritionTargetCopyWithImpl<_NutritionTarget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutritionTargetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionTarget&&(identical(other.calorieLow, calorieLow) || other.calorieLow == calorieLow)&&(identical(other.calorieHigh, calorieHigh) || other.calorieHigh == calorieHigh)&&(identical(other.proteinLow, proteinLow) || other.proteinLow == proteinLow)&&(identical(other.proteinHigh, proteinHigh) || other.proteinHigh == proteinHigh)&&(identical(other.body, body) || other.body == body)&&(identical(other.healthNote, healthNote) || other.healthNote == healthNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calorieLow,calorieHigh,proteinLow,proteinHigh,body,healthNote);

@override
String toString() {
  return 'NutritionTarget(calorieLow: $calorieLow, calorieHigh: $calorieHigh, proteinLow: $proteinLow, proteinHigh: $proteinHigh, body: $body, healthNote: $healthNote)';
}


}

/// @nodoc
abstract mixin class _$NutritionTargetCopyWith<$Res> implements $NutritionTargetCopyWith<$Res> {
  factory _$NutritionTargetCopyWith(_NutritionTarget value, $Res Function(_NutritionTarget) _then) = __$NutritionTargetCopyWithImpl;
@override @useResult
$Res call({
 int calorieLow, int calorieHigh, int proteinLow, int proteinHigh, PlanText body, PlanText healthNote
});


@override $PlanTextCopyWith<$Res> get body;@override $PlanTextCopyWith<$Res> get healthNote;

}
/// @nodoc
class __$NutritionTargetCopyWithImpl<$Res>
    implements _$NutritionTargetCopyWith<$Res> {
  __$NutritionTargetCopyWithImpl(this._self, this._then);

  final _NutritionTarget _self;
  final $Res Function(_NutritionTarget) _then;

/// Create a copy of NutritionTarget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calorieLow = null,Object? calorieHigh = null,Object? proteinLow = null,Object? proteinHigh = null,Object? body = null,Object? healthNote = null,}) {
  return _then(_NutritionTarget(
calorieLow: null == calorieLow ? _self.calorieLow : calorieLow // ignore: cast_nullable_to_non_nullable
as int,calorieHigh: null == calorieHigh ? _self.calorieHigh : calorieHigh // ignore: cast_nullable_to_non_nullable
as int,proteinLow: null == proteinLow ? _self.proteinLow : proteinLow // ignore: cast_nullable_to_non_nullable
as int,proteinHigh: null == proteinHigh ? _self.proteinHigh : proteinHigh // ignore: cast_nullable_to_non_nullable
as int,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as PlanText,healthNote: null == healthNote ? _self.healthNote : healthNote // ignore: cast_nullable_to_non_nullable
as PlanText,
  ));
}

/// Create a copy of NutritionTarget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get body {
  
  return $PlanTextCopyWith<$Res>(_self.body, (value) {
    return _then(_self.copyWith(body: value));
  });
}/// Create a copy of NutritionTarget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get healthNote {
  
  return $PlanTextCopyWith<$Res>(_self.healthNote, (value) {
    return _then(_self.copyWith(healthNote: value));
  });
}
}


/// @nodoc
mixin _$PlanExercise {

 PlanText get name; String get sets; String get reps; PlanText? get note;
/// Create a copy of PlanExercise
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanExerciseCopyWith<PlanExercise> get copyWith => _$PlanExerciseCopyWithImpl<PlanExercise>(this as PlanExercise, _$identity);

  /// Serializes this PlanExercise to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanExercise&&(identical(other.name, name) || other.name == name)&&(identical(other.sets, sets) || other.sets == sets)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sets,reps,note);

@override
String toString() {
  return 'PlanExercise(name: $name, sets: $sets, reps: $reps, note: $note)';
}


}

/// @nodoc
abstract mixin class $PlanExerciseCopyWith<$Res>  {
  factory $PlanExerciseCopyWith(PlanExercise value, $Res Function(PlanExercise) _then) = _$PlanExerciseCopyWithImpl;
@useResult
$Res call({
 PlanText name, String sets, String reps, PlanText? note
});


$PlanTextCopyWith<$Res> get name;$PlanTextCopyWith<$Res>? get note;

}
/// @nodoc
class _$PlanExerciseCopyWithImpl<$Res>
    implements $PlanExerciseCopyWith<$Res> {
  _$PlanExerciseCopyWithImpl(this._self, this._then);

  final PlanExercise _self;
  final $Res Function(PlanExercise) _then;

/// Create a copy of PlanExercise
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? sets = null,Object? reps = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as PlanText,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as String,reps: null == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as PlanText?,
  ));
}
/// Create a copy of PlanExercise
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get name {
  
  return $PlanTextCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of PlanExercise
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res>? get note {
    if (_self.note == null) {
    return null;
  }

  return $PlanTextCopyWith<$Res>(_self.note!, (value) {
    return _then(_self.copyWith(note: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlanExercise].
extension PlanExercisePatterns on PlanExercise {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanExercise value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanExercise() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanExercise value)  $default,){
final _that = this;
switch (_that) {
case _PlanExercise():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanExercise value)?  $default,){
final _that = this;
switch (_that) {
case _PlanExercise() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlanText name,  String sets,  String reps,  PlanText? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanExercise() when $default != null:
return $default(_that.name,_that.sets,_that.reps,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlanText name,  String sets,  String reps,  PlanText? note)  $default,) {final _that = this;
switch (_that) {
case _PlanExercise():
return $default(_that.name,_that.sets,_that.reps,_that.note);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlanText name,  String sets,  String reps,  PlanText? note)?  $default,) {final _that = this;
switch (_that) {
case _PlanExercise() when $default != null:
return $default(_that.name,_that.sets,_that.reps,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanExercise implements PlanExercise {
  const _PlanExercise({required this.name, required this.sets, required this.reps, this.note});
  factory _PlanExercise.fromJson(Map<String, dynamic> json) => _$PlanExerciseFromJson(json);

@override final  PlanText name;
@override final  String sets;
@override final  String reps;
@override final  PlanText? note;

/// Create a copy of PlanExercise
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanExerciseCopyWith<_PlanExercise> get copyWith => __$PlanExerciseCopyWithImpl<_PlanExercise>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanExerciseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanExercise&&(identical(other.name, name) || other.name == name)&&(identical(other.sets, sets) || other.sets == sets)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,sets,reps,note);

@override
String toString() {
  return 'PlanExercise(name: $name, sets: $sets, reps: $reps, note: $note)';
}


}

/// @nodoc
abstract mixin class _$PlanExerciseCopyWith<$Res> implements $PlanExerciseCopyWith<$Res> {
  factory _$PlanExerciseCopyWith(_PlanExercise value, $Res Function(_PlanExercise) _then) = __$PlanExerciseCopyWithImpl;
@override @useResult
$Res call({
 PlanText name, String sets, String reps, PlanText? note
});


@override $PlanTextCopyWith<$Res> get name;@override $PlanTextCopyWith<$Res>? get note;

}
/// @nodoc
class __$PlanExerciseCopyWithImpl<$Res>
    implements _$PlanExerciseCopyWith<$Res> {
  __$PlanExerciseCopyWithImpl(this._self, this._then);

  final _PlanExercise _self;
  final $Res Function(_PlanExercise) _then;

/// Create a copy of PlanExercise
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? sets = null,Object? reps = null,Object? note = freezed,}) {
  return _then(_PlanExercise(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as PlanText,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as String,reps: null == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as PlanText?,
  ));
}

/// Create a copy of PlanExercise
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get name {
  
  return $PlanTextCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of PlanExercise
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res>? get note {
    if (_self.note == null) {
    return null;
  }

  return $PlanTextCopyWith<$Res>(_self.note!, (value) {
    return _then(_self.copyWith(note: value));
  });
}
}


/// @nodoc
mixin _$PlanSession {

 String get day; PlanText get name; String get duration; List<PlanExercise> get exercises;
/// Create a copy of PlanSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanSessionCopyWith<PlanSession> get copyWith => _$PlanSessionCopyWithImpl<PlanSession>(this as PlanSession, _$identity);

  /// Serializes this PlanSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanSession&&(identical(other.day, day) || other.day == day)&&(identical(other.name, name) || other.name == name)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other.exercises, exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,name,duration,const DeepCollectionEquality().hash(exercises));

@override
String toString() {
  return 'PlanSession(day: $day, name: $name, duration: $duration, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class $PlanSessionCopyWith<$Res>  {
  factory $PlanSessionCopyWith(PlanSession value, $Res Function(PlanSession) _then) = _$PlanSessionCopyWithImpl;
@useResult
$Res call({
 String day, PlanText name, String duration, List<PlanExercise> exercises
});


$PlanTextCopyWith<$Res> get name;

}
/// @nodoc
class _$PlanSessionCopyWithImpl<$Res>
    implements $PlanSessionCopyWith<$Res> {
  _$PlanSessionCopyWithImpl(this._self, this._then);

  final PlanSession _self;
  final $Res Function(PlanSession) _then;

/// Create a copy of PlanSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? name = null,Object? duration = null,Object? exercises = null,}) {
  return _then(_self.copyWith(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as PlanText,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,exercises: null == exercises ? _self.exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<PlanExercise>,
  ));
}
/// Create a copy of PlanSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get name {
  
  return $PlanTextCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlanSession].
extension PlanSessionPatterns on PlanSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanSession value)  $default,){
final _that = this;
switch (_that) {
case _PlanSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanSession value)?  $default,){
final _that = this;
switch (_that) {
case _PlanSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String day,  PlanText name,  String duration,  List<PlanExercise> exercises)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanSession() when $default != null:
return $default(_that.day,_that.name,_that.duration,_that.exercises);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String day,  PlanText name,  String duration,  List<PlanExercise> exercises)  $default,) {final _that = this;
switch (_that) {
case _PlanSession():
return $default(_that.day,_that.name,_that.duration,_that.exercises);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String day,  PlanText name,  String duration,  List<PlanExercise> exercises)?  $default,) {final _that = this;
switch (_that) {
case _PlanSession() when $default != null:
return $default(_that.day,_that.name,_that.duration,_that.exercises);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanSession implements PlanSession {
  const _PlanSession({required this.day, required this.name, required this.duration, required final  List<PlanExercise> exercises}): _exercises = exercises;
  factory _PlanSession.fromJson(Map<String, dynamic> json) => _$PlanSessionFromJson(json);

@override final  String day;
@override final  PlanText name;
@override final  String duration;
 final  List<PlanExercise> _exercises;
@override List<PlanExercise> get exercises {
  if (_exercises is EqualUnmodifiableListView) return _exercises;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exercises);
}


/// Create a copy of PlanSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanSessionCopyWith<_PlanSession> get copyWith => __$PlanSessionCopyWithImpl<_PlanSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanSession&&(identical(other.day, day) || other.day == day)&&(identical(other.name, name) || other.name == name)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other._exercises, _exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,name,duration,const DeepCollectionEquality().hash(_exercises));

@override
String toString() {
  return 'PlanSession(day: $day, name: $name, duration: $duration, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class _$PlanSessionCopyWith<$Res> implements $PlanSessionCopyWith<$Res> {
  factory _$PlanSessionCopyWith(_PlanSession value, $Res Function(_PlanSession) _then) = __$PlanSessionCopyWithImpl;
@override @useResult
$Res call({
 String day, PlanText name, String duration, List<PlanExercise> exercises
});


@override $PlanTextCopyWith<$Res> get name;

}
/// @nodoc
class __$PlanSessionCopyWithImpl<$Res>
    implements _$PlanSessionCopyWith<$Res> {
  __$PlanSessionCopyWithImpl(this._self, this._then);

  final _PlanSession _self;
  final $Res Function(_PlanSession) _then;

/// Create a copy of PlanSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? name = null,Object? duration = null,Object? exercises = null,}) {
  return _then(_PlanSession(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as PlanText,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,exercises: null == exercises ? _self._exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<PlanExercise>,
  ));
}

/// Create a copy of PlanSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get name {
  
  return $PlanTextCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}
}


/// @nodoc
mixin _$WorkoutPlan {

 PlanText get headline; PlanText get summary; List<PlanMetric> get heroMetrics; List<TimelinePhase> get timeline; List<PlanText> get inferredNeeds; PlanText get rationale; NutritionTarget get nutrition; List<PlanSession> get sessions;
/// Create a copy of WorkoutPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutPlanCopyWith<WorkoutPlan> get copyWith => _$WorkoutPlanCopyWithImpl<WorkoutPlan>(this as WorkoutPlan, _$identity);

  /// Serializes this WorkoutPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutPlan&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.heroMetrics, heroMetrics)&&const DeepCollectionEquality().equals(other.timeline, timeline)&&const DeepCollectionEquality().equals(other.inferredNeeds, inferredNeeds)&&(identical(other.rationale, rationale) || other.rationale == rationale)&&(identical(other.nutrition, nutrition) || other.nutrition == nutrition)&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,headline,summary,const DeepCollectionEquality().hash(heroMetrics),const DeepCollectionEquality().hash(timeline),const DeepCollectionEquality().hash(inferredNeeds),rationale,nutrition,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'WorkoutPlan(headline: $headline, summary: $summary, heroMetrics: $heroMetrics, timeline: $timeline, inferredNeeds: $inferredNeeds, rationale: $rationale, nutrition: $nutrition, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $WorkoutPlanCopyWith<$Res>  {
  factory $WorkoutPlanCopyWith(WorkoutPlan value, $Res Function(WorkoutPlan) _then) = _$WorkoutPlanCopyWithImpl;
@useResult
$Res call({
 PlanText headline, PlanText summary, List<PlanMetric> heroMetrics, List<TimelinePhase> timeline, List<PlanText> inferredNeeds, PlanText rationale, NutritionTarget nutrition, List<PlanSession> sessions
});


$PlanTextCopyWith<$Res> get headline;$PlanTextCopyWith<$Res> get summary;$PlanTextCopyWith<$Res> get rationale;$NutritionTargetCopyWith<$Res> get nutrition;

}
/// @nodoc
class _$WorkoutPlanCopyWithImpl<$Res>
    implements $WorkoutPlanCopyWith<$Res> {
  _$WorkoutPlanCopyWithImpl(this._self, this._then);

  final WorkoutPlan _self;
  final $Res Function(WorkoutPlan) _then;

/// Create a copy of WorkoutPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? headline = null,Object? summary = null,Object? heroMetrics = null,Object? timeline = null,Object? inferredNeeds = null,Object? rationale = null,Object? nutrition = null,Object? sessions = null,}) {
  return _then(_self.copyWith(
headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as PlanText,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as PlanText,heroMetrics: null == heroMetrics ? _self.heroMetrics : heroMetrics // ignore: cast_nullable_to_non_nullable
as List<PlanMetric>,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<TimelinePhase>,inferredNeeds: null == inferredNeeds ? _self.inferredNeeds : inferredNeeds // ignore: cast_nullable_to_non_nullable
as List<PlanText>,rationale: null == rationale ? _self.rationale : rationale // ignore: cast_nullable_to_non_nullable
as PlanText,nutrition: null == nutrition ? _self.nutrition : nutrition // ignore: cast_nullable_to_non_nullable
as NutritionTarget,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<PlanSession>,
  ));
}
/// Create a copy of WorkoutPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get headline {
  
  return $PlanTextCopyWith<$Res>(_self.headline, (value) {
    return _then(_self.copyWith(headline: value));
  });
}/// Create a copy of WorkoutPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get summary {
  
  return $PlanTextCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of WorkoutPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get rationale {
  
  return $PlanTextCopyWith<$Res>(_self.rationale, (value) {
    return _then(_self.copyWith(rationale: value));
  });
}/// Create a copy of WorkoutPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionTargetCopyWith<$Res> get nutrition {
  
  return $NutritionTargetCopyWith<$Res>(_self.nutrition, (value) {
    return _then(_self.copyWith(nutrition: value));
  });
}
}


/// Adds pattern-matching-related methods to [WorkoutPlan].
extension WorkoutPlanPatterns on WorkoutPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkoutPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkoutPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkoutPlan value)  $default,){
final _that = this;
switch (_that) {
case _WorkoutPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkoutPlan value)?  $default,){
final _that = this;
switch (_that) {
case _WorkoutPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlanText headline,  PlanText summary,  List<PlanMetric> heroMetrics,  List<TimelinePhase> timeline,  List<PlanText> inferredNeeds,  PlanText rationale,  NutritionTarget nutrition,  List<PlanSession> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutPlan() when $default != null:
return $default(_that.headline,_that.summary,_that.heroMetrics,_that.timeline,_that.inferredNeeds,_that.rationale,_that.nutrition,_that.sessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlanText headline,  PlanText summary,  List<PlanMetric> heroMetrics,  List<TimelinePhase> timeline,  List<PlanText> inferredNeeds,  PlanText rationale,  NutritionTarget nutrition,  List<PlanSession> sessions)  $default,) {final _that = this;
switch (_that) {
case _WorkoutPlan():
return $default(_that.headline,_that.summary,_that.heroMetrics,_that.timeline,_that.inferredNeeds,_that.rationale,_that.nutrition,_that.sessions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlanText headline,  PlanText summary,  List<PlanMetric> heroMetrics,  List<TimelinePhase> timeline,  List<PlanText> inferredNeeds,  PlanText rationale,  NutritionTarget nutrition,  List<PlanSession> sessions)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutPlan() when $default != null:
return $default(_that.headline,_that.summary,_that.heroMetrics,_that.timeline,_that.inferredNeeds,_that.rationale,_that.nutrition,_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkoutPlan implements WorkoutPlan {
  const _WorkoutPlan({required this.headline, required this.summary, required final  List<PlanMetric> heroMetrics, required final  List<TimelinePhase> timeline, required final  List<PlanText> inferredNeeds, required this.rationale, required this.nutrition, required final  List<PlanSession> sessions}): _heroMetrics = heroMetrics,_timeline = timeline,_inferredNeeds = inferredNeeds,_sessions = sessions;
  factory _WorkoutPlan.fromJson(Map<String, dynamic> json) => _$WorkoutPlanFromJson(json);

@override final  PlanText headline;
@override final  PlanText summary;
 final  List<PlanMetric> _heroMetrics;
@override List<PlanMetric> get heroMetrics {
  if (_heroMetrics is EqualUnmodifiableListView) return _heroMetrics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_heroMetrics);
}

 final  List<TimelinePhase> _timeline;
@override List<TimelinePhase> get timeline {
  if (_timeline is EqualUnmodifiableListView) return _timeline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeline);
}

 final  List<PlanText> _inferredNeeds;
@override List<PlanText> get inferredNeeds {
  if (_inferredNeeds is EqualUnmodifiableListView) return _inferredNeeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inferredNeeds);
}

@override final  PlanText rationale;
@override final  NutritionTarget nutrition;
 final  List<PlanSession> _sessions;
@override List<PlanSession> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of WorkoutPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutPlanCopyWith<_WorkoutPlan> get copyWith => __$WorkoutPlanCopyWithImpl<_WorkoutPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkoutPlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutPlan&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._heroMetrics, _heroMetrics)&&const DeepCollectionEquality().equals(other._timeline, _timeline)&&const DeepCollectionEquality().equals(other._inferredNeeds, _inferredNeeds)&&(identical(other.rationale, rationale) || other.rationale == rationale)&&(identical(other.nutrition, nutrition) || other.nutrition == nutrition)&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,headline,summary,const DeepCollectionEquality().hash(_heroMetrics),const DeepCollectionEquality().hash(_timeline),const DeepCollectionEquality().hash(_inferredNeeds),rationale,nutrition,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'WorkoutPlan(headline: $headline, summary: $summary, heroMetrics: $heroMetrics, timeline: $timeline, inferredNeeds: $inferredNeeds, rationale: $rationale, nutrition: $nutrition, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$WorkoutPlanCopyWith<$Res> implements $WorkoutPlanCopyWith<$Res> {
  factory _$WorkoutPlanCopyWith(_WorkoutPlan value, $Res Function(_WorkoutPlan) _then) = __$WorkoutPlanCopyWithImpl;
@override @useResult
$Res call({
 PlanText headline, PlanText summary, List<PlanMetric> heroMetrics, List<TimelinePhase> timeline, List<PlanText> inferredNeeds, PlanText rationale, NutritionTarget nutrition, List<PlanSession> sessions
});


@override $PlanTextCopyWith<$Res> get headline;@override $PlanTextCopyWith<$Res> get summary;@override $PlanTextCopyWith<$Res> get rationale;@override $NutritionTargetCopyWith<$Res> get nutrition;

}
/// @nodoc
class __$WorkoutPlanCopyWithImpl<$Res>
    implements _$WorkoutPlanCopyWith<$Res> {
  __$WorkoutPlanCopyWithImpl(this._self, this._then);

  final _WorkoutPlan _self;
  final $Res Function(_WorkoutPlan) _then;

/// Create a copy of WorkoutPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? headline = null,Object? summary = null,Object? heroMetrics = null,Object? timeline = null,Object? inferredNeeds = null,Object? rationale = null,Object? nutrition = null,Object? sessions = null,}) {
  return _then(_WorkoutPlan(
headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as PlanText,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as PlanText,heroMetrics: null == heroMetrics ? _self._heroMetrics : heroMetrics // ignore: cast_nullable_to_non_nullable
as List<PlanMetric>,timeline: null == timeline ? _self._timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<TimelinePhase>,inferredNeeds: null == inferredNeeds ? _self._inferredNeeds : inferredNeeds // ignore: cast_nullable_to_non_nullable
as List<PlanText>,rationale: null == rationale ? _self.rationale : rationale // ignore: cast_nullable_to_non_nullable
as PlanText,nutrition: null == nutrition ? _self.nutrition : nutrition // ignore: cast_nullable_to_non_nullable
as NutritionTarget,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<PlanSession>,
  ));
}

/// Create a copy of WorkoutPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get headline {
  
  return $PlanTextCopyWith<$Res>(_self.headline, (value) {
    return _then(_self.copyWith(headline: value));
  });
}/// Create a copy of WorkoutPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get summary {
  
  return $PlanTextCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of WorkoutPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanTextCopyWith<$Res> get rationale {
  
  return $PlanTextCopyWith<$Res>(_self.rationale, (value) {
    return _then(_self.copyWith(rationale: value));
  });
}/// Create a copy of WorkoutPlan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionTargetCopyWith<$Res> get nutrition {
  
  return $NutritionTargetCopyWith<$Res>(_self.nutrition, (value) {
    return _then(_self.copyWith(nutrition: value));
  });
}
}

// dart format on
