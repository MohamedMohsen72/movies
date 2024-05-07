class DetailsModel {
  final String ?date;
  final int ?id;
  final String ?name;
  final String ? poster_path;
  final String ?overview;

  const DetailsModel({
    this.date,
     this.id,
     this.name,
    this.poster_path,
     this.overview,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      date: json['release_date'] ??'',
      id: json['id']??0,
      name: json['title'] ??'',
      poster_path: json['poster_path'] as String,
      overview: json['overview']??'',
    );
  }
}