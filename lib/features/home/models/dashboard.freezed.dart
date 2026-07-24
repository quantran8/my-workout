// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Dashboard {

 SessionLog get sessionLog; int get streak; double get adherence; int get due; int get done; AccessTier get accessTier; DashboardNextSession? get nextSession; DashboardRecentSession? get recent;
/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardCopyWith<Dashboard> get copyWith => _$DashboardCopyWithImpl<Dashboard>(this as Dashboard, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dashboard&&(identical(other.sessionLog, sessionLog) || other.sessionLog == sessionLog)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.adherence, adherence) || other.adherence == adherence)&&(identical(other.due, due) || other.due == due)&&(identical(other.done, done) || other.done == done)&&(identical(other.accessTier, accessTier) || other.accessTier == accessTier)&&(identical(other.nextSession, nextSession) || other.nextSession == nextSession)&&(identical(other.recent, recent) || other.recent == recent));
}


@override
int get hashCode => Object.hash(runtimeType,sessionLog,streak,adherence,due,done,accessTier,nextSession,recent);

@override
String toString() {
  return 'Dashboard(sessionLog: $sessionLog, streak: $streak, adherence: $adherence, due: $due, done: $done, accessTier: $accessTier, nextSession: $nextSession, recent: $recent)';
}


}

/// @nodoc
abstract mixin class $DashboardCopyWith<$Res>  {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) _then) = _$DashboardCopyWithImpl;
@useResult
$Res call({
 SessionLog sessionLog, int streak, double adherence, int due, int done, AccessTier accessTier, DashboardNextSession? nextSession, DashboardRecentSession? recent
});


$SessionLogCopyWith<$Res> get sessionLog;$DashboardNextSessionCopyWith<$Res>? get nextSession;$DashboardRecentSessionCopyWith<$Res>? get recent;

}
/// @nodoc
class _$DashboardCopyWithImpl<$Res>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._self, this._then);

  final Dashboard _self;
  final $Res Function(Dashboard) _then;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionLog = null,Object? streak = null,Object? adherence = null,Object? due = null,Object? done = null,Object? accessTier = null,Object? nextSession = freezed,Object? recent = freezed,}) {
  return _then(_self.copyWith(
sessionLog: null == sessionLog ? _self.sessionLog : sessionLog // ignore: cast_nullable_to_non_nullable
as SessionLog,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as int,adherence: null == adherence ? _self.adherence : adherence // ignore: cast_nullable_to_non_nullable
as double,due: null == due ? _self.due : due // ignore: cast_nullable_to_non_nullable
as int,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as int,accessTier: null == accessTier ? _self.accessTier : accessTier // ignore: cast_nullable_to_non_nullable
as AccessTier,nextSession: freezed == nextSession ? _self.nextSession : nextSession // ignore: cast_nullable_to_non_nullable
as DashboardNextSession?,recent: freezed == recent ? _self.recent : recent // ignore: cast_nullable_to_non_nullable
as DashboardRecentSession?,
  ));
}
/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionLogCopyWith<$Res> get sessionLog {
  
  return $SessionLogCopyWith<$Res>(_self.sessionLog, (value) {
    return _then(_self.copyWith(sessionLog: value));
  });
}/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardNextSessionCopyWith<$Res>? get nextSession {
    if (_self.nextSession == null) {
    return null;
  }

  return $DashboardNextSessionCopyWith<$Res>(_self.nextSession!, (value) {
    return _then(_self.copyWith(nextSession: value));
  });
}/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardRecentSessionCopyWith<$Res>? get recent {
    if (_self.recent == null) {
    return null;
  }

  return $DashboardRecentSessionCopyWith<$Res>(_self.recent!, (value) {
    return _then(_self.copyWith(recent: value));
  });
}
}


