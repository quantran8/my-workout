// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoggedDay {

 DateTime get date; bool get completed;
/// Create a copy of LoggedDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoggedDayCopyWith<LoggedDay> get copyWith => _$LoggedDayCopyWithImpl<LoggedDay>(this as LoggedDay, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoggedDay&&(identical(other.date, date) || other.date == date)&&(identical(other.completed, completed) || other.completed == completed));
}


@override
int get hashCode => Object.hash(runtimeType,date,completed);

@override
String toString() {
  return 'LoggedDay(date: $date, completed: $completed)';
}


}

/// @nodoc
abstract mixin class $LoggedDayCopyWith<$Res>  {
  factory $LoggedDayCopyWith(LoggedDay value, $Res Function(LoggedDay) _then) = _$LoggedDayCopyWithImpl;
@useResult
$Res call({
 DateTime date, bool completed
});




}
/// @nodoc
class _$LoggedDayCopyWithImpl<$Res>
    implements $LoggedDayCopyWith<$Res> {
  _$LoggedDayCopyWithImpl(this._self, this._then);

  final LoggedDay _self;
  final $Res Function(LoggedDay) _then;

/// Create a copy of LoggedDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? completed = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LoggedDay].
extension LoggedDayPatterns on LoggedDay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoggedDay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoggedDay() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoggedDay value)  $default,){
final _that = this;
switch (_that) {
case _LoggedDay():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoggedDay value)?  $default,){
final _that = this;
switch (_that) {
case _LoggedDay() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  bool completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoggedDay() when $default != null:
return $default(_that.date,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  bool completed)  $default,) {final _that = this;
switch (_that) {
case _LoggedDay():
return $default(_that.date,_that.completed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  bool completed)?  $default,) {final _that = this;
switch (_that) {
case _LoggedDay() when $default != null:
return $default(_that.date,_that.completed);case _:
  return null;

}
}

}

/// @nodoc


class _LoggedDay extends LoggedDay {
  const _LoggedDay({required this.date, required this.completed}): super._();
  

@override final  DateTime date;
@override final  bool completed;

/// Create a copy of LoggedDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoggedDayCopyWith<_LoggedDay> get copyWith => __$LoggedDayCopyWithImpl<_LoggedDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoggedDay&&(identical(other.date, date) || other.date == date)&&(identical(other.completed, completed) || other.completed == completed));
}


@override
int get hashCode => Object.hash(runtimeType,date,completed);

@override
String toString() {
  return 'LoggedDay(date: $date, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$LoggedDayCopyWith<$Res> implements $LoggedDayCopyWith<$Res> {
  factory _$LoggedDayCopyWith(_LoggedDay value, $Res Function(_LoggedDay) _then) = __$LoggedDayCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, bool completed
});




}
/// @nodoc
class __$LoggedDayCopyWithImpl<$Res>
    implements _$LoggedDayCopyWith<$Res> {
  __$LoggedDayCopyWithImpl(this._self, this._then);

  final _LoggedDay _self;
  final $Res Function(_LoggedDay) _then;

/// Create a copy of LoggedDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? completed = null,}) {
  return _then(_LoggedDay(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SessionLog {

 List<LoggedDay> get days;/// Distinct sessions logged, which gates the Progress analysis. Kept
/// separate from `days.length` because the baseline counts *comparable*
/// sessions — the same movement pattern repeated — not calendar days.
 int get baselineSessions;
/// Create a copy of SessionLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionLogCopyWith<SessionLog> get copyWith => _$SessionLogCopyWithImpl<SessionLog>(this as SessionLog, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionLog&&const DeepCollectionEquality().equals(other.days, days)&&(identical(other.baselineSessions, baselineSessions) || other.baselineSessions == baselineSessions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(days),baselineSessions);

@override
String toString() {
  return 'SessionLog(days: $days, baselineSessions: $baselineSessions)';
}


}

/// @nodoc
abstract mixin class $SessionLogCopyWith<$Res>  {
  factory $SessionLogCopyWith(SessionLog value, $Res Function(SessionLog) _then) = _$SessionLogCopyWithImpl;
@useResult
$Res call({
 List<LoggedDay> days, int baselineSessions
});




}
/// @nodoc
class _$SessionLogCopyWithImpl<$Res>
    implements $SessionLogCopyWith<$Res> {
  _$SessionLogCopyWithImpl(this._self, this._then);

  final SessionLog _self;
  final $Res Function(SessionLog) _then;

/// Create a copy of SessionLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? days = null,Object? baselineSessions = null,}) {
  return _then(_self.copyWith(
days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<LoggedDay>,baselineSessions: null == baselineSessions ? _self.baselineSessions : baselineSessions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionLog].
extension SessionLogPatterns on SessionLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionLog value)  $default,){
final _that = this;
switch (_that) {
case _SessionLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionLog value)?  $default,){
final _that = this;
switch (_that) {
case _SessionLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LoggedDay> days,  int baselineSessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionLog() when $default != null:
return $default(_that.days,_that.baselineSessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LoggedDay> days,  int baselineSessions)  $default,) {final _that = this;
switch (_that) {
case _SessionLog():
return $default(_that.days,_that.baselineSessions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LoggedDay> days,  int baselineSessions)?  $default,) {final _that = this;
switch (_that) {
case _SessionLog() when $default != null:
return $default(_that.days,_that.baselineSessions);case _:
  return null;

}
}

}

/// @nodoc


class _SessionLog extends SessionLog {
  const _SessionLog({required final  List<LoggedDay> days, required this.baselineSessions}): _days = days,super._();
  

 final  List<LoggedDay> _days;
@override List<LoggedDay> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}

/// Distinct sessions logged, which gates the Progress analysis. Kept
/// separate from `days.length` because the baseline counts *comparable*
/// sessions — the same movement pattern repeated — not calendar days.
@override final  int baselineSessions;

/// Create a copy of SessionLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionLogCopyWith<_SessionLog> get copyWith => __$SessionLogCopyWithImpl<_SessionLog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionLog&&const DeepCollectionEquality().equals(other._days, _days)&&(identical(other.baselineSessions, baselineSessions) || other.baselineSessions == baselineSessions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_days),baselineSessions);

@override
String toString() {
  return 'SessionLog(days: $days, baselineSessions: $baselineSessions)';
}


}

/// @nodoc
abstract mixin class _$SessionLogCopyWith<$Res> implements $SessionLogCopyWith<$Res> {
  factory _$SessionLogCopyWith(_SessionLog value, $Res Function(_SessionLog) _then) = __$SessionLogCopyWithImpl;
@override @useResult
$Res call({
 List<LoggedDay> days, int baselineSessions
});




}
/// @nodoc
class __$SessionLogCopyWithImpl<$Res>
    implements _$SessionLogCopyWith<$Res> {
  __$SessionLogCopyWithImpl(this._self, this._then);

  final _SessionLog _self;
  final $Res Function(_SessionLog) _then;

/// Create a copy of SessionLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? days = null,Object? baselineSessions = null,}) {
  return _then(_SessionLog(
days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<LoggedDay>,baselineSessions: null == baselineSessions ? _self.baselineSessions : baselineSessions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
