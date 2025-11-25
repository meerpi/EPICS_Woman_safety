import 'dart:io' show Platform;
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart' hide DateTimeRange;
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'dart:math' show min, max;
export 'package:intl/intl.dart';
export 'package:page_transition/page_transition.dart';
export 'package:go_router/go_router.dart';

const kTransitionInfoKey = '__transition_info__';

T valueOrDefault<T>(T? value, T defaultValue) => value ?? defaultValue;

bool get isAndroid => !kIsWeb && Platform.isAndroid;
bool get isiOS => !kIsWeb && Platform.isIOS;
bool get isWeb => kIsWeb;

enum ParamType {
  int,
  double,
  String,
  bool,
  DateTime,
  DateTimeRange,
  LatLng,
  Color,
  FFUploadedFile,
  JSON,
  Document,
}

dynamic deserializeParam<T>(
  String? param,
  ParamType paramType,
  bool isList, {
  StructBuilder<T>? structBuilder,
}) {
  if (param == null) {
    return null;
  }
  try {
    if (isList) {
      final paramValues = param.split(',');
      if (paramValues.isEmpty) {
        return null;
      }
      return paramValues
          .where((p) => p.isNotEmpty)
          .map((p) => deserializeParam<T>(
                p,
                paramType,
                false,
                structBuilder: structBuilder,
              ))
          .where((p) => p != null)
          .map((p) => p! as T)
          .toList();
    }

    switch (paramType) {
      case ParamType.int:
        return int.tryParse(param);
      case ParamType.double:
        return double.tryParse(param);
      case ParamType.String:
        return param;
      case ParamType.bool:
        return param == 'true';
      case ParamType.DateTime:
        return DateTime.tryParse(param);
      default:
        return null;
    }
  } catch (e) {
    debugPrint('Error deserializing parameter: $e');
    return null;
  }
}

extension FFStringExt on String {
  String maybeHandleOverflow({int? maxChars, String replacement = ''}) =>
      maxChars != null && length > maxChars
          ? replaceRange(maxChars, null, replacement)
          : this;

  String toCapitalization(TextCapitalization capitalization) {
    switch (capitalization) {
      case TextCapitalization.words:
        return split(' ')
            .map((word) => word.isEmpty
                ? ''
                : word[0].toUpperCase() + word.substring(1).toLowerCase())
            .join(' ');
      case TextCapitalization.sentences:
        return isEmpty
            ? ''
            : this[0].toUpperCase() + substring(1).toLowerCase();
      case TextCapitalization.characters:
        return toUpperCase();
      case TextCapitalization.none:
      default:
        return this;
    }
  }
}

extension FFDateTimeExt on DateTime {
  DateTimeRange get dateTimeRange => DateTimeRange(start: this, end: this);
}

extension ValidatorExt on String? Function(BuildContext, String?)? {
  String? Function(String?)? asValidator(BuildContext context) {
    if (this == null) return null;
    return (val) => this!(context, val);
  }
}

extension FFListExt<T> on Iterable<T> {
  List<T> sortedList(Comparable Function(T) keyOf, {bool descending = false}) =>
      toList()
        ..sort((a, b) => descending
            ? keyOf(b).compareTo(keyOf(a))
            : keyOf(a).compareTo(keyOf(b)));

  T? firstOrNull(bool Function(T) condition) {
    for (final element in this) {
      if (condition(element)) {
        return element;
      }
    }
    return null;
  }

  List<S> mapIndexed<S>(S Function(int, T) func) =>
      toList().asMap().entries.map((e) => func(e.key, e.value)).toList();



  List<T> addToStart(T val) => [val, ...this];

  List<T> addToEnd(T val) => [...this, val];
}

extension FFWidgetListExt on Iterable<Widget> {
  List<Widget> divide(Widget div) =>
      isEmpty ? [] : (expand((el) => [el, div]).toList()..removeLast());

  List<Widget> around(Widget w) => addToStart(w).addToEnd(w);

  List<Widget> addToStart(Widget w) => [w, ...this];

  List<Widget> addToEnd(Widget w) => [...this, w];
}

String dateTimeFormat(String format, DateTime? dateTime, {String? locale}) {
  if (dateTime == null) {
    return '';
  }
  if (format == 'relative') {
    return timeago.format(dateTime, locale: locale);
  }
  return DateFormat(format, locale).format(dateTime);
}

Future<SharedPreferences> get _prefs async =>
    await SharedPreferences.getInstance();

Future<void> setDarkModeSetting(ThemeMode themeMode) async {
  final prefs = await _prefs;
  await prefs.setInt('darkMode', themeMode.index);
}

Future<ThemeMode> getDarkModeSetting() async {
  final prefs = await _prefs;
  final darkModeIndex = prefs.getInt('darkMode');
  return darkModeIndex == null
      ? ThemeMode.system
      : ThemeMode.values[darkModeIndex];
}

void safeSetState(VoidCallback fn, {required BuildContext context}) {
  if (context.mounted) {
    // ignore: invalid_use_of_protected_member
    (context as Element).markNeedsBuild();
  }
}

typedef StructBuilder<T> = T Function(Map<String, dynamic> data);

class FFUploadedFile {
  FFUploadedFile({
    this.name,
    this.bytes,
  });

  final String? name;
  final Uint8List? bytes;
}

class DateTimeRange {
  const DateTimeRange({required this.start, required this.end});
  final DateTime start;
  final DateTime end;
}
