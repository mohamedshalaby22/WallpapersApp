import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Helpers/Services/shared_references.dart';
import '../../Views/AppWidgets/snack_bar_widget.dart';
import '../../Views/Presentation/my_app/app_layout_screen.dart';

class RegisterController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //user TextFormFields Controllers
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Sign-up user with email/password and save user information in Firestore
  Future register({required BuildContext context}) async {
    try {
      createUserEmailAndPassword();
      //  Add additional user data to Firestore
      addUserInformation();
      await SharedPreferencesStorage.setIsLoggedIn(true);
      // Return Success message
      SnackBarWidget.showSnackBarWidget(message: 'Sign Up Successfully!');
      if (context.mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AppLayoutScreen()));
      }
      return null; // Success
    } on FirebaseAuthException catch (e) {
      SnackBarWidget.showSnackBarWidget(
          message: e.message.toString(), backColor: Colors.red[200]!);
    } catch (e) {
      return 'An unknown error occurred';
    }
  }

  void createUserEmailAndPassword() async {
    await _auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  void addUserInformation() async {
    await _firestore.collection('users').add({
      'firstName': firstnameController.text,
      'lastName': lastnameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'createdAt': DateTime.now(),
    });
  }

  Future checkValidationsAndRegister({required BuildContext context}) async {
    if (formKey.currentState!.validate()) {
      await register(context: context).then((value) {
        firstnameController.clear();
        lastnameController.clear();
        emailController.clear();
        phoneController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
      });
    }
  }
}
