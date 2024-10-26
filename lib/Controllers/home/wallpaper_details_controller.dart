import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wallpapers_app/Views/AppWidgets/snack_bar_widget.dart';

class WallpaperDetailsController extends ChangeNotifier {
  Future<String> downloadImage(String imageUrl) async {
    // Get the directory to save the image
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.path}/downloaded_image.jpg';

    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      // Write the image to file
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      SnackBarWidget.showSnackBarWidget(
          message: 'Image Downloaded Successfully!');
      return filePath; // Return the file path for further use
    } else {
      SnackBarWidget.showSnackBarWidget(
          message: 'Failed to download image', backColor: Colors.red[200]!);
      throw Exception('Failed to download image');
    }
  }
}
