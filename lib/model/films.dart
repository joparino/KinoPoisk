class ModelFilm {
  late List<Films> films;

  ModelFilm({required this.films});

  ModelFilm.fromJson(Map<String, dynamic> json) {
    if (json['films'] != null) {
      films = <Films>[];
      json['films'].forEach((v) {
        films.add(Films.fromJson(v));
      });
    }
  }

  get posterUrlPreview => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (films != null) {
      data['films'] = films.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Films {
  late int filmId;
  late String nameRu;
  late String nameEn;
  late String year;
  late String filmLength;
  late List<Countries> countries;
  late List<Genres> genres;
  late String rating;
  late String posterUrlPreview;

  Films(
      {required this.filmId,
      required this.nameRu,
      required this.year,
      required this.filmLength,
      required this.countries,
      required this.genres,
      required this.rating,
      required this.posterUrlPreview});

  Films.fromJson(Map<String, dynamic> json) {
    filmId = json['filmId'];
    nameRu = json['nameRu'];
    nameEn = json['nameEn'];
    year = json['year'];
    filmLength = json['filmLength'];
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries.add(Countries.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres.add(Genres.fromJson(v));
      });
    }
    rating = json['rating'];
    posterUrlPreview = json['posterUrlPreview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['filmId'] = this.filmId;
    data['nameRu'] = this.nameRu;
    data['year'] = this.year;
    data['filmLength'] = this.filmLength;
    if (this.countries != null) {
      data['countries'] = this.countries.map((v) => v.toJson()).toList();
    }
    if (genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    data['rating'] = this.rating;
    data['posterUrlPreview'] = this.posterUrlPreview;
    return data;
  }
}

class Countries {
  late String country;

  Countries({required this.country});

  Countries.fromJson(Map<String, dynamic> json) {
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = this.country;
    return data;
  }
}

class Genres {
  late String genre;

  Genres({required this.genre});

  Genres.fromJson(Map<String, dynamic> json) {
    genre = json['genre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['genre'] = genre;
    return data;
  }
}