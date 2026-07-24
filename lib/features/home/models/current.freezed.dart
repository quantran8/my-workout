// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Current {

 CurrentStatus get status; String get date; int? get weekNumber; int? get dayNumber; String? get programRevisionId; SessionSummary? get session; SessionSummary? get nextSession; int get completed; int get total;
/// Create a copy of Current
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentCopyWith<Current> get copyWith => _$CurrentCopyWithImpl<Current>(this as Current, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Current&&(identical(other.status, status) || other.status == status)&&(identical(other.date, date) || other.date == date)&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&(identical(other.programRevisionId, programRevisionId) || other.programRevisionId == programRevisionId)&&(identical(other.session, session) || other.session == session)&&(identical(other.nextSession, nextSession) || other.nextSession == nextSession)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,status,date,weekNumber,dayNumber,programRevisionId,session,nextSession,completed,total);

@override
String toString() {
  return 'Current(status: $status, date: $date, weekNumber: $weekNumber, dayNumber: $dayNumber, programRevisionId: $programRevisionId, session: $session, nextSession: $nextSession, completed: $completed, total: $total)';
}


}

/// @nodoc
abstract mixin class $CurrentCopyWith<$Res>  {
  factory $CurrentCopyWith(Current value, $Res Function(Current) _then) = _$CurrentCopyWithImpl;
@useResult
$Res call({
 CurrentStatus status, String date, int? weekNumber, int? dayNumber, String? programRevisionId, SessionSummary? session, SessionSummary? nextSession, int completed, int total
});


$SessionSummaryCopyWith<$Res>? get session;$SessionSummaryCopyWith<$Res>? get nextSession;

}
/// @nodoc
class _$CurrentCopyWithImpl<$Res>
    implements $CurrentCopyWith<$Res> {
  _$CurrentCopyWithImpl(this._self, this._then);

  final Current _self;
  final $Res Function(Current) _then;

/// Create a copy of Current
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? date = null,Object? weekNumber = freezed,Object? dayNumber = freezed,Object? programRevisionId = freezed,Object? session = freezed,Object? nextSession = freezed,Object? completed = null,Object? total = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CurrentStatus,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,weekNumber: freezed == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int?,dayNumber: freezed == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int?,programRevisionId: freezed == programRevisionId ? _self.programRevisionId : programRevisionId // ignore: cast_nullable_to_non_nullable
as String?,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as SessionSummary?,nextSession: freezed == nextSession ? _self.nextSession : nextSession // ignore: cast_nullable_to_non_nullable
as SessionSummary?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Current
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionSummaryCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $SessionSummaryCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of Current
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionSummaryCopyWith<$Res>? get nextSession {
    if (_self.nextSession == null) {
    return null;
  }

  return $SessionSummaryCopyWith<$Res>(_self.nextSession!, (value) {
    return _then(_self.copyWith(nextSession: value));
  });
}
}


