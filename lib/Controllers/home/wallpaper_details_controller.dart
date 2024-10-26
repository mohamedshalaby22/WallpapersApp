import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saver_gallery/saver_gallery.dart';
import 'package:wallpapers_app/Views/AppWidgets/snack_bar_widget.dart';

class WallpaperDetailsController extends ChangeNotifier {
  bool isLoading = false;
  Future<void> saveImage(String image) async {
    try {
      isLoading = true;
      notifyListeners();
      final response = await Dio().get(
        image,
        options: Options(responseType: ResponseType.bytes),
      );
      String picturesPath = "network_image.jpg";
      final result = await SaverGallery.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        fileName: picturesPath,
        androidRelativePath: "Pictures/NetworkImages",
        skipIfExists: true,
      );
      SnackBarWidget.showSnackBarWidget(
          message: 'Image Downloaded Successfully!');
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      SnackBarWidget.showSnackBarWidget(
          message: '$e', backColor: Colors.red[200]!);
    }
  }
}
