class Registered {
  DateTime? date;
  int? age;

  Registered({this.date, this.age});

  factory Registered.fromJson(Map<String, dynamic> json) => Registered(
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        age: json['age'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'date': date?.toIso8601String(),
        'age': age,
      };
}
