import 'dart:convert';
import 'account.dart';
import 'card.dart';
import 'feature.dart';
import 'news.dart';

class UsersModels {
  int? id;
  String? name;
  Account? account;
  CC? card;
  List<Feature>? features;
  List<News>? news;

  UsersModels({
    this.id,
    this.name,
    this.account,
    this.card,
    this.features,
    this.news,
  });

  factory UsersModels.fromMap(Map<String, dynamic> data) => UsersModels(
        id: data['id'] as int?,
        name: data['name'] as String?,
        account: data['account'] == null
            ? null
            : Account.fromMap(data['account'] as Map<String, dynamic>),
        card: data['card'] == null
            ? null
            : CC.fromMap(data['card'] as Map<String, dynamic>),
        features: (data['features'] as List<dynamic>?)
            ?.map((e) => Feature.fromMap(e as Map<String, dynamic>))
            .toList(),
        news: (data['news'] as List<dynamic>?)
            ?.map((e) => News.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'account': account?.toMap(),
        'card': card?.toMap(),
        'features': features?.map((e) => e.toMap()).toList(),
        'news': news?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UsersModels].
  factory UsersModels.fromJson(String data) {
    return UsersModels.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UsersModels] to a JSON string.
  String toJson() => json.encode(toMap());
}
