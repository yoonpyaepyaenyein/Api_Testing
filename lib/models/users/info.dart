class Info {
  String? seed;
  int? results;
  int? page;
  String? version;

  Info({this.seed, this.results, this.page, this.version});

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        seed: json['seed'] as String?,
        results: json['results'] as int?,
        page: json['page'] as int?,
        version: json['version'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'seed': seed,
        'results': results,
        'page': page,
        'version': version,
      };
}
