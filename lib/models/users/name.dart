class Name {
  String? title;
  String? first;
  String? last;

  Name({this.title, this.first, this.last});

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json['title'] as String?,
        first: json['first'] as String?,
        last: json['last'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'first': first,
        'last': last,
      };
}
