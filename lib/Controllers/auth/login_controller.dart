import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpapers_app/Helpers/Services/shared_references.dart';
import 'package:wallpapers_app/Views/Presentation/my_app/app_layout_screen.dart';
import '../../Views/AppWidgets/snack_bar_widget.dart';

class LoginController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //user TextFormFields Controllers
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // Sign-in user with email/password
  Future login({required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await SharedPreferencesStorage.setIsLoggedIn(true);
      // Return Success message
      SnackBarWidget.showSnackBarWidget(message: 'Sign In Successfully!');
      if (context.mounted) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const AppLayoutScreen(

                    )));
      }
      return null; // Success
    } on FirebaseAuthException catch (e) {
      SnackBarWidget.showSnackBarWidget(
          message: e.message.toString(), backColor: Colors.red[200]!);
    } catch (e) {
      return 'An unknown error occurred';
    }
  }

  Future checkValidationsAndLogin({required BuildContext context}) async {
    if (formKey.currentState!.validate()) {
      await login(context: context).then((value) {
        emailController.clear();
        passwordController.clear();
      });
    }
  }
}
