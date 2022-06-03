import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahmaa/Data/famileCubit/family_cubit.dart';

class CompliteSign extends StatelessWidget {
  const CompliteSign({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FamilyCubit, FamilyState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/logo.jpeg"),
                          radius: 70,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 21,
                        ),
                        CircleAvatar(
                          child: IconButton(
                            onPressed: () {},
                            hoverColor: Colors.red,
                            icon: Icon(Icons.camera_alt_outlined),
                          ),
                          radius: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText:  "Name project" ,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText:  "name street" ,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      maxLength: 300,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText:  "Descreption" ,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Container(
                      height: 40,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.green,
                        textColor: Colors.white,
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
