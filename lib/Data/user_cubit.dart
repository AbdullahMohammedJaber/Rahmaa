import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rahmaa/Model/FamileProductionModel/productModel.dart';
import 'package:rahmaa/Model/UserModel/location.dart';
import 'package:rahmaa/Model/UserModel/user.dart';
import 'package:rahmaa/Screens/user/UserProfile.dart';
import 'package:rahmaa/Screens/user/homeScreen.dart';
import 'package:rahmaa/Screens/user/productUserScreen.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);
  static String uIdGlobal;
  UserModel userModel;
  var dropdownvalue = "";

  // ignore: todo
  //TODO : void login user ......
  void loginUser({
    @required String email,
    @required String password,
  }) {
    emit(LoginUserStateLoaded());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uIdGlobal = value.user.uid;
      emit(LoginUserStateSuccessfully(
        uid: value.user.uid,
      ));
    }).catchError((onError) {
      emit(LoginUserStateError());
    });
  }
  // ignore: todo
  // TODO : Signup user ....

  void signUpUser({
    @required String email,
    @required String password,
    @required String phone,
    @required String name,
  }) {
    emit(SignupUserStateLoaded());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uIdGlobal = value.user.uid;
      emit(SignupUserStateSuccessfully(
        uid: value.user.uid,
      ));
      createUser(
        id: value.user.uid,
        email: email,
        name: name,
        phone: phone,
        password: password,
      );
    }).catchError((onError) {
      print(onError.toString());
      emit(SignupUserStateError());
    });
  }

  // ignore: todo
  //TODO : creat user in fireStore Firebase ...
  void createUser({
    @required String email,
    @required String password,
    @required String phone,
    @required String name,
    @required String id,
  }) {
    emit(CreateUserFireStoreUserStateLoaded());
    userModel = new UserModel(
      id: id,
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userModel.toMap())
        .then((value) {
      emit(CreateUserFireStoreUserStateSuccessfully());
    }).catchError((onError) {
      print(onError.toString());
      emit(CreateUserFireStoreUserStateError());
    });
  }

  int currentIndex = 0;
  List<Widget> screensUser = [
    HomeUser(),
    ProductUserScreen(),
    ProfileUserScreen(),
  ];
  void changeBottomBar(index) {
    currentIndex = index;
    emit(ChangedBottomBarUser());
  }

  ProductModel productModel;
  List<ProductModel> fav = [];

  void getFavorites({
    @required String uId,
    @required String pId,
    @required String nameUser,
    @required String nameRes,
    @required double lat,
    @required double long,
    @required String street,
    @required String nameProduct,
    @required String priceProduct,
    @required String desProduct,
    @required String imageProduct,
  }) {
    bool found = false;
    for (int i = 0; i < fav.length; i++) {
      if (fav[i].pId == pId) {
        found = true;

        break;
      }
    }
    if (found == true) {
      removeFav(pId);
    } else {
      productModel = ProductModel(
        uId: uId,
        pId: pId,
        nameUser: nameUser,
        nameRes: nameRes,
        lat: lat,
        long: long,
        nameProduct: nameProduct,
        priceProduct: priceProduct,
        desProduct: desProduct,
        imageProduct: imageProduct,
        street: street,
      );

      fav.add(productModel);
      emit(AddFavoraitesSucessfully());
    }
  }

  void removeFav(String index) {
    bool found = false;
    for (int i = 0; i < fav.length; i++) {
      if (fav[i].pId == index) {
        fav.remove(fav[i]);
      }
    }

    emit(RemofeFavoreitesSuccessfully());
  }

  void clearFav() {
    fav.clear();
    emit(ClrearDone());
  }

  List<ProductModel> products;
  void getAllProduct() {
    products = [];
    FirebaseFirestore.instance.collection("products").get().then((value) {
      value.docs.forEach((element) async {
        await products.add(ProductModel.fromJson(element.data()));
      });
      print("passed product .");
      print(products);
      emit(GetDataProductAllSuccessfully());
    });
  }

  List<UserModel> userData = [];
  void getDataUser({@required String id}) {
    userData = [];
    FirebaseFirestore.instance.collection("users").doc(id).get().then((value) {
      userData.add(UserModel.fromJson(value.data()));
      emit(GetDataUserSuccessfully());
      print(userData[0].email);

      print(userData[0].id);

      print(userData[0].name);
      print(userData[0].phone);
    });
  }
  //TODO : cart

  List<ProductModel> cat = [];

  void getCart({
    @required String uId,
    @required String pId,
    @required String nameUser,
    @required String nameRes,
    @required double lat,
    @required double long,
    @required String street,
    @required String nameProduct,
    @required String priceProduct,
    @required String desProduct,
    @required String imageProduct,
    @required int count,
  }) {
    bool found = false;
    for (int i = 0; i < cat.length; i++) {
      if (cat[i].pId == pId) {
        found = true;

        break;
      }
    }
    if (found == true) {
      removeCat(pId);
    } else {
      productModel = new ProductModel(
        count: count = 1,
        uId: uId,
        pId: pId,
        nameUser: nameUser,
        nameRes: nameRes,
        lat: lat,
        long: long,
        nameProduct: nameProduct,
        priceProduct: priceProduct,
        desProduct: desProduct,
        imageProduct: imageProduct,
        street: street,
      );

      cat.add(productModel);
      emit(AddCartSucessfully());
    }
  }

  void removeCat(String index) {
    bool found = false;
    for (int i = 0; i < cat.length; i++) {
      if (cat[i].pId == index) {
        cat.remove(cat[i]);
      }
    }

    emit(RemofeCartSuccessfully());
  }

  void clearCat() {
    cat.clear();
    emit(ClrearCatDone());
  }

  void containProd(String id) {
    for (int i = 0; i < cat.length; i++) {
      if (cat[i].pId == id) {
        emit(FoundCat());
        break;
      }
    }
  }

  double get total {
    var totalPrice = 0.0;
    cat.forEach((element) {
      totalPrice += double.parse(element.priceProduct) * element.count;
    });
    emit(UserCartGetTotalPrice());
    return totalPrice;
  }

  void max({String productId}) {
    for (int i = 0; i < cat.length; i++) {
      if (cat[i].pId == productId) {
        cat[i].count++;
        emit(maxCountProduct());
      }
    }
  }

  void min({String productId}) {
    for (int i = 0; i < cat.length; i++) {
      if (cat[i].pId == productId) {
        cat[i].count--;
      }
      emit(minusCountProduct());
    }
  }

  List<LocationModelUser> listLocation = [
    LocationModelUser(
        name: "جامعة حفر الباطن",
        lat: 28.24426791149962,
        long: 45.9456832094462),
    LocationModelUser(
      name: "جامعة بيشه",
      lat: 20.0280199470453,
      long: 42.6130781028979,
    ),
    LocationModelUser(
      name: "جامعة المجمعة",
      lat: 25.864700082140374,
      long: 45.41670624512778,
    ),
    LocationModelUser(
      name: "جامعة شقراء الدوادمي",
      lat: 25.190728767607933,
      long: 45.14090156097421,
    ),
    LocationModelUser(
      name: "جامعة الامير سطام بن عزيز",
      lat: 24.153492913123216,
      long: 47.271790173995306,
    ),
    LocationModelUser(
      name: "جامعة جازان",
      lat: 16.974153247766516,
      long: 42.543627160609134,
    ),
    LocationModelUser(
      name: "جامعة عبدالرحمن بن فيصل ",
      lat: 26.39301151521239,
      long: 50.19257657395317,
    ),
    LocationModelUser(
      name: "جامعة الحدود الشمالية",
      lat: 30.91616987599148,
      long: 41.07927321618355,
    ),
    LocationModelUser(
      name: "جامعة نجران",
      lat: 17.634195730087278,
      long: 44.532193016422156,
    ),
    LocationModelUser(
      name: "جامعة الجوف ",
      lat: 29.800516842031023,
      long: 40.04495348724263,
    ),
    LocationModelUser(
      name: "جامعة حابل",
      lat: 27.690317834543443,
      long: 41.71031813749048,
    ),
    LocationModelUser(
      name: "جامعة تبوك",
      lat: 28.394324459369383,
      long: 36.476762373911974,
    ),
    LocationModelUser(
      name: "جامعة الباحة",
      lat: 20.058210401512262,
      long: 41.44559330516054,
    ),
    LocationModelUser(
      name: "جامعة القصيم",
      lat: 26.349140166483334,
      long: 43.76684601813325,
    ),
    LocationModelUser(
      name: "جامعة الملك خالد",
      lat: 18.24852950224529,
      long: 42.5602143794769,
    ),
    LocationModelUser(
      name: "جامعة عبدالعزيز رابغ",
      lat: 22.789097193825366,
      long: 38.960259419272134,
    ),
    LocationModelUser(
      name: "جامعة عبدالعزيز جدة",
      lat: 21.496364369302345,
      long: 39.2393608548655,
    ),
    LocationModelUser(
      name: "جامعة الامام محمد بن سعود الاسلامية",
      lat: 24.813878262535244,
      long: 46.70154198425155,
    ),
    LocationModelUser(
      name: "جامعة الاسلامية ",
      lat: 24.480761465515258,
      long: 39.56539641651013,
    ),
    LocationModelUser(
      name: "جامعة طيبة",
      lat: 24.487191280346597,
      long: 39.542158342686456,
    ),
    LocationModelUser(
      name: "جامعة ام القرى مكة المكرمة",
      lat: 21.320539638767976,
      long: 39.93955334900247,
    ),
    LocationModelUser(
      name: "جامعة الملك سعود",
      lat: 24.72331951834788,
      long: 46.62477241070034,
    ),
    LocationModelUser(
      name: "جامعة نوره الرياض",
      lat: 24.84223575018068,
      long: 46.72480393165457,
    ),
  ];
  void changeValueDroubButton(dynamic value) {
    dropdownvalue = value;
    emit(TeacherChangeDrobButtonSuccessfullu());
  }
}
