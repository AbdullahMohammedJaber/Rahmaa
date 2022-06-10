import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahmaa/Data/user_cubit.dart';
import 'package:rahmaa/Model/FamileProductionModel/location_model.dart';
import 'package:rahmaa/Model/UserModel/location.dart';
import 'package:rahmaa/Model/UserModel/order.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Text(
                    "ما هي جامعتك ؟ ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      borderRadius: BorderRadius.circular(12),
                      icon: Icon(Icons.arrow_downward_rounded),
                      iconSize: 30,
                      isExpanded: true,
                      elevation: 10,
                      dropdownColor: Colors.green[100],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      hint: "${UserCubit.get(context).dropdownvalue}" == null
                          ? Text("Selected ..")
                          : Text("${UserCubit.get(context).dropdownvalue}"),
                      items: UserCubit.get(context).listLocation.map((e) {
                        return DropdownMenuItem(
                          value: e.name,
                          child: Text(e.name),
                          onTap: () {
                            print(e.lat);
                            print(e.long);
                            print(e.name);
                          },
                        );
                      }).toList(),
                      onChanged: (String value) {
                        UserCubit.get(context).changeValueDroubButton(value);
                        print(value);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 300,
                    child: Text(
                      "ملاحظة / سيتم الدفع عند وصول الديلفري الى موقع الجامعة وشكرا لكم ",
                      maxLines: 2,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    child: MaterialButton(
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "أطلب الأن",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
