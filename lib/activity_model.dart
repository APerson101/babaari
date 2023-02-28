import 'dart:convert';

class ActivityModel {
  String type;
  String text;
  DateTime time;
  ActivityModel({
    required this.type,
    required this.text,
    required this.time,
  });

  ActivityModel copyWith({
    String? type,
    String? text,
    DateTime? time,
  }) {
    return ActivityModel(
      type: type ?? this.type,
      text: text ?? this.text,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'text': text,
      'time': time.millisecondsSinceEpoch,
    };
  }

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      type: map['type'] ?? '',
      text: map['text'] ?? '',
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityModel.fromJson(String source) =>
      ActivityModel.fromMap(json.decode(source));

  @override
  String toString() => 'ActivityModel(type: $type, text: $text, time: $time)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ActivityModel &&
        other.type == type &&
        other.text == text &&
        other.time == time;
  }

  @override
  int get hashCode => type.hashCode ^ text.hashCode ^ time.hashCode;
}
