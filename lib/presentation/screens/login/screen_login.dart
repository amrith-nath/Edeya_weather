import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../core/colors/colors.dart';
import '../../core/fonts/fonts.dart';
import '../../core/size/size.dart';
import '../home/screen_home.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    FocusScopeNode currentFocus = FocusScope.of(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: kButtonColor,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                kHeight10,
                Text(
                  'Proceed with your',
                  style: GoogleFont.loginSubTextStyle,
                ),
                Text(
                  'Login',
                  style: GoogleFont.loginTextStyle,
                ),
                kHeight20,
                inputFieldWidget(
                  size: size,
                  controller: emailController,
                  label: 'Email',
                  icon: Icons.mail,
                ),
                kHeight20,
                inputFieldWidget(
                    size: size,
                    controller: passwordController,
                    label: 'Password',
                    icon: Icons.lock,
                    isPassword: true),
                kHeight20,
                kHeight10,
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kButtonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          currentFocus.unfocus();
                          onValiate(context);
                        }
                      },
                      child: const Text('Login')),
                ),
                kHeight20,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onValiate(BuildContext context) {
    if (emailController.value.text == 'testapp@google.com' &&
        passwordController.value.text == 'Test@123456') {
      Navigator.of(context).pushReplacement(
        PageTransition<ScreenHome>(
          child: ScreenHome(),
          childCurrent: ScreenLogin(),
          type: PageTransitionType.bottomToTopJoined,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        ),
      );
    } else {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: 'Email and Password Doesnt match',
        confirmBtnColor: kButtonColor,
      );
    }
  }

  SizedBox inputFieldWidget(
      {required Size size,
      required TextEditingController controller,
      required String label,
      required IconData icon,
      bool? isPassword}) {
    return SizedBox(
      width: size.width / 1.2,
      child: TextFormField(
        obscureText: isPassword ?? false,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a valid ${label.toLowerCase()}';
          } else if ((!controller.value.text.contains('@') ||
                  !controller.value.text.contains('.') ||
                  controller.value.text.length < 3) &&
              label == 'Email') {
            return 'Please enter a valid ${label.toLowerCase()}';
          }
          return null;
        },
        onChanged: (String value) {
          controller.text = value;
        },
        decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(color: kButtonColor),
          ),
          floatingLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          suffixIcon: Icon(
            icon,
            color: kButtonColor,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: kButtonColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kButtonColor, width: 2),
          ),
        ),
      ),
    );
  }
}
