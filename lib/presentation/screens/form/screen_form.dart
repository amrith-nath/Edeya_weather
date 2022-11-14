import 'package:flutter/material.dart';

import '../../../domine/db/db_functions.dart';
import '../../../domine/db/user/user_model.dart';
import '../../core/colors/colors.dart';
import '../../core/fonts/fonts.dart';
import '../../core/keys/messenger_key.dart';
import '../../core/size/size.dart';

class ScreenForm extends StatelessWidget {
  ScreenForm({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final FocusScopeNode currentFocus = FocusScope.of(context);
    final box = UserBox.getInstance();

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
                  'Add User',
                  style: GoogleFont.loginSubTextStyle,
                ),
                kHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    inputFieldWidget(
                      size: size,
                      controller: firstNameController,
                      label: 'First Name',
                      icon: Icons.abc,
                      isHalf: true,
                    ),
                    inputFieldWidget(
                      size: size,
                      controller: lastNameController,
                      label: 'Last Name',
                      icon: Icons.abc,
                      isHalf: true,
                    ),
                  ],
                ),
                kHeight20,
                inputFieldWidget(
                  size: size,
                  controller: emailController,
                  label: 'Email',
                  icon: Icons.email,
                ),
                kHeight20,
                kHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    elevatedButtonWidget(currentFocus, context, () async {
                      if (_formKey.currentState!.validate()) {
                        currentFocus.unfocus();
                        Navigator.of(context).pop();

                        await box.add(
                          UserModel(
                            name: firstNameController.value.text,
                            lastName: lastNameController.value.text,
                            email: emailController.value.text,
                          ),
                        );
                        snackbarKey.currentState!.showSnackBar(
                          const SnackBar(
                            backgroundColor: kButtonColor,
                            content: Text('User Added'),
                          ),
                        );
                        // ignore: use_build_context_synchronously
                      }
                    }, 'Add'),
                    elevatedButtonWidget(
                      currentFocus,
                      context,
                      () {
                        Navigator.of(context).pop();
                      },
                      'Cancel',
                      isCancel: true,
                    ),
                  ],
                ),
                kHeight20,
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox elevatedButtonWidget(FocusScopeNode currentFocus,
      BuildContext context, Function() onPressed, String label,
      {bool isCancel = false}) {
    return SizedBox(
      width: 150,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: isCancel ? kRed : kButtonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          onPressed: onPressed,
          child: Text(label)),
    );
  }

  SizedBox inputFieldWidget(
      {required Size size,
      required TextEditingController controller,
      required String label,
      required IconData icon,
      bool isHalf = false,
      bool? isPassword}) {
    return SizedBox(
      width: !isHalf ? size.width / 1.05 : size.width / 2.2,
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
