import 'dart:convert';

class CC {
  int? id;
  String? number;
  double? limit;

  CC({this.id, this.number, this.limit});

  factory CC.fromMap(Map<String, dynamic> data) => CC(
        id: data['id'] as int?,
        number: data['number'] as String?,
        limit: data['limit'] as double?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'number': number,
        'limit': limit,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CC].
  factory CC.fromJson(String data) {
    return CC.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CC] to a JSON string.
  String toJson() => json.encode(toMap());
}
