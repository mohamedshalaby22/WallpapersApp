import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../Models/home/home_wallpapers_data.dart';

class HomeController extends ChangeNotifier {
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  List<Photo> _data = [];
  List<Photo> get data => _data;

  HomeWallpapersData homeData = HomeWallpapersData();

  //fetch home screen data
  Future getHomeWallpapers() async {
    _isLoaded = false;
    try {
      http.Response response = await http.get(
          Uri.parse('https://api.pexels.com/v1/curated?per_page=15'),
          headers: ({'Authorization': dotenv.get('API_KEY')}));
      if (response.statusCode == 200) {
        homeData = homeWallpapersDataFromJson(response.body);
        _data = homeData.photos;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    _isLoaded = true;
    notifyListeners();
  }

  final List<Photo> _favoriteList = [];

  List<Photo> get favoriteList => _favoriteList;

  final CollectionReference favoritesRef =
      FirebaseFirestore.instance.collection('favorites');

  Future<void> toggleFavorite(String id, String url) async {
    final favoriteDoc = favoritesRef.doc(id.toString());
    final docSnapshot = await favoriteDoc.get();
    if (docSnapshot.exists) {
      // If it exists, remove it (toggle off)
      await favoriteDoc.delete();
    } else {
      // If it doesn't exist, add it (toggle on)
      await favoriteDoc.set({
        'url': url,
        'user_id': FirebaseAuth.instance.currentUser!.uid,
        'id': id,
        'isFavorite': true,
      });
    }

    notifyListeners();
  }

  List<String> favoriteIds = [];
  void loadFavorites() {
    favoritesRef
        .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((querySnapshot) {
      favoriteIds = querySnapshot.docs.map((doc) => doc.id).toList();
      notifyListeners(); // Notify listeners to update UI
    });
  }

  Stream<QuerySnapshot> getFavoritesList() {
    return favoritesRef
        .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }
}