/// Adds pattern-matching-related methods to [Current].
extension CurrentPatterns on Current {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Current value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Current() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Current value)  $default,){
final _that = this;
switch (_that) {
case _Current():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Current value)?  $default,){
final _that = this;
switch (_that) {
case _Current() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CurrentStatus status,  String date,  int? weekNumber,  int? dayNumber,  String? programRevisionId,  SessionSummary? session,  SessionSummary? nextSession,  int completed,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Current() when $default != null:
return $default(_that.status,_that.date,_that.weekNumber,_that.dayNumber,_that.programRevisionId,_that.session,_that.nextSession,_that.completed,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CurrentStatus status,  String date,  int? weekNumber,  int? dayNumber,  String? programRevisionId,  SessionSummary? session,  SessionSummary? nextSession,  int completed,  int total)  $default,) {final _that = this;
switch (_that) {
case _Current():
return $default(_that.status,_that.date,_that.weekNumber,_that.dayNumber,_that.programRevisionId,_that.session,_that.nextSession,_that.completed,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CurrentStatus status,  String date,  int? weekNumber,  int? dayNumber,  String? programRevisionId,  SessionSummary? session,  SessionSummary? nextSession,  int completed,  int total)?  $default,) {final _that = this;
switch (_that) {
case _Current() when $default != null:
return $default(_that.status,_that.date,_that.weekNumber,_that.dayNumber,_that.programRevisionId,_that.session,_that.nextSession,_that.completed,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _Current extends Current {
  const _Current({required this.status, required this.date, this.weekNumber, this.dayNumber, required this.programRevisionId, required this.session, required this.nextSession, required this.completed, required this.total}): super._();
  

@override final  CurrentStatus status;
@override final  String date;
@override final  int? weekNumber;
@override final  int? dayNumber;
@override final  String? programRevisionId;
@override final  SessionSummary? session;
@override final  SessionSummary? nextSession;
@override final  int completed;
@override final  int total;

/// Create a copy of Current
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentCopyWith<_Current> get copyWith => __$CurrentCopyWithImpl<_Current>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Current&&(identical(other.status, status) || other.status == status)&&(identical(other.date, date) || other.date == date)&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&(identical(other.programRevisionId, programRevisionId) || other.programRevisionId == programRevisionId)&&(identical(other.session, session) || other.session == session)&&(identical(other.nextSession, nextSession) || other.nextSession == nextSession)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,status,date,weekNumber,dayNumber,programRevisionId,session,nextSession,completed,total);

@override
String toString() {
  return 'Current(status: $status, date: $date, weekNumber: $weekNumber, dayNumber: $dayNumber, programRevisionId: $programRevisionId, session: $session, nextSession: $nextSession, completed: $completed, total: $total)';
}


}

/// @nodoc
abstract mixin class _$CurrentCopyWith<$Res> implements $CurrentCopyWith<$Res> {
  factory _$CurrentCopyWith(_Current value, $Res Function(_Current) _then) = __$CurrentCopyWithImpl;
@override @useResult
$Res call({
 CurrentStatus status, String date, int? weekNumber, int? dayNumber, String? programRevisionId, SessionSummary? session, SessionSummary? nextSession, int completed, int total
});


@override $SessionSummaryCopyWith<$Res>? get session;@override $SessionSummaryCopyWith<$Res>? get nextSession;

}
/// @nodoc
class __$CurrentCopyWithImpl<$Res>
    implements _$CurrentCopyWith<$Res> {
  __$CurrentCopyWithImpl(this._self, this._then);

  final _Current _self;
  final $Res Function(_Current) _then;

/// Create a copy of Current
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? date = null,Object? weekNumber = freezed,Object? dayNumber = freezed,Object? programRevisionId = freezed,Object? session = freezed,Object? nextSession = freezed,Object? completed = null,Object? total = null,}) {
  return _then(_Current(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CurrentStatus,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,weekNumber: freezed == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int?,dayNumber: freezed == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int?,programRevisionId: freezed == programRevisionId ? _self.programRevisionId : programRevisionId // ignore: cast_nullable_to_non_nullable
as String?,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as SessionSummary?,nextSession: freezed == nextSession ? _self.nextSession : nextSession // ignore: cast_nullable_to_non_nullable
as SessionSummary?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Current
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionSummaryCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $SessionSummaryCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of Current
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionSummaryCopyWith<$Res>? get nextSession {
    if (_self.nextSession == null) {
    return null;
  }

  return $SessionSummaryCopyWith<$Res>(_self.nextSession!, (value) {
    return _then(_self.copyWith(nextSession: value));
  });
}
}


/// @nodoc
mixin _$SessionSummary {

 String get plannedSessionId; String get programRevisionId; String get name; int get exercises;
/// Create a copy of SessionSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionSummaryCopyWith<SessionSummary> get copyWith => _$SessionSummaryCopyWithImpl<SessionSummary>(this as SessionSummary, _$identity);

  /// Serializes this SessionSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionSummary&&(identical(other.plannedSessionId, plannedSessionId) || other.plannedSessionId == plannedSessionId)&&(identical(other.programRevisionId, programRevisionId) || other.programRevisionId == programRevisionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.exercises, exercises) || other.exercises == exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,plannedSessionId,programRevisionId,name,exercises);

@override
String toString() {
  return 'SessionSummary(plannedSessionId: $plannedSessionId, programRevisionId: $programRevisionId, name: $name, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class $SessionSummaryCopyWith<$Res>  {
  factory $SessionSummaryCopyWith(SessionSummary value, $Res Function(SessionSummary) _then) = _$SessionSummaryCopyWithImpl;
@useResult
$Res call({
 String plannedSessionId, String programRevisionId, String name, int exercises
});




}
/// @nodoc
class _$SessionSummaryCopyWithImpl<$Res>
    implements $SessionSummaryCopyWith<$Res> {
  _$SessionSummaryCopyWithImpl(this._self, this._then);

  final SessionSummary _self;
  final $Res Function(SessionSummary) _then;

/// Create a copy of SessionSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plannedSessionId = null,Object? programRevisionId = null,Object? name = null,Object? exercises = null,}) {
  return _then(_self.copyWith(
plannedSessionId: null == plannedSessionId ? _self.plannedSessionId : plannedSessionId // ignore: cast_nullable_to_non_nullable
as String,programRevisionId: null == programRevisionId ? _self.programRevisionId : programRevisionId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,exercises: null == exercises ? _self.exercises : exercises // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionSummary].
extension SessionSummaryPatterns on SessionSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionSummary value)  $default,){
final _that = this;
switch (_that) {
case _SessionSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionSummary value)?  $default,){
final _that = this;
switch (_that) {
case _SessionSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String plannedSessionId,  String programRevisionId,  String name,  int exercises)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionSummary() when $default != null:
return $default(_that.plannedSessionId,_that.programRevisionId,_that.name,_that.exercises);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String plannedSessionId,  String programRevisionId,  String name,  int exercises)  $default,) {final _that = this;
switch (_that) {
case _SessionSummary():
return $default(_that.plannedSessionId,_that.programRevisionId,_that.name,_that.exercises);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String plannedSessionId,  String programRevisionId,  String name,  int exercises)?  $default,) {final _that = this;
switch (_that) {
case _SessionSummary() when $default != null:
return $default(_that.plannedSessionId,_that.programRevisionId,_that.name,_that.exercises);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionSummary implements SessionSummary {
  const _SessionSummary({required this.plannedSessionId, required this.programRevisionId, required this.name, required this.exercises});
  factory _SessionSummary.fromJson(Map<String, dynamic> json) => _$SessionSummaryFromJson(json);

@override final  String plannedSessionId;
@override final  String programRevisionId;
@override final  String name;
@override final  int exercises;

/// Create a copy of SessionSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionSummaryCopyWith<_SessionSummary> get copyWith => __$SessionSummaryCopyWithImpl<_SessionSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionSummary&&(identical(other.plannedSessionId, plannedSessionId) || other.plannedSessionId == plannedSessionId)&&(identical(other.programRevisionId, programRevisionId) || other.programRevisionId == programRevisionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.exercises, exercises) || other.exercises == exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,plannedSessionId,programRevisionId,name,exercises);

@override
String toString() {
  return 'SessionSummary(plannedSessionId: $plannedSessionId, programRevisionId: $programRevisionId, name: $name, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class _$SessionSummaryCopyWith<$Res> implements $SessionSummaryCopyWith<$Res> {
  factory _$SessionSummaryCopyWith(_SessionSummary value, $Res Function(_SessionSummary) _then) = __$SessionSummaryCopyWithImpl;
@override @useResult
$Res call({
 String plannedSessionId, String programRevisionId, String name, int exercises
});




}
/// @nodoc
class __$SessionSummaryCopyWithImpl<$Res>
    implements _$SessionSummaryCopyWith<$Res> {
  __$SessionSummaryCopyWithImpl(this._self, this._then);

  final _SessionSummary _self;
  final $Res Function(_SessionSummary) _then;

/// Create a copy of SessionSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plannedSessionId = null,Object? programRevisionId = null,Object? name = null,Object? exercises = null,}) {
  return _then(_SessionSummary(
plannedSessionId: null == plannedSessionId ? _self.plannedSessionId : plannedSessionId // ignore: cast_nullable_to_non_nullable
as String,programRevisionId: null == programRevisionId ? _self.programRevisionId : programRevisionId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,exercises: null == exercises ? _self.exercises : exercises // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
