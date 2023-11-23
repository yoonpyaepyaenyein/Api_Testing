class Dob {
  DateTime? date;
  int? age;

  Dob({this.date, this.age});

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
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
