class Id {
  String? name;
  String? value;

  Id({this.name, this.value});

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        name: json['name'] as String?,
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
      };
}
