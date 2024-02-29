import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flok/components/grid_view.dart';
import 'package:flok/services/user.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPage();
}

class _UserPage extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    final uid = AuthUser.fromFirebase(user).id;
    final Stream<QuerySnapshot> isWatched = FirebaseFirestore.instance
        .collection(uid.toString())
        .where('isWatched', isEqualTo: true)
        .snapshots();
    final Stream<QuerySnapshot> isWanted = FirebaseFirestore.instance
        .collection(uid.toString())
        .where('isWanted', isEqualTo: true)
        .snapshots();
    final Stream<QuerySnapshot> isLiked = FirebaseFirestore.instance
        .collection(uid.toString())
        .where('isLiked', isEqualTo: true)
        .snapshots();
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          Container(
            constraints: const BoxConstraints.expand(height: 40),
            child: const TabBar(tabs: [
              Tab(text: "Просмотрено"),
              Tab(text: "Желаемое"),
              Tab(text: "Любимое"),
            ]),
          ),
          Expanded(
            child: TabBarView(children: [
              Container(
                margin: const EdgeInsets.only(top: 10, right: 8, left: 8),
                child: Column(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: isWatched,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Text('Loading');
                          }
                          if (snapshot.data!.docs.isEmpty == true) {
                            return Container(
                                padding: const EdgeInsets.only(top: 250),
                                width: 200,
                                child: const AutoSizeText(
                                  "Упс! Кажется тут ничего нет \n\t добавьте фильм в список!",
                                  style: TextStyle(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ));
                          }

                          return Expanded(
                            child: SizedBox(
                              height: 200.0,
                              child: GridView(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 250,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2,
                                ),
                                children: snapshot.data!.docs
                                    .map<Widget>((DocumentSnapshot document) {
                                  Map<String, dynamic> data =
                                      document.data() as Map<String, dynamic>;
                                  return GridWidget(
                                      image: data['posterUrlPreview'],
                                      film: data['kinopoiskId']);
                                }).toList(),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, right: 8, left: 8),
                child: Column(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: isWanted,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Text('Loading');
                          }
                          if (snapshot.data!.docs.isEmpty == true) {
                            return Container(
                                padding: const EdgeInsets.only(top: 250),
                                width: 200,
                                child: const AutoSizeText(
                                  "Упс! Кажется тут ничего нет \n\t добавьте фильм в список!",
                                  style: TextStyle(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ));
                          }

                          return Expanded(
                            child: SizedBox(
                              height: 200.0,
                              child: GridView(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 250,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2,
                                ),
                                children: snapshot.data!.docs
                                    .map<Widget>((DocumentSnapshot document) {
                                  Map<String, dynamic> data =
                                      document.data() as Map<String, dynamic>;
                                  return GridWidget(
                                      image: data['posterUrlPreview'],
                                      film: data['kinopoiskId']);
                                }).toList(),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, right: 8, left: 8),
                child: Column(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: isLiked,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Text('Loading');
                          }
                          if (snapshot.data!.docs.isEmpty == true) {
                            return Container(
                                padding: const EdgeInsets.only(top: 250),
                                width: 200,
                                child: const AutoSizeText(
                                  "Упс! Кажется тут ничего нет \n\t добавьте фильм в список!",
                                  style: TextStyle(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ));
                          }

                          return Expanded(
                            child: SizedBox(
                              height: 200.0,
                              child: GridView(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 250,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2,
                                ),
                                children: snapshot.data!.docs
                                    .map<Widget>((DocumentSnapshot document) {
                                  Map<String, dynamic> data =
                                      document.data() as Map<String, dynamic>;
                                  return GridWidget(
                                      image: data['posterUrlPreview'],
                                      film: data['kinopoiskId']);
                                }).toList(),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
