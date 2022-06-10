import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahmaa/Data/user_cubit.dart';

class ProfileUserScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      builder: (context, state) {
        nameController.text = UserCubit.get(context).userData[0].name;
        emailController.text = UserCubit.get(context).userData[0].email;
        phoneController.text = UserCubit.get(context).userData[0].phone;
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      enabled: false,
                      label: Text("الإسم"),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(fontFamily: 'fontMy')),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      enabled: false,
                      label: Text("البريد الإلكتروني"),
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(fontFamily: 'fontMy')),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    enabled: false,
                    label: Text("رقم الهاتف"),
                    labelStyle: TextStyle(
                      fontFamily: 'fontMy',
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                Spacer(),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.blue,
                  onPressed: () {},
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 80),
                    child: Text(
                      "تسجيل الخروج",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'fontMy',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
