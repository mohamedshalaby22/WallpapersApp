import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../Models/home/home_wallpapers_data.dart';

class SearchScreenController extends ChangeNotifier {
  bool _isLoaded = true;
  bool get isLoaded => _isLoaded;

  List<Photo> _data = [];
  List<Photo> get data => _data;
  bool isActive = false;
  HomeWallpapersData homeData = HomeWallpapersData();
  TextEditingController searchController = TextEditingController();
  //fetch FilteredWallpapers
  Future getFilteredWallpapers({required String query}) async {
    _isLoaded = false;
    notifyListeners();
    try {
      http.Response response = await http.get(
          Uri.parse('https://api.pexels.com/v1/search?query=$query'),
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
}
