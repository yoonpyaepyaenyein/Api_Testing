class Picture {
  String? large;
  String? medium;
  String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json['large'] as String?,
        medium: json['medium'] as String?,
        thumbnail: json['thumbnail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'large': large,
        'medium': medium,
        'thumbnail': thumbnail,
      };
}