/// Adds pattern-matching-related methods to [Dashboard].
extension DashboardPatterns on Dashboard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Dashboard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Dashboard value)  $default,){
final _that = this;
switch (_that) {
case _Dashboard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Dashboard value)?  $default,){
final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SessionLog sessionLog,  int streak,  double adherence,  int due,  int done,  AccessTier accessTier,  DashboardNextSession? nextSession,  DashboardRecentSession? recent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
return $default(_that.sessionLog,_that.streak,_that.adherence,_that.due,_that.done,_that.accessTier,_that.nextSession,_that.recent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SessionLog sessionLog,  int streak,  double adherence,  int due,  int done,  AccessTier accessTier,  DashboardNextSession? nextSession,  DashboardRecentSession? recent)  $default,) {final _that = this;
switch (_that) {
case _Dashboard():
return $default(_that.sessionLog,_that.streak,_that.adherence,_that.due,_that.done,_that.accessTier,_that.nextSession,_that.recent);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SessionLog sessionLog,  int streak,  double adherence,  int due,  int done,  AccessTier accessTier,  DashboardNextSession? nextSession,  DashboardRecentSession? recent)?  $default,) {final _that = this;
switch (_that) {
case _Dashboard() when $default != null:
return $default(_that.sessionLog,_that.streak,_that.adherence,_that.due,_that.done,_that.accessTier,_that.nextSession,_that.recent);case _:
  return null;

}
}

}

/// @nodoc


class _Dashboard extends Dashboard {
  const _Dashboard({required this.sessionLog, required this.streak, required this.adherence, required this.due, required this.done, required this.accessTier, required this.nextSession, required this.recent}): super._();
  

@override final  SessionLog sessionLog;
@override final  int streak;
@override final  double adherence;
@override final  int due;
@override final  int done;
@override final  AccessTier accessTier;
@override final  DashboardNextSession? nextSession;
@override final  DashboardRecentSession? recent;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardCopyWith<_Dashboard> get copyWith => __$DashboardCopyWithImpl<_Dashboard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dashboard&&(identical(other.sessionLog, sessionLog) || other.sessionLog == sessionLog)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.adherence, adherence) || other.adherence == adherence)&&(identical(other.due, due) || other.due == due)&&(identical(other.done, done) || other.done == done)&&(identical(other.accessTier, accessTier) || other.accessTier == accessTier)&&(identical(other.nextSession, nextSession) || other.nextSession == nextSession)&&(identical(other.recent, recent) || other.recent == recent));
}


@override
int get hashCode => Object.hash(runtimeType,sessionLog,streak,adherence,due,done,accessTier,nextSession,recent);

@override
String toString() {
  return 'Dashboard(sessionLog: $sessionLog, streak: $streak, adherence: $adherence, due: $due, done: $done, accessTier: $accessTier, nextSession: $nextSession, recent: $recent)';
}


}

/// @nodoc
abstract mixin class _$DashboardCopyWith<$Res> implements $DashboardCopyWith<$Res> {
  factory _$DashboardCopyWith(_Dashboard value, $Res Function(_Dashboard) _then) = __$DashboardCopyWithImpl;
@override @useResult
$Res call({
 SessionLog sessionLog, int streak, double adherence, int due, int done, AccessTier accessTier, DashboardNextSession? nextSession, DashboardRecentSession? recent
});


@override $SessionLogCopyWith<$Res> get sessionLog;@override $DashboardNextSessionCopyWith<$Res>? get nextSession;@override $DashboardRecentSessionCopyWith<$Res>? get recent;

}
/// @nodoc
class __$DashboardCopyWithImpl<$Res>
    implements _$DashboardCopyWith<$Res> {
  __$DashboardCopyWithImpl(this._self, this._then);

  final _Dashboard _self;
  final $Res Function(_Dashboard) _then;

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionLog = null,Object? streak = null,Object? adherence = null,Object? due = null,Object? done = null,Object? accessTier = null,Object? nextSession = freezed,Object? recent = freezed,}) {
  return _then(_Dashboard(
sessionLog: null == sessionLog ? _self.sessionLog : sessionLog // ignore: cast_nullable_to_non_nullable
as SessionLog,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as int,adherence: null == adherence ? _self.adherence : adherence // ignore: cast_nullable_to_non_nullable
as double,due: null == due ? _self.due : due // ignore: cast_nullable_to_non_nullable
as int,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as int,accessTier: null == accessTier ? _self.accessTier : accessTier // ignore: cast_nullable_to_non_nullable
as AccessTier,nextSession: freezed == nextSession ? _self.nextSession : nextSession // ignore: cast_nullable_to_non_nullable
as DashboardNextSession?,recent: freezed == recent ? _self.recent : recent // ignore: cast_nullable_to_non_nullable
as DashboardRecentSession?,
  ));
}

