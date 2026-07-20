// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
PlanText _$PlanTextFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'key':
          return PlanTextKey.fromJson(
            json
          );
                case 'raw':
          return PlanTextRaw.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'PlanText',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$PlanText {



  /// Serializes this PlanText to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanText);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlanText()';
}


}

/// @nodoc
class $PlanTextCopyWith<$Res>  {
$PlanTextCopyWith(PlanText _, $Res Function(PlanText) __);
}


/// Adds pattern-matching-related methods to [PlanText].
extension PlanTextPatterns on PlanText {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlanTextKey value)?  key,TResult Function( PlanTextRaw value)?  raw,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlanTextKey() when key != null:
return key(_that);case PlanTextRaw() when raw != null:
return raw(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlanTextKey value)  key,required TResult Function( PlanTextRaw value)  raw,}){
final _that = this;
switch (_that) {
case PlanTextKey():
return key(_that);case PlanTextRaw():
return raw(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlanTextKey value)?  key,TResult? Function( PlanTextRaw value)?  raw,}){
final _that = this;
switch (_that) {
case PlanTextKey() when key != null:
return key(_that);case PlanTextRaw() when raw != null:
return raw(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String key)?  key,TResult Function( String text)?  raw,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlanTextKey() when key != null:
return key(_that.key);case PlanTextRaw() when raw != null:
return raw(_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String key)  key,required TResult Function( String text)  raw,}) {final _that = this;
switch (_that) {
case PlanTextKey():
return key(_that.key);case PlanTextRaw():
return raw(_that.text);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String key)?  key,TResult? Function( String text)?  raw,}) {final _that = this;
switch (_that) {
case PlanTextKey() when key != null:
return key(_that.key);case PlanTextRaw() when raw != null:
return raw(_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class PlanTextKey implements PlanText {
  const PlanTextKey(this.key, {final  String? $type}): $type = $type ?? 'key';
  factory PlanTextKey.fromJson(Map<String, dynamic> json) => _$PlanTextKeyFromJson(json);

 final  String key;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PlanText
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanTextKeyCopyWith<PlanTextKey> get copyWith => _$PlanTextKeyCopyWithImpl<PlanTextKey>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanTextKeyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanTextKey&&(identical(other.key, key) || other.key == key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key);

@override
String toString() {
  return 'PlanText.key(key: $key)';
}


}

/// @nodoc
abstract mixin class $PlanTextKeyCopyWith<$Res> implements $PlanTextCopyWith<$Res> {
  factory $PlanTextKeyCopyWith(PlanTextKey value, $Res Function(PlanTextKey) _then) = _$PlanTextKeyCopyWithImpl;
@useResult
$Res call({
 String key
});




}
/// @nodoc
class _$PlanTextKeyCopyWithImpl<$Res>
    implements $PlanTextKeyCopyWith<$Res> {
  _$PlanTextKeyCopyWithImpl(this._self, this._then);

  final PlanTextKey _self;
  final $Res Function(PlanTextKey) _then;

/// Create a copy of PlanText
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? key = null,}) {
  return _then(PlanTextKey(
null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class PlanTextRaw implements PlanText {
  const PlanTextRaw(this.text, {final  String? $type}): $type = $type ?? 'raw';
  factory PlanTextRaw.fromJson(Map<String, dynamic> json) => _$PlanTextRawFromJson(json);

 final  String text;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of PlanText
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanTextRawCopyWith<PlanTextRaw> get copyWith => _$PlanTextRawCopyWithImpl<PlanTextRaw>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanTextRawToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanTextRaw&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'PlanText.raw(text: $text)';
}


}

/// @nodoc
abstract mixin class $PlanTextRawCopyWith<$Res> implements $PlanTextCopyWith<$Res> {
  factory $PlanTextRawCopyWith(PlanTextRaw value, $Res Function(PlanTextRaw) _then) = _$PlanTextRawCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$PlanTextRawCopyWithImpl<$Res>
    implements $PlanTextRawCopyWith<$Res> {
  _$PlanTextRawCopyWithImpl(this._self, this._then);

  final PlanTextRaw _self;
  final $Res Function(PlanTextRaw) _then;

/// Create a copy of PlanText
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(PlanTextRaw(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
