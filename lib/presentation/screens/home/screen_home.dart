import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../../../domine/db/db_functions.dart';
import '../../../domine/db/user/user_model.dart';
import '../../core/colors/colors.dart';
import '../../core/fonts/fonts.dart';
import '../../core/keys/messenger_key.dart';
import '../../core/keys/navigator_key.dart';
import '../form/screen_form.dart';
import '../weather/screen_weather.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        // backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text(
            'Users',
            style: GoogleFont.userHeadTextStyle,
          ),
          centerTitle: true,
          elevation: 4,
          actions: <Widget>[
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  PageTransition<ScreenHome>(
                    child: ScreenForm(),
                    childCurrent: ScreenHome(),
                    type: PageTransitionType.rightToLeftJoined,
                    reverseDuration: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
                color: kBlack,
              ),
              label: const Text(
                'Add User',
                style: TextStyle(
                  color: kButtonColor,
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ValueListenableBuilder<Box<UserModel>>(
                  valueListenable: userBox.listenable(),
                  builder: (BuildContext context, Box<UserModel> users,
                      Widget? child) {
                    return users.isNotEmpty
                        ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: users.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              final UserModel? user = users.getAt(index);
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 8, right: 8),
                                child: Slidable(
                                  key: UniqueKey(),
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    dismissible:
                                        DismissiblePane(onDismissed: () async {
                                      await deleteUser(index, context, users);
                                    }),
                                    children: <Widget>[
                                      SlidableAction(
                                        onPressed: (BuildContext ctx) async {
                                          await deleteUser(
                                              index, context, users);
                                        },
                                        backgroundColor: kRed,
                                        foregroundColor: kWhite,
                                        icon: Icons.delete,
                                        label: 'Delete',
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    color: kWhite,
                                    elevation: 4,
                                    child: userListTile(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          PageTransition<ScreenWeather>(
                                            child: ScreenWeather(
                                                isCelcious: user.isCelcious),
                                            type:
                                                PageTransitionType.leftToRight,
                                            reverseDuration: const Duration(
                                                milliseconds: 400),
                                            duration: const Duration(
                                                milliseconds: 400),
                                            curve: Curves.easeIn,
                                          ),
                                        );
                                      },
                                      user: user!,
                                      onChanged: (bool? value) {
                                        log(value.toString());

                                        users.putAt(
                                          index,
                                          user.copyWith(isCelcious: value),
                                        );
                                      },
                                      isCelcious: user.isCelcious,
                                    ),
                                  ),
                                ),
                              );
                            })
                        : Center(
                            child: Column(
                            children: <Widget>[
                              Lottie.asset(
                                  'assets/lottie_json/98119-error.json'),
                              const Text('No Users found')
                            ],
                          ));
                  }),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    final bool? shouldPop = await showDialog<bool>(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to Exit?'),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
    return shouldPop!;
  }

  Future<void> deleteUser(
      int index, BuildContext ctx, Box<UserModel> box) async {
    await box.deleteAt(index);

    snackbarKey.currentState!.showSnackBar(
      const SnackBar(
        backgroundColor: kRed,
        content: Text('User Deleted'),
      ),
    );
  }

  Padding userListTile(
      {required UserModel user,
      required Function(bool?) onChanged,
      required Function() onTap,
      required bool isCelcious}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 70,
          child: Center(
            child: ListTile(
              onTap: onTap,
              leading: const CircleAvatar(
                backgroundColor: kButtonColor,
                radius: 30,
                child: Icon(
                  Icons.person,
                  color: kWhite,
                ),
              ),
              title: Text(
                '${user.name} ${user.lastName}',
                style: GoogleFont.userNameStyle,
              ),
              subtitle: Text(
                user.email,
                style: GoogleFont.userEmailStyle,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Switch.adaptive(value: user.isCelcious, onChanged: onChanged),
                  Text(isCelcious ? '°C' : '°F'),
                ],
              ),
            ),
          )),
    );
  }
}
