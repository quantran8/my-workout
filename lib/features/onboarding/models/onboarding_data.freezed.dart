// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Account {

 String get email;
/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountCopyWith<Account> get copyWith => _$AccountCopyWithImpl<Account>(this as Account, _$identity);

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Account&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'Account(email: $email)';
}


}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res>  {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) = _$AccountCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$AccountCopyWithImpl<$Res>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._self, this._then);

  final Account _self;
  final $Res Function(Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Account].
extension AccountPatterns on Account {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Account value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Account() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Account value)  $default,){
final _that = this;
switch (_that) {
case _Account():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Account value)?  $default,){
final _that = this;
switch (_that) {
case _Account() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email)  $default,) {final _that = this;
switch (_that) {
case _Account():
return $default(_that.email);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email)?  $default,) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Account implements Account {
  const _Account({this.email = ''});
  factory _Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

@override@JsonKey() final  String email;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountCopyWith<_Account> get copyWith => __$AccountCopyWithImpl<_Account>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Account&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'Account(email: $email)';
}


}

/// @nodoc
abstract mixin class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) _then) = __$AccountCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$AccountCopyWithImpl<$Res>
    implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(this._self, this._then);

  final _Account _self;
  final $Res Function(_Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_Account(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RawInput {

 String get story; String get statedGoal;
/// Create a copy of RawInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RawInputCopyWith<RawInput> get copyWith => _$RawInputCopyWithImpl<RawInput>(this as RawInput, _$identity);

  /// Serializes this RawInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RawInput&&(identical(other.story, story) || other.story == story)&&(identical(other.statedGoal, statedGoal) || other.statedGoal == statedGoal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,story,statedGoal);

@override
String toString() {
  return 'RawInput(story: $story, statedGoal: $statedGoal)';
}


}

/// @nodoc
abstract mixin class $RawInputCopyWith<$Res>  {
  factory $RawInputCopyWith(RawInput value, $Res Function(RawInput) _then) = _$RawInputCopyWithImpl;
@useResult
$Res call({
 String story, String statedGoal
});




}
/// @nodoc
class _$RawInputCopyWithImpl<$Res>
    implements $RawInputCopyWith<$Res> {
  _$RawInputCopyWithImpl(this._self, this._then);

  final RawInput _self;
  final $Res Function(RawInput) _then;

/// Create a copy of RawInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? story = null,Object? statedGoal = null,}) {
  return _then(_self.copyWith(
story: null == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as String,statedGoal: null == statedGoal ? _self.statedGoal : statedGoal // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RawInput].
extension RawInputPatterns on RawInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RawInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RawInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RawInput value)  $default,){
final _that = this;
switch (_that) {
case _RawInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RawInput value)?  $default,){
final _that = this;
switch (_that) {
case _RawInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String story,  String statedGoal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RawInput() when $default != null:
return $default(_that.story,_that.statedGoal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String story,  String statedGoal)  $default,) {final _that = this;
switch (_that) {
case _RawInput():
return $default(_that.story,_that.statedGoal);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String story,  String statedGoal)?  $default,) {final _that = this;
switch (_that) {
case _RawInput() when $default != null:
return $default(_that.story,_that.statedGoal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RawInput implements RawInput {
  const _RawInput({this.story = '', this.statedGoal = ''});
  factory _RawInput.fromJson(Map<String, dynamic> json) => _$RawInputFromJson(json);

@override@JsonKey() final  String story;
@override@JsonKey() final  String statedGoal;

/// Create a copy of RawInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RawInputCopyWith<_RawInput> get copyWith => __$RawInputCopyWithImpl<_RawInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RawInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RawInput&&(identical(other.story, story) || other.story == story)&&(identical(other.statedGoal, statedGoal) || other.statedGoal == statedGoal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,story,statedGoal);

@override
String toString() {
  return 'RawInput(story: $story, statedGoal: $statedGoal)';
}


}

/// @nodoc
abstract mixin class _$RawInputCopyWith<$Res> implements $RawInputCopyWith<$Res> {
  factory _$RawInputCopyWith(_RawInput value, $Res Function(_RawInput) _then) = __$RawInputCopyWithImpl;
@override @useResult
$Res call({
 String story, String statedGoal
});




}
/// @nodoc
class __$RawInputCopyWithImpl<$Res>
    implements _$RawInputCopyWith<$Res> {
  __$RawInputCopyWithImpl(this._self, this._then);

  final _RawInput _self;
  final $Res Function(_RawInput) _then;

/// Create a copy of RawInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? story = null,Object? statedGoal = null,}) {
  return _then(_RawInput(
story: null == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as String,statedGoal: null == statedGoal ? _self.statedGoal : statedGoal // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Injury {

 InjuryArea get area; InjurySeverity get severity; String get notes; bool get active;
/// Create a copy of Injury
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InjuryCopyWith<Injury> get copyWith => _$InjuryCopyWithImpl<Injury>(this as Injury, _$identity);

  /// Serializes this Injury to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Injury&&(identical(other.area, area) || other.area == area)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,area,severity,notes,active);

@override
String toString() {
  return 'Injury(area: $area, severity: $severity, notes: $notes, active: $active)';
}


}

/// @nodoc
abstract mixin class $InjuryCopyWith<$Res>  {
  factory $InjuryCopyWith(Injury value, $Res Function(Injury) _then) = _$InjuryCopyWithImpl;
@useResult
$Res call({
 InjuryArea area, InjurySeverity severity, String notes, bool active
});




}
/// @nodoc
class _$InjuryCopyWithImpl<$Res>
    implements $InjuryCopyWith<$Res> {
  _$InjuryCopyWithImpl(this._self, this._then);

  final Injury _self;
  final $Res Function(Injury) _then;

/// Create a copy of Injury
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? area = null,Object? severity = null,Object? notes = null,Object? active = null,}) {
  return _then(_self.copyWith(
area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as InjuryArea,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as InjurySeverity,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Injury].
extension InjuryPatterns on Injury {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Injury value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Injury() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Injury value)  $default,){
final _that = this;
switch (_that) {
case _Injury():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Injury value)?  $default,){
final _that = this;
switch (_that) {
case _Injury() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InjuryArea area,  InjurySeverity severity,  String notes,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Injury() when $default != null:
return $default(_that.area,_that.severity,_that.notes,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InjuryArea area,  InjurySeverity severity,  String notes,  bool active)  $default,) {final _that = this;
switch (_that) {
case _Injury():
return $default(_that.area,_that.severity,_that.notes,_that.active);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InjuryArea area,  InjurySeverity severity,  String notes,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _Injury() when $default != null:
return $default(_that.area,_that.severity,_that.notes,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Injury implements Injury {
  const _Injury({this.area = InjuryArea.knee, this.severity = InjurySeverity.mild, this.notes = '', this.active = true});
  factory _Injury.fromJson(Map<String, dynamic> json) => _$InjuryFromJson(json);

@override@JsonKey() final  InjuryArea area;
@override@JsonKey() final  InjurySeverity severity;
@override@JsonKey() final  String notes;
@override@JsonKey() final  bool active;

/// Create a copy of Injury
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InjuryCopyWith<_Injury> get copyWith => __$InjuryCopyWithImpl<_Injury>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InjuryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Injury&&(identical(other.area, area) || other.area == area)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,area,severity,notes,active);

@override
String toString() {
  return 'Injury(area: $area, severity: $severity, notes: $notes, active: $active)';
}


}

/// @nodoc
abstract mixin class _$InjuryCopyWith<$Res> implements $InjuryCopyWith<$Res> {
  factory _$InjuryCopyWith(_Injury value, $Res Function(_Injury) _then) = __$InjuryCopyWithImpl;
@override @useResult
$Res call({
 InjuryArea area, InjurySeverity severity, String notes, bool active
});




}
/// @nodoc
class __$InjuryCopyWithImpl<$Res>
    implements _$InjuryCopyWith<$Res> {
  __$InjuryCopyWithImpl(this._self, this._then);

  final _Injury _self;
  final $Res Function(_Injury) _then;

/// Create a copy of Injury
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? area = null,Object? severity = null,Object? notes = null,Object? active = null,}) {
  return _then(_Injury(
area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as InjuryArea,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as InjurySeverity,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Schedule {

 Set<Weekday> get preferredDays; int get minutesPerSession; String get preferredTime;
/// Create a copy of Schedule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleCopyWith<Schedule> get copyWith => _$ScheduleCopyWithImpl<Schedule>(this as Schedule, _$identity);

  /// Serializes this Schedule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Schedule&&const DeepCollectionEquality().equals(other.preferredDays, preferredDays)&&(identical(other.minutesPerSession, minutesPerSession) || other.minutesPerSession == minutesPerSession)&&(identical(other.preferredTime, preferredTime) || other.preferredTime == preferredTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(preferredDays),minutesPerSession,preferredTime);

@override
String toString() {
  return 'Schedule(preferredDays: $preferredDays, minutesPerSession: $minutesPerSession, preferredTime: $preferredTime)';
}


}

/// @nodoc
abstract mixin class $ScheduleCopyWith<$Res>  {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) _then) = _$ScheduleCopyWithImpl;
@useResult
$Res call({
 Set<Weekday> preferredDays, int minutesPerSession, String preferredTime
});




}
/// @nodoc
class _$ScheduleCopyWithImpl<$Res>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._self, this._then);

  final Schedule _self;
  final $Res Function(Schedule) _then;

/// Create a copy of Schedule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? preferredDays = null,Object? minutesPerSession = null,Object? preferredTime = null,}) {
  return _then(_self.copyWith(
preferredDays: null == preferredDays ? _self.preferredDays : preferredDays // ignore: cast_nullable_to_non_nullable
as Set<Weekday>,minutesPerSession: null == minutesPerSession ? _self.minutesPerSession : minutesPerSession // ignore: cast_nullable_to_non_nullable
as int,preferredTime: null == preferredTime ? _self.preferredTime : preferredTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Schedule].
extension SchedulePatterns on Schedule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Schedule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Schedule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Schedule value)  $default,){
final _that = this;
switch (_that) {
case _Schedule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Schedule value)?  $default,){
final _that = this;
switch (_that) {
case _Schedule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<Weekday> preferredDays,  int minutesPerSession,  String preferredTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Schedule() when $default != null:
return $default(_that.preferredDays,_that.minutesPerSession,_that.preferredTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<Weekday> preferredDays,  int minutesPerSession,  String preferredTime)  $default,) {final _that = this;
switch (_that) {
case _Schedule():
return $default(_that.preferredDays,_that.minutesPerSession,_that.preferredTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<Weekday> preferredDays,  int minutesPerSession,  String preferredTime)?  $default,) {final _that = this;
switch (_that) {
case _Schedule() when $default != null:
return $default(_that.preferredDays,_that.minutesPerSession,_that.preferredTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Schedule extends Schedule {
  const _Schedule({final  Set<Weekday> preferredDays = const {Weekday.mon, Weekday.wed, Weekday.fri}, this.minutesPerSession = 45, this.preferredTime = '18:30'}): _preferredDays = preferredDays,super._();
  factory _Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);

 final  Set<Weekday> _preferredDays;
@override@JsonKey() Set<Weekday> get preferredDays {
  if (_preferredDays is EqualUnmodifiableSetView) return _preferredDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_preferredDays);
}

@override@JsonKey() final  int minutesPerSession;
@override@JsonKey() final  String preferredTime;

/// Create a copy of Schedule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleCopyWith<_Schedule> get copyWith => __$ScheduleCopyWithImpl<_Schedule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScheduleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Schedule&&const DeepCollectionEquality().equals(other._preferredDays, _preferredDays)&&(identical(other.minutesPerSession, minutesPerSession) || other.minutesPerSession == minutesPerSession)&&(identical(other.preferredTime, preferredTime) || other.preferredTime == preferredTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_preferredDays),minutesPerSession,preferredTime);

@override
String toString() {
  return 'Schedule(preferredDays: $preferredDays, minutesPerSession: $minutesPerSession, preferredTime: $preferredTime)';
}


}

/// @nodoc
abstract mixin class _$ScheduleCopyWith<$Res> implements $ScheduleCopyWith<$Res> {
  factory _$ScheduleCopyWith(_Schedule value, $Res Function(_Schedule) _then) = __$ScheduleCopyWithImpl;
@override @useResult
$Res call({
 Set<Weekday> preferredDays, int minutesPerSession, String preferredTime
});




}
/// @nodoc
class __$ScheduleCopyWithImpl<$Res>
    implements _$ScheduleCopyWith<$Res> {
  __$ScheduleCopyWithImpl(this._self, this._then);

  final _Schedule _self;
  final $Res Function(_Schedule) _then;

/// Create a copy of Schedule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? preferredDays = null,Object? minutesPerSession = null,Object? preferredTime = null,}) {
  return _then(_Schedule(
preferredDays: null == preferredDays ? _self._preferredDays : preferredDays // ignore: cast_nullable_to_non_nullable
as Set<Weekday>,minutesPerSession: null == minutesPerSession ? _self.minutesPerSession : minutesPerSession // ignore: cast_nullable_to_non_nullable
as int,preferredTime: null == preferredTime ? _self.preferredTime : preferredTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Diet {

 DietType get type; List<String> get allergies; List<String> get restrictions;
/// Create a copy of Diet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DietCopyWith<Diet> get copyWith => _$DietCopyWithImpl<Diet>(this as Diet, _$identity);

  /// Serializes this Diet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Diet&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.allergies, allergies)&&const DeepCollectionEquality().equals(other.restrictions, restrictions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(allergies),const DeepCollectionEquality().hash(restrictions));

@override
String toString() {
  return 'Diet(type: $type, allergies: $allergies, restrictions: $restrictions)';
}


}

/// @nodoc
abstract mixin class $DietCopyWith<$Res>  {
  factory $DietCopyWith(Diet value, $Res Function(Diet) _then) = _$DietCopyWithImpl;
@useResult
$Res call({
 DietType type, List<String> allergies, List<String> restrictions
});




}
/// @nodoc
class _$DietCopyWithImpl<$Res>
    implements $DietCopyWith<$Res> {
  _$DietCopyWithImpl(this._self, this._then);

  final Diet _self;
  final $Res Function(Diet) _then;

/// Create a copy of Diet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? allergies = null,Object? restrictions = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DietType,allergies: null == allergies ? _self.allergies : allergies // ignore: cast_nullable_to_non_nullable
as List<String>,restrictions: null == restrictions ? _self.restrictions : restrictions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Diet].
extension DietPatterns on Diet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Diet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Diet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Diet value)  $default,){
final _that = this;
switch (_that) {
case _Diet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Diet value)?  $default,){
final _that = this;
switch (_that) {
case _Diet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DietType type,  List<String> allergies,  List<String> restrictions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Diet() when $default != null:
return $default(_that.type,_that.allergies,_that.restrictions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DietType type,  List<String> allergies,  List<String> restrictions)  $default,) {final _that = this;
switch (_that) {
case _Diet():
return $default(_that.type,_that.allergies,_that.restrictions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DietType type,  List<String> allergies,  List<String> restrictions)?  $default,) {final _that = this;
switch (_that) {
case _Diet() when $default != null:
return $default(_that.type,_that.allergies,_that.restrictions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Diet implements Diet {
  const _Diet({this.type = DietType.omnivore, final  List<String> allergies = const <String>[], final  List<String> restrictions = const <String>[]}): _allergies = allergies,_restrictions = restrictions;
  factory _Diet.fromJson(Map<String, dynamic> json) => _$DietFromJson(json);

@override@JsonKey() final  DietType type;
 final  List<String> _allergies;
@override@JsonKey() List<String> get allergies {
  if (_allergies is EqualUnmodifiableListView) return _allergies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allergies);
}

 final  List<String> _restrictions;
@override@JsonKey() List<String> get restrictions {
  if (_restrictions is EqualUnmodifiableListView) return _restrictions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_restrictions);
}


/// Create a copy of Diet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DietCopyWith<_Diet> get copyWith => __$DietCopyWithImpl<_Diet>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DietToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Diet&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._allergies, _allergies)&&const DeepCollectionEquality().equals(other._restrictions, _restrictions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(_allergies),const DeepCollectionEquality().hash(_restrictions));

@override
String toString() {
  return 'Diet(type: $type, allergies: $allergies, restrictions: $restrictions)';
}


}

/// @nodoc
abstract mixin class _$DietCopyWith<$Res> implements $DietCopyWith<$Res> {
  factory _$DietCopyWith(_Diet value, $Res Function(_Diet) _then) = __$DietCopyWithImpl;
@override @useResult
$Res call({
 DietType type, List<String> allergies, List<String> restrictions
});




}
/// @nodoc
class __$DietCopyWithImpl<$Res>
    implements _$DietCopyWith<$Res> {
  __$DietCopyWithImpl(this._self, this._then);

  final _Diet _self;
  final $Res Function(_Diet) _then;

/// Create a copy of Diet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? allergies = null,Object? restrictions = null,}) {
  return _then(_Diet(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DietType,allergies: null == allergies ? _self._allergies : allergies // ignore: cast_nullable_to_non_nullable
as List<String>,restrictions: null == restrictions ? _self._restrictions : restrictions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$Constraint {

 Sex get sex; int get age; double get heightCm; double get weightKg; ExperienceLevel get experienceLevel; bool get hasInjury; List<Injury> get injuries; Set<MobilityLimit> get mobilityLimits; Set<Equipment> get equipment; TrainingSpace get space; BudgetWillingness get budgetWillingness; Schedule get schedule; Diet get diet;
/// Create a copy of Constraint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConstraintCopyWith<Constraint> get copyWith => _$ConstraintCopyWithImpl<Constraint>(this as Constraint, _$identity);

  /// Serializes this Constraint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Constraint&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.age, age) || other.age == age)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&(identical(other.hasInjury, hasInjury) || other.hasInjury == hasInjury)&&const DeepCollectionEquality().equals(other.injuries, injuries)&&const DeepCollectionEquality().equals(other.mobilityLimits, mobilityLimits)&&const DeepCollectionEquality().equals(other.equipment, equipment)&&(identical(other.space, space) || other.space == space)&&(identical(other.budgetWillingness, budgetWillingness) || other.budgetWillingness == budgetWillingness)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.diet, diet) || other.diet == diet));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sex,age,heightCm,weightKg,experienceLevel,hasInjury,const DeepCollectionEquality().hash(injuries),const DeepCollectionEquality().hash(mobilityLimits),const DeepCollectionEquality().hash(equipment),space,budgetWillingness,schedule,diet);

@override
String toString() {
  return 'Constraint(sex: $sex, age: $age, heightCm: $heightCm, weightKg: $weightKg, experienceLevel: $experienceLevel, hasInjury: $hasInjury, injuries: $injuries, mobilityLimits: $mobilityLimits, equipment: $equipment, space: $space, budgetWillingness: $budgetWillingness, schedule: $schedule, diet: $diet)';
}


}

/// @nodoc
abstract mixin class $ConstraintCopyWith<$Res>  {
  factory $ConstraintCopyWith(Constraint value, $Res Function(Constraint) _then) = _$ConstraintCopyWithImpl;
@useResult
$Res call({
 Sex sex, int age, double heightCm, double weightKg, ExperienceLevel experienceLevel, bool hasInjury, List<Injury> injuries, Set<MobilityLimit> mobilityLimits, Set<Equipment> equipment, TrainingSpace space, BudgetWillingness budgetWillingness, Schedule schedule, Diet diet
});


$ScheduleCopyWith<$Res> get schedule;$DietCopyWith<$Res> get diet;

}
/// @nodoc
class _$ConstraintCopyWithImpl<$Res>
    implements $ConstraintCopyWith<$Res> {
  _$ConstraintCopyWithImpl(this._self, this._then);

  final Constraint _self;
  final $Res Function(Constraint) _then;

/// Create a copy of Constraint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sex = null,Object? age = null,Object? heightCm = null,Object? weightKg = null,Object? experienceLevel = null,Object? hasInjury = null,Object? injuries = null,Object? mobilityLimits = null,Object? equipment = null,Object? space = null,Object? budgetWillingness = null,Object? schedule = null,Object? diet = null,}) {
  return _then(_self.copyWith(
sex: null == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,experienceLevel: null == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as ExperienceLevel,hasInjury: null == hasInjury ? _self.hasInjury : hasInjury // ignore: cast_nullable_to_non_nullable
as bool,injuries: null == injuries ? _self.injuries : injuries // ignore: cast_nullable_to_non_nullable
as List<Injury>,mobilityLimits: null == mobilityLimits ? _self.mobilityLimits : mobilityLimits // ignore: cast_nullable_to_non_nullable
as Set<MobilityLimit>,equipment: null == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as Set<Equipment>,space: null == space ? _self.space : space // ignore: cast_nullable_to_non_nullable
as TrainingSpace,budgetWillingness: null == budgetWillingness ? _self.budgetWillingness : budgetWillingness // ignore: cast_nullable_to_non_nullable
as BudgetWillingness,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as Schedule,diet: null == diet ? _self.diet : diet // ignore: cast_nullable_to_non_nullable
as Diet,
  ));
}
/// Create a copy of Constraint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScheduleCopyWith<$Res> get schedule {
  
  return $ScheduleCopyWith<$Res>(_self.schedule, (value) {
    return _then(_self.copyWith(schedule: value));
  });
}/// Create a copy of Constraint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DietCopyWith<$Res> get diet {
  
  return $DietCopyWith<$Res>(_self.diet, (value) {
    return _then(_self.copyWith(diet: value));
  });
}
}


/// Adds pattern-matching-related methods to [Constraint].
extension ConstraintPatterns on Constraint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Constraint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Constraint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Constraint value)  $default,){
final _that = this;
switch (_that) {
case _Constraint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Constraint value)?  $default,){
final _that = this;
switch (_that) {
case _Constraint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Sex sex,  int age,  double heightCm,  double weightKg,  ExperienceLevel experienceLevel,  bool hasInjury,  List<Injury> injuries,  Set<MobilityLimit> mobilityLimits,  Set<Equipment> equipment,  TrainingSpace space,  BudgetWillingness budgetWillingness,  Schedule schedule,  Diet diet)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Constraint() when $default != null:
return $default(_that.sex,_that.age,_that.heightCm,_that.weightKg,_that.experienceLevel,_that.hasInjury,_that.injuries,_that.mobilityLimits,_that.equipment,_that.space,_that.budgetWillingness,_that.schedule,_that.diet);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Sex sex,  int age,  double heightCm,  double weightKg,  ExperienceLevel experienceLevel,  bool hasInjury,  List<Injury> injuries,  Set<MobilityLimit> mobilityLimits,  Set<Equipment> equipment,  TrainingSpace space,  BudgetWillingness budgetWillingness,  Schedule schedule,  Diet diet)  $default,) {final _that = this;
switch (_that) {
case _Constraint():
return $default(_that.sex,_that.age,_that.heightCm,_that.weightKg,_that.experienceLevel,_that.hasInjury,_that.injuries,_that.mobilityLimits,_that.equipment,_that.space,_that.budgetWillingness,_that.schedule,_that.diet);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Sex sex,  int age,  double heightCm,  double weightKg,  ExperienceLevel experienceLevel,  bool hasInjury,  List<Injury> injuries,  Set<MobilityLimit> mobilityLimits,  Set<Equipment> equipment,  TrainingSpace space,  BudgetWillingness budgetWillingness,  Schedule schedule,  Diet diet)?  $default,) {final _that = this;
switch (_that) {
case _Constraint() when $default != null:
return $default(_that.sex,_that.age,_that.heightCm,_that.weightKg,_that.experienceLevel,_that.hasInjury,_that.injuries,_that.mobilityLimits,_that.equipment,_that.space,_that.budgetWillingness,_that.schedule,_that.diet);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Constraint extends Constraint {
  const _Constraint({this.sex = Sex.male, this.age = 26, this.heightCm = 172, this.weightKg = 49, this.experienceLevel = ExperienceLevel.beginner, this.hasInjury = false, final  List<Injury> injuries = const <Injury>[], final  Set<MobilityLimit> mobilityLimits = const <MobilityLimit>{}, final  Set<Equipment> equipment = const <Equipment>{}, this.space = TrainingSpace.home, this.budgetWillingness = BudgetWillingness.none, this.schedule = const Schedule(), this.diet = const Diet()}): _injuries = injuries,_mobilityLimits = mobilityLimits,_equipment = equipment,super._();
  factory _Constraint.fromJson(Map<String, dynamic> json) => _$ConstraintFromJson(json);

@override@JsonKey() final  Sex sex;
@override@JsonKey() final  int age;
@override@JsonKey() final  double heightCm;
@override@JsonKey() final  double weightKg;
@override@JsonKey() final  ExperienceLevel experienceLevel;
@override@JsonKey() final  bool hasInjury;
 final  List<Injury> _injuries;
@override@JsonKey() List<Injury> get injuries {
  if (_injuries is EqualUnmodifiableListView) return _injuries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_injuries);
}

 final  Set<MobilityLimit> _mobilityLimits;
@override@JsonKey() Set<MobilityLimit> get mobilityLimits {
  if (_mobilityLimits is EqualUnmodifiableSetView) return _mobilityLimits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_mobilityLimits);
}

 final  Set<Equipment> _equipment;
@override@JsonKey() Set<Equipment> get equipment {
  if (_equipment is EqualUnmodifiableSetView) return _equipment;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_equipment);
}

@override@JsonKey() final  TrainingSpace space;
@override@JsonKey() final  BudgetWillingness budgetWillingness;
@override@JsonKey() final  Schedule schedule;
@override@JsonKey() final  Diet diet;

/// Create a copy of Constraint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConstraintCopyWith<_Constraint> get copyWith => __$ConstraintCopyWithImpl<_Constraint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConstraintToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Constraint&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.age, age) || other.age == age)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&(identical(other.hasInjury, hasInjury) || other.hasInjury == hasInjury)&&const DeepCollectionEquality().equals(other._injuries, _injuries)&&const DeepCollectionEquality().equals(other._mobilityLimits, _mobilityLimits)&&const DeepCollectionEquality().equals(other._equipment, _equipment)&&(identical(other.space, space) || other.space == space)&&(identical(other.budgetWillingness, budgetWillingness) || other.budgetWillingness == budgetWillingness)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.diet, diet) || other.diet == diet));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sex,age,heightCm,weightKg,experienceLevel,hasInjury,const DeepCollectionEquality().hash(_injuries),const DeepCollectionEquality().hash(_mobilityLimits),const DeepCollectionEquality().hash(_equipment),space,budgetWillingness,schedule,diet);

@override
String toString() {
  return 'Constraint(sex: $sex, age: $age, heightCm: $heightCm, weightKg: $weightKg, experienceLevel: $experienceLevel, hasInjury: $hasInjury, injuries: $injuries, mobilityLimits: $mobilityLimits, equipment: $equipment, space: $space, budgetWillingness: $budgetWillingness, schedule: $schedule, diet: $diet)';
}


}

/// @nodoc
abstract mixin class _$ConstraintCopyWith<$Res> implements $ConstraintCopyWith<$Res> {
  factory _$ConstraintCopyWith(_Constraint value, $Res Function(_Constraint) _then) = __$ConstraintCopyWithImpl;
@override @useResult
$Res call({
 Sex sex, int age, double heightCm, double weightKg, ExperienceLevel experienceLevel, bool hasInjury, List<Injury> injuries, Set<MobilityLimit> mobilityLimits, Set<Equipment> equipment, TrainingSpace space, BudgetWillingness budgetWillingness, Schedule schedule, Diet diet
});


@override $ScheduleCopyWith<$Res> get schedule;@override $DietCopyWith<$Res> get diet;

}
/// @nodoc
class __$ConstraintCopyWithImpl<$Res>
    implements _$ConstraintCopyWith<$Res> {
  __$ConstraintCopyWithImpl(this._self, this._then);

  final _Constraint _self;
  final $Res Function(_Constraint) _then;

/// Create a copy of Constraint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sex = null,Object? age = null,Object? heightCm = null,Object? weightKg = null,Object? experienceLevel = null,Object? hasInjury = null,Object? injuries = null,Object? mobilityLimits = null,Object? equipment = null,Object? space = null,Object? budgetWillingness = null,Object? schedule = null,Object? diet = null,}) {
  return _then(_Constraint(
sex: null == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as Sex,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,experienceLevel: null == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as ExperienceLevel,hasInjury: null == hasInjury ? _self.hasInjury : hasInjury // ignore: cast_nullable_to_non_nullable
as bool,injuries: null == injuries ? _self._injuries : injuries // ignore: cast_nullable_to_non_nullable
as List<Injury>,mobilityLimits: null == mobilityLimits ? _self._mobilityLimits : mobilityLimits // ignore: cast_nullable_to_non_nullable
as Set<MobilityLimit>,equipment: null == equipment ? _self._equipment : equipment // ignore: cast_nullable_to_non_nullable
as Set<Equipment>,space: null == space ? _self.space : space // ignore: cast_nullable_to_non_nullable
as TrainingSpace,budgetWillingness: null == budgetWillingness ? _self.budgetWillingness : budgetWillingness // ignore: cast_nullable_to_non_nullable
as BudgetWillingness,schedule: null == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as Schedule,diet: null == diet ? _self.diet : diet // ignore: cast_nullable_to_non_nullable
as Diet,
  ));
}

/// Create a copy of Constraint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScheduleCopyWith<$Res> get schedule {
  
  return $ScheduleCopyWith<$Res>(_self.schedule, (value) {
    return _then(_self.copyWith(schedule: value));
  });
}/// Create a copy of Constraint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DietCopyWith<$Res> get diet {
  
  return $DietCopyWith<$Res>(_self.diet, (value) {
    return _then(_self.copyWith(diet: value));
  });
}
}


/// @nodoc
mixin _$Target {

 List<String> get statedGoals;
/// Create a copy of Target
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TargetCopyWith<Target> get copyWith => _$TargetCopyWithImpl<Target>(this as Target, _$identity);

  /// Serializes this Target to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Target&&const DeepCollectionEquality().equals(other.statedGoals, statedGoals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(statedGoals));

@override
String toString() {
  return 'Target(statedGoals: $statedGoals)';
}


}

/// @nodoc
abstract mixin class $TargetCopyWith<$Res>  {
  factory $TargetCopyWith(Target value, $Res Function(Target) _then) = _$TargetCopyWithImpl;
@useResult
$Res call({
 List<String> statedGoals
});




}
/// @nodoc
class _$TargetCopyWithImpl<$Res>
    implements $TargetCopyWith<$Res> {
  _$TargetCopyWithImpl(this._self, this._then);

  final Target _self;
  final $Res Function(Target) _then;

/// Create a copy of Target
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statedGoals = null,}) {
  return _then(_self.copyWith(
statedGoals: null == statedGoals ? _self.statedGoals : statedGoals // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Target].
extension TargetPatterns on Target {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Target value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Target() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Target value)  $default,){
final _that = this;
switch (_that) {
case _Target():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Target value)?  $default,){
final _that = this;
switch (_that) {
case _Target() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> statedGoals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Target() when $default != null:
return $default(_that.statedGoals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> statedGoals)  $default,) {final _that = this;
switch (_that) {
case _Target():
return $default(_that.statedGoals);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> statedGoals)?  $default,) {final _that = this;
switch (_that) {
case _Target() when $default != null:
return $default(_that.statedGoals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Target implements Target {
  const _Target({final  List<String> statedGoals = const <String>[]}): _statedGoals = statedGoals;
  factory _Target.fromJson(Map<String, dynamic> json) => _$TargetFromJson(json);

 final  List<String> _statedGoals;
@override@JsonKey() List<String> get statedGoals {
  if (_statedGoals is EqualUnmodifiableListView) return _statedGoals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_statedGoals);
}


/// Create a copy of Target
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TargetCopyWith<_Target> get copyWith => __$TargetCopyWithImpl<_Target>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TargetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Target&&const DeepCollectionEquality().equals(other._statedGoals, _statedGoals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_statedGoals));

@override
String toString() {
  return 'Target(statedGoals: $statedGoals)';
}


}

/// @nodoc
abstract mixin class _$TargetCopyWith<$Res> implements $TargetCopyWith<$Res> {
  factory _$TargetCopyWith(_Target value, $Res Function(_Target) _then) = __$TargetCopyWithImpl;
@override @useResult
$Res call({
 List<String> statedGoals
});




}
/// @nodoc
class __$TargetCopyWithImpl<$Res>
    implements _$TargetCopyWith<$Res> {
  __$TargetCopyWithImpl(this._self, this._then);

  final _Target _self;
  final $Res Function(_Target) _then;

/// Create a copy of Target
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statedGoals = null,}) {
  return _then(_Target(
statedGoals: null == statedGoals ? _self._statedGoals : statedGoals // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$OnboardingData {

 Account get account; RawInput get raw; Constraint get constraint; Target get target; bool get confirmed;
/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingDataCopyWith<OnboardingData> get copyWith => _$OnboardingDataCopyWithImpl<OnboardingData>(this as OnboardingData, _$identity);

  /// Serializes this OnboardingData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingData&&(identical(other.account, account) || other.account == account)&&(identical(other.raw, raw) || other.raw == raw)&&(identical(other.constraint, constraint) || other.constraint == constraint)&&(identical(other.target, target) || other.target == target)&&(identical(other.confirmed, confirmed) || other.confirmed == confirmed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,account,raw,constraint,target,confirmed);

@override
String toString() {
  return 'OnboardingData(account: $account, raw: $raw, constraint: $constraint, target: $target, confirmed: $confirmed)';
}


}

/// @nodoc
abstract mixin class $OnboardingDataCopyWith<$Res>  {
  factory $OnboardingDataCopyWith(OnboardingData value, $Res Function(OnboardingData) _then) = _$OnboardingDataCopyWithImpl;
@useResult
$Res call({
 Account account, RawInput raw, Constraint constraint, Target target, bool confirmed
});


$AccountCopyWith<$Res> get account;$RawInputCopyWith<$Res> get raw;$ConstraintCopyWith<$Res> get constraint;$TargetCopyWith<$Res> get target;

}
/// @nodoc
class _$OnboardingDataCopyWithImpl<$Res>
    implements $OnboardingDataCopyWith<$Res> {
  _$OnboardingDataCopyWithImpl(this._self, this._then);

  final OnboardingData _self;
  final $Res Function(OnboardingData) _then;

/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? account = null,Object? raw = null,Object? constraint = null,Object? target = null,Object? confirmed = null,}) {
  return _then(_self.copyWith(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account,raw: null == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as RawInput,constraint: null == constraint ? _self.constraint : constraint // ignore: cast_nullable_to_non_nullable
as Constraint,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as Target,confirmed: null == confirmed ? _self.confirmed : confirmed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res> get account {
  
  return $AccountCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RawInputCopyWith<$Res> get raw {
  
  return $RawInputCopyWith<$Res>(_self.raw, (value) {
    return _then(_self.copyWith(raw: value));
  });
}/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConstraintCopyWith<$Res> get constraint {
  
  return $ConstraintCopyWith<$Res>(_self.constraint, (value) {
    return _then(_self.copyWith(constraint: value));
  });
}/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TargetCopyWith<$Res> get target {
  
  return $TargetCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}


/// Adds pattern-matching-related methods to [OnboardingData].
extension OnboardingDataPatterns on OnboardingData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingData value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingData value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Account account,  RawInput raw,  Constraint constraint,  Target target,  bool confirmed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingData() when $default != null:
return $default(_that.account,_that.raw,_that.constraint,_that.target,_that.confirmed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Account account,  RawInput raw,  Constraint constraint,  Target target,  bool confirmed)  $default,) {final _that = this;
switch (_that) {
case _OnboardingData():
return $default(_that.account,_that.raw,_that.constraint,_that.target,_that.confirmed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Account account,  RawInput raw,  Constraint constraint,  Target target,  bool confirmed)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingData() when $default != null:
return $default(_that.account,_that.raw,_that.constraint,_that.target,_that.confirmed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OnboardingData extends OnboardingData {
  const _OnboardingData({this.account = const Account(), this.raw = const RawInput(), this.constraint = const Constraint(), this.target = const Target(), this.confirmed = false}): super._();
  factory _OnboardingData.fromJson(Map<String, dynamic> json) => _$OnboardingDataFromJson(json);

@override@JsonKey() final  Account account;
@override@JsonKey() final  RawInput raw;
@override@JsonKey() final  Constraint constraint;
@override@JsonKey() final  Target target;
@override@JsonKey() final  bool confirmed;

/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingDataCopyWith<_OnboardingData> get copyWith => __$OnboardingDataCopyWithImpl<_OnboardingData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OnboardingDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingData&&(identical(other.account, account) || other.account == account)&&(identical(other.raw, raw) || other.raw == raw)&&(identical(other.constraint, constraint) || other.constraint == constraint)&&(identical(other.target, target) || other.target == target)&&(identical(other.confirmed, confirmed) || other.confirmed == confirmed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,account,raw,constraint,target,confirmed);

@override
String toString() {
  return 'OnboardingData(account: $account, raw: $raw, constraint: $constraint, target: $target, confirmed: $confirmed)';
}


}

/// @nodoc
abstract mixin class _$OnboardingDataCopyWith<$Res> implements $OnboardingDataCopyWith<$Res> {
  factory _$OnboardingDataCopyWith(_OnboardingData value, $Res Function(_OnboardingData) _then) = __$OnboardingDataCopyWithImpl;
@override @useResult
$Res call({
 Account account, RawInput raw, Constraint constraint, Target target, bool confirmed
});


@override $AccountCopyWith<$Res> get account;@override $RawInputCopyWith<$Res> get raw;@override $ConstraintCopyWith<$Res> get constraint;@override $TargetCopyWith<$Res> get target;

}
/// @nodoc
class __$OnboardingDataCopyWithImpl<$Res>
    implements _$OnboardingDataCopyWith<$Res> {
  __$OnboardingDataCopyWithImpl(this._self, this._then);

  final _OnboardingData _self;
  final $Res Function(_OnboardingData) _then;

/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? account = null,Object? raw = null,Object? constraint = null,Object? target = null,Object? confirmed = null,}) {
  return _then(_OnboardingData(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account,raw: null == raw ? _self.raw : raw // ignore: cast_nullable_to_non_nullable
as RawInput,constraint: null == constraint ? _self.constraint : constraint // ignore: cast_nullable_to_non_nullable
as Constraint,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as Target,confirmed: null == confirmed ? _self.confirmed : confirmed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res> get account {
  
  return $AccountCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RawInputCopyWith<$Res> get raw {
  
  return $RawInputCopyWith<$Res>(_self.raw, (value) {
    return _then(_self.copyWith(raw: value));
  });
}/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConstraintCopyWith<$Res> get constraint {
  
  return $ConstraintCopyWith<$Res>(_self.constraint, (value) {
    return _then(_self.copyWith(constraint: value));
  });
}/// Create a copy of OnboardingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TargetCopyWith<$Res> get target {
  
  return $TargetCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}

// dart format on
