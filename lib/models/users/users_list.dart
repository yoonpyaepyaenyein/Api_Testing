import 'info.dart';
import 'user.dart';

class UsersList {
  List<User>? results;
  Info? info;

  UsersList({this.results, this.info});

  factory UsersList.fromJson(Map<String, dynamic> json) => UsersList(
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList(),
        info: json['info'] == null
            ? null
            : Info.fromJson(json['info'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'results': results?.map((e) => e.toJson()).toList(),
        'info': info?.toJson(),
      };
}