/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionLogCopyWith<$Res> get sessionLog {
  
  return $SessionLogCopyWith<$Res>(_self.sessionLog, (value) {
    return _then(_self.copyWith(sessionLog: value));
  });
}/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardNextSessionCopyWith<$Res>? get nextSession {
    if (_self.nextSession == null) {
    return null;
  }

  return $DashboardNextSessionCopyWith<$Res>(_self.nextSession!, (value) {
    return _then(_self.copyWith(nextSession: value));
  });
}/// Create a copy of Dashboard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardRecentSessionCopyWith<$Res>? get recent {
    if (_self.recent == null) {
    return null;
  }

  return $DashboardRecentSessionCopyWith<$Res>(_self.recent!, (value) {
    return _then(_self.copyWith(recent: value));
  });
}
}


/// @nodoc
mixin _$DashboardNextSession {

 String get plannedSessionId; String get programRevisionId; String get name; int get durationMin; int get exercises;
/// Create a copy of DashboardNextSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardNextSessionCopyWith<DashboardNextSession> get copyWith => _$DashboardNextSessionCopyWithImpl<DashboardNextSession>(this as DashboardNextSession, _$identity);

  /// Serializes this DashboardNextSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardNextSession&&(identical(other.plannedSessionId, plannedSessionId) || other.plannedSessionId == plannedSessionId)&&(identical(other.programRevisionId, programRevisionId) || other.programRevisionId == programRevisionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.durationMin, durationMin) || other.durationMin == durationMin)&&(identical(other.exercises, exercises) || other.exercises == exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,plannedSessionId,programRevisionId,name,durationMin,exercises);

@override
String toString() {
  return 'DashboardNextSession(plannedSessionId: $plannedSessionId, programRevisionId: $programRevisionId, name: $name, durationMin: $durationMin, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class $DashboardNextSessionCopyWith<$Res>  {
  factory $DashboardNextSessionCopyWith(DashboardNextSession value, $Res Function(DashboardNextSession) _then) = _$DashboardNextSessionCopyWithImpl;
@useResult
$Res call({
 String plannedSessionId, String programRevisionId, String name, int durationMin, int exercises
});




}
/// @nodoc
class _$DashboardNextSessionCopyWithImpl<$Res>
    implements $DashboardNextSessionCopyWith<$Res> {
  _$DashboardNextSessionCopyWithImpl(this._self, this._then);

  final DashboardNextSession _self;
  final $Res Function(DashboardNextSession) _then;

/// Create a copy of DashboardNextSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plannedSessionId = null,Object? programRevisionId = null,Object? name = null,Object? durationMin = null,Object? exercises = null,}) {
  return _then(_self.copyWith(
plannedSessionId: null == plannedSessionId ? _self.plannedSessionId : plannedSessionId // ignore: cast_nullable_to_non_nullable
as String,programRevisionId: null == programRevisionId ? _self.programRevisionId : programRevisionId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,durationMin: null == durationMin ? _self.durationMin : durationMin // ignore: cast_nullable_to_non_nullable
as int,exercises: null == exercises ? _self.exercises : exercises // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardNextSession].
extension DashboardNextSessionPatterns on DashboardNextSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardNextSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardNextSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardNextSession value)  $default,){
final _that = this;
switch (_that) {
case _DashboardNextSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardNextSession value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardNextSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String plannedSessionId,  String programRevisionId,  String name,  int durationMin,  int exercises)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardNextSession() when $default != null:
return $default(_that.plannedSessionId,_that.programRevisionId,_that.name,_that.durationMin,_that.exercises);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String plannedSessionId,  String programRevisionId,  String name,  int durationMin,  int exercises)  $default,) {final _that = this;
switch (_that) {
case _DashboardNextSession():
return $default(_that.plannedSessionId,_that.programRevisionId,_that.name,_that.durationMin,_that.exercises);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String plannedSessionId,  String programRevisionId,  String name,  int durationMin,  int exercises)?  $default,) {final _that = this;
switch (_that) {
case _DashboardNextSession() when $default != null:
return $default(_that.plannedSessionId,_that.programRevisionId,_that.name,_that.durationMin,_that.exercises);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardNextSession implements DashboardNextSession {
  const _DashboardNextSession({required this.plannedSessionId, required this.programRevisionId, required this.name, required this.durationMin, required this.exercises});
  factory _DashboardNextSession.fromJson(Map<String, dynamic> json) => _$DashboardNextSessionFromJson(json);

@override final  String plannedSessionId;
@override final  String programRevisionId;
@override final  String name;
@override final  int durationMin;
@override final  int exercises;

/// Create a copy of DashboardNextSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardNextSessionCopyWith<_DashboardNextSession> get copyWith => __$DashboardNextSessionCopyWithImpl<_DashboardNextSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardNextSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardNextSession&&(identical(other.plannedSessionId, plannedSessionId) || other.plannedSessionId == plannedSessionId)&&(identical(other.programRevisionId, programRevisionId) || other.programRevisionId == programRevisionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.durationMin, durationMin) || other.durationMin == durationMin)&&(identical(other.exercises, exercises) || other.exercises == exercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,plannedSessionId,programRevisionId,name,durationMin,exercises);

@override
String toString() {
  return 'DashboardNextSession(plannedSessionId: $plannedSessionId, programRevisionId: $programRevisionId, name: $name, durationMin: $durationMin, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class _$DashboardNextSessionCopyWith<$Res> implements $DashboardNextSessionCopyWith<$Res> {
  factory _$DashboardNextSessionCopyWith(_DashboardNextSession value, $Res Function(_DashboardNextSession) _then) = __$DashboardNextSessionCopyWithImpl;
@override @useResult
$Res call({
 String plannedSessionId, String programRevisionId, String name, int durationMin, int exercises
});




}
/// @nodoc
class __$DashboardNextSessionCopyWithImpl<$Res>
    implements _$DashboardNextSessionCopyWith<$Res> {
  __$DashboardNextSessionCopyWithImpl(this._self, this._then);

  final _DashboardNextSession _self;
  final $Res Function(_DashboardNextSession) _then;

/// Create a copy of DashboardNextSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plannedSessionId = null,Object? programRevisionId = null,Object? name = null,Object? durationMin = null,Object? exercises = null,}) {
  return _then(_DashboardNextSession(
plannedSessionId: null == plannedSessionId ? _self.plannedSessionId : plannedSessionId // ignore: cast_nullable_to_non_nullable
as String,programRevisionId: null == programRevisionId ? _self.programRevisionId : programRevisionId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,durationMin: null == durationMin ? _self.durationMin : durationMin // ignore: cast_nullable_to_non_nullable
as int,exercises: null == exercises ? _self.exercises : exercises // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DashboardRecentSession {

 String get sessionId; String get name; int get volumeKg; int get exercises; DateTime get completedAt;
/// Create a copy of DashboardRecentSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardRecentSessionCopyWith<DashboardRecentSession> get copyWith => _$DashboardRecentSessionCopyWithImpl<DashboardRecentSession>(this as DashboardRecentSession, _$identity);

  /// Serializes this DashboardRecentSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardRecentSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.volumeKg, volumeKg) || other.volumeKg == volumeKg)&&(identical(other.exercises, exercises) || other.exercises == exercises)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,name,volumeKg,exercises,completedAt);

@override
String toString() {
  return 'DashboardRecentSession(sessionId: $sessionId, name: $name, volumeKg: $volumeKg, exercises: $exercises, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $DashboardRecentSessionCopyWith<$Res>  {
  factory $DashboardRecentSessionCopyWith(DashboardRecentSession value, $Res Function(DashboardRecentSession) _then) = _$DashboardRecentSessionCopyWithImpl;
@useResult
$Res call({
 String sessionId, String name, int volumeKg, int exercises, DateTime completedAt
});




}
/// @nodoc
class _$DashboardRecentSessionCopyWithImpl<$Res>
    implements $DashboardRecentSessionCopyWith<$Res> {
  _$DashboardRecentSessionCopyWithImpl(this._self, this._then);

  final DashboardRecentSession _self;
  final $Res Function(DashboardRecentSession) _then;

/// Create a copy of DashboardRecentSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? name = null,Object? volumeKg = null,Object? exercises = null,Object? completedAt = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,volumeKg: null == volumeKg ? _self.volumeKg : volumeKg // ignore: cast_nullable_to_non_nullable
as int,exercises: null == exercises ? _self.exercises : exercises // ignore: cast_nullable_to_non_nullable
as int,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardRecentSession].
extension DashboardRecentSessionPatterns on DashboardRecentSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardRecentSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardRecentSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardRecentSession value)  $default,){
final _that = this;
switch (_that) {
case _DashboardRecentSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardRecentSession value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardRecentSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  String name,  int volumeKg,  int exercises,  DateTime completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardRecentSession() when $default != null:
return $default(_that.sessionId,_that.name,_that.volumeKg,_that.exercises,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  String name,  int volumeKg,  int exercises,  DateTime completedAt)  $default,) {final _that = this;
switch (_that) {
case _DashboardRecentSession():
return $default(_that.sessionId,_that.name,_that.volumeKg,_that.exercises,_that.completedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  String name,  int volumeKg,  int exercises,  DateTime completedAt)?  $default,) {final _that = this;
switch (_that) {
case _DashboardRecentSession() when $default != null:
return $default(_that.sessionId,_that.name,_that.volumeKg,_that.exercises,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardRecentSession implements DashboardRecentSession {
  const _DashboardRecentSession({required this.sessionId, required this.name, required this.volumeKg, required this.exercises, required this.completedAt});
  factory _DashboardRecentSession.fromJson(Map<String, dynamic> json) => _$DashboardRecentSessionFromJson(json);

@override final  String sessionId;
@override final  String name;
@override final  int volumeKg;
@override final  int exercises;
@override final  DateTime completedAt;

/// Create a copy of DashboardRecentSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardRecentSessionCopyWith<_DashboardRecentSession> get copyWith => __$DashboardRecentSessionCopyWithImpl<_DashboardRecentSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardRecentSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardRecentSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.volumeKg, volumeKg) || other.volumeKg == volumeKg)&&(identical(other.exercises, exercises) || other.exercises == exercises)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,name,volumeKg,exercises,completedAt);

@override
String toString() {
  return 'DashboardRecentSession(sessionId: $sessionId, name: $name, volumeKg: $volumeKg, exercises: $exercises, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$DashboardRecentSessionCopyWith<$Res> implements $DashboardRecentSessionCopyWith<$Res> {
  factory _$DashboardRecentSessionCopyWith(_DashboardRecentSession value, $Res Function(_DashboardRecentSession) _then) = __$DashboardRecentSessionCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, String name, int volumeKg, int exercises, DateTime completedAt
});




}
/// @nodoc
class __$DashboardRecentSessionCopyWithImpl<$Res>
    implements _$DashboardRecentSessionCopyWith<$Res> {
  __$DashboardRecentSessionCopyWithImpl(this._self, this._then);

  final _DashboardRecentSession _self;
  final $Res Function(_DashboardRecentSession) _then;

/// Create a copy of DashboardRecentSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? name = null,Object? volumeKg = null,Object? exercises = null,Object? completedAt = null,}) {
  return _then(_DashboardRecentSession(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,volumeKg: null == volumeKg ? _self.volumeKg : volumeKg // ignore: cast_nullable_to_non_nullable
as int,exercises: null == exercises ? _self.exercises : exercises // ignore: cast_nullable_to_non_nullable
as int,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
