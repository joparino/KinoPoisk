
class Film {
    static const String _tmdbImageBase = 'https://image.tmdb.org/t/p/w500';
    final String source;
    final int externalId;
    final String? title;
    final String? posterUrl;
    final int? year;
    final int createdAt;

    const Film({
        required this.source,
        required this.externalId,
        required this.title,
        required this.posterUrl,
        required this.year,
        required this.createdAt,
    });

    static int? _toInt(dynamic value) {
        if (value is int) return value;
        if (value is num) return value.toInt();
        if (value is String) return int.tryParse(value);
        return null;
    }

    factory Film.fromJson(Map<String, dynamic> json) {
        final bool isDbFormat = json.containsKey('external_id');
        final bool isTmdbFormat = json.containsKey('id');

        if (!isDbFormat && !isTmdbFormat) {
            throw const FormatException('Unsupported film payload: expected TMDB or DB format');
        }

        final int? externalId = isDbFormat
            ? _toInt(json['external_id'])
            : _toInt(json['id']);

        if (externalId == null) {
            throw const FormatException('Film id is missing or invalid');
        }

        final dynamic releaseDate = json['release_date'];
        final int? parsedYearFromReleaseDate = releaseDate is String && releaseDate.length >= 4
            ? int.tryParse(releaseDate.substring(0, 4))
            : null;

        final dynamic createdAtRaw = json['created_at'];
        final int createdAt = createdAtRaw is int
            ? createdAtRaw
            : createdAtRaw is String
                ? (DateTime.tryParse(createdAtRaw)?.millisecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch)
                : DateTime.now().millisecondsSinceEpoch;

        final String? posterPath = json['poster_path'] as String?;
        final String? posterUrl = (json['poster_url'] as String?) ??
            (posterPath == null ? null : '$_tmdbImageBase$posterPath');

        return Film(
            source: (json['source'] as String?) ?? 'tmdb',
            externalId: externalId,
            title: (json['title'] ?? json['name']) as String?,
            posterUrl: posterUrl,
            year: _toInt(json['year']) ?? parsedYearFromReleaseDate,
            createdAt: createdAt,
        );
    }

    Map<String, dynamic> toDbJson() {
        return {
            'source': source,
            'external_id': externalId.toString(),
            'title': title,
            'poster_url': posterUrl,
            'year': year,
        };
    }

}


class FilmSearched {
    FilmSearched({
        required this.keyword,
        required this.films,
    });

    String? keyword;
    List<Film> films;

    factory FilmSearched.fromJson(Map<String, dynamic> json) => FilmSearched(
        keyword: json["keyword"] ?? '',
        films: List<Film>.from(json["films"].map((x) => Film.fromJson(x))),
    );
}
