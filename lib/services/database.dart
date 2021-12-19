import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flok/model/details_film.dart';
import 'package:flok/services/auth.dart';
import 'package:flok/services/user.dart';
import 'package:provider/provider.dart';

class DatabaseService{
  final CollectionReference _filmCollection = FirebaseFirestore.instance.collection('films');
  final CollectionReference _filmDetailsCollection = FirebaseFirestore.instance.collection('filmsDetails');


  Future addFilm(DetailsFilm detailsFilm) async{
    User? user = FirebaseAuth.instance.currentUser;
    Map<String, dynamic> map = HashMap();
    map.addAll({'user': AuthUser.fromFirebase(user).id});
    map.addAll({'kinopoiskId': detailsFilm.kinopoiskId});
    map.addAll({'posterUrlPreview': detailsFilm.posterUrlPreview});

    return await _filmDetailsCollection.doc((detailsFilm.kinopoiskId).toString()).set(map);
  }
}