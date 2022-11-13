import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../domine/db/user/user_model.dart';
import '../../core/colors/colors.dart';
import '../../core/fonts/fonts.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(color: kButtonColor),
        ),
        centerTitle: true,
        elevation: 4,
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {},
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
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                      child: Card(
                        color: kWhite,
                        elevation: 4,
                        child: Slidable(
                          key: Key(
                            'dismissable $index',
                          ),
                          child: userListTile(
                            user: UserModel(
                                name: 'hjhjhh',
                                lastName: 'njsu',
                                email: 'bhhvh'),
                          ),
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }

  Padding userListTile({required UserModel user}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 70,
          child: Center(
            child: ListTile(
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
            ),
          )),
    );
  }
}
