import 'package:flok/model/details_film.dart';
import 'package:flok/model/film.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService{
  final supabase = Supabase.instance.client;

  Future<List<Film>> _getListByField({
    required String field,
    required String value,
  }) async {
    final user = supabase.auth.currentUser;
    if (user == null) return [];

    final listRow = await supabase
        .from('user_lists')
        .select('id')
        .eq('user_id', user.id)
        .eq(field, value)
        .maybeSingle();

      if (listRow == null) return [];

      final listId = listRow['id'] as String;

      final films = await supabase
          .from('list_items')
          .select('films!inner(source, external_id, title, poster_url, year, created_at)')
          .eq('list_id', listId)
          .withConverter<List<Film>>((rows) {
            return (rows as List)
                .map((r) => r['films'] as Map<String, dynamic>)
                .map(Film.fromJson)
                .toList();
          });

      return films;
  }

  Future<List<Film>> getListByName(String name) async {
    return _getListByField(field: 'name', value: name);
  }

  Future<List<Film>> getListBySlug(String slug) async {
    return _getListByField(field: 'slug', value: slug);
  }

  Future createCustomList(String name) async{
    // TODO implent in future
    return true;
  }

  Future<String> _getOrCreateFilmId(DetailsFilm detailsFilm) async {
    final String externalId = detailsFilm.kinopoiskId.toString();

    final existingFilm = await supabase
        .from('films')
        .select('id')
        .eq('source', 'tmdb')
        .eq('external_id', externalId)
        .maybeSingle();

    if (existingFilm != null) {
      return existingFilm['id'] as String;
    }

    final String title = detailsFilm.nameRu.isNotEmpty
        ? detailsFilm.nameRu
        : detailsFilm.nameOriginal;
    final String posterUrl = detailsFilm.posterUrlPreview.isNotEmpty
        ? detailsFilm.posterUrlPreview
        : detailsFilm.posterUrl;

    final insertedFilm = await supabase
        .from('films')
        .insert({
          'source': 'tmdb',
          'external_id': externalId,
          'title': title,
          'poster_url': posterUrl,
          'year': detailsFilm.year > 0 ? detailsFilm.year : null,
        })
        .select('id')
        .single();

    return insertedFilm['id'] as String;
  }

  Future<String> _getBaseListId({
    required String userId,
    required String slug,
    required String fallbackName,
  }) async {
    final bySlug = await supabase
        .from('user_lists')
        .select('id')
        .eq('user_id', userId)
        .eq('slug', slug)
        .maybeSingle();

    if (bySlug != null) {
      return bySlug['id'] as String;
    }

    final byName = await supabase
        .from('user_lists')
        .select('id')
        .eq('user_id', userId)
        .eq('name', fallbackName)
        .maybeSingle();

    if (byName != null) {
      return byName['id'] as String;
    }

    throw StateError('Base list not found: slug=$slug, name=$fallbackName');
  }

  Future<Map<String, String>> _getBaseListIds(String userId) async {
    final String watchedId = await _getBaseListId(
      userId: userId,
      slug: 'watched',
      fallbackName: 'Просмотрено',
    );
    final String plannedId = await _getBaseListId(
      userId: userId,
      slug: 'planned',
      fallbackName: 'В планах',
    );
    final String favoriteId = await _getBaseListId(
      userId: userId,
      slug: 'favorite',
      fallbackName: 'Любимое',
    );

    return <String, String>{
      'watched': watchedId,
      'planned': plannedId,
      'favorite': favoriteId,
    };
  }

  Future<void> _removeFilmFromUserBaseLists({
    required String filmId,
    required Map<String, String> baseListIds,
  }) async {
    for (final entry in baseListIds.entries) {
      await supabase
          .from('list_items')
          .delete()
          .eq('film_id', filmId)
          .eq('list_id', entry.value);
    }
  }

  Future<void> _removeFilmFromAllUserLists({
    required String userId,
    required String filmId,
  }) async {
    final rows = await supabase
        .from('user_lists')
        .select('id')
        .eq('user_id', userId);

    final List<String> listIds = (rows as List<dynamic>)
        .map((row) => (row as Map<String, dynamic>)['id'] as String)
        .toList();

    for (final listId in listIds) {
      await supabase
          .from('list_items')
          .delete()
          .eq('film_id', filmId)
          .eq('list_id', listId);
    }
  }

  Future<void> _addFilmToBaseList(
    DetailsFilm detailsFilm, {
    required String slug,
    required String fallbackName,
  }) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw StateError('User is not authenticated');
    }

    final String filmId = await _getOrCreateFilmId(detailsFilm);
    final Map<String, String> baseListIds = await _getBaseListIds(user.id);
    final String listId = baseListIds[slug] ??
        await _getBaseListId(
          userId: user.id,
          slug: slug,
          fallbackName: fallbackName,
        );

    // Make operation idempotent and race-safe:
    // remove from all base lists first, then add only to target list.
    await _removeFilmFromUserBaseLists(
      filmId: filmId,
      baseListIds: baseListIds,
    );

    await supabase.from('list_items').upsert(
      {
        'list_id': listId,
        'film_id': filmId,
        'added_at': DateTime.now().toUtc().toIso8601String(),
      },
      onConflict: 'list_id,film_id',
    );
  }

  Future<void> addFilmToWatchedList(DetailsFilm detailsFilm) async{
    await _addFilmToBaseList(
      detailsFilm,
      slug: 'watched',
      fallbackName: 'Просмотрено',
    );
  }

  Future<void> addFilmToWantedList(DetailsFilm detailsFilm) async{
    await _addFilmToBaseList(
      detailsFilm,
      slug: 'planned',
      fallbackName: 'В планах',
    );
  }

  Future<void> addFilmToLikedList(DetailsFilm detailsFilm) async{
    await _addFilmToBaseList(
      detailsFilm,
      slug: 'favorite',
      fallbackName: 'Любимое',
    );
  }

  Future<void> deleteFilmFromList(DetailsFilm detailsFilm) async{
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw StateError('User is not authenticated');
    }

    final film = await supabase
        .from('films')
        .select('id')
        .eq('source', 'tmdb')
        .eq('external_id', detailsFilm.kinopoiskId.toString())
        .maybeSingle();

    if (film == null) {
      return;
    }

    final String filmId = film['id'] as String;

    await _removeFilmFromAllUserLists(
      userId: user.id,
      filmId: filmId,
    );
  }
}
