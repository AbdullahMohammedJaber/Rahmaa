import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahmaa/Data/famileCubit/family_cubit.dart';

class HomeFamily extends StatelessWidget {
   final List<String> imgList = [
     'https://img.freepik.com/free-photo/portrait-smiling-young-woman-welcoming-customers-buy-sandwich-street-food-cart_274689-29210.jpg?w=740'
    , 'https://img.freepik.com/free-photo/table-with-inscription-salle-green-background_118454-23646.jpg?w=740',
      'https://img.freepik.com/free-photo/indian-happy-woman-salling-spices-bazaar-goa_175356-9251.jpg?w=740',
   ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FamilyCubit,FamilyState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        var productmy = FamilyCubit.get(context).productMy;
    return  Scaffold(
        backgroundColor: Colors.white,
        body:productmy.length==null ? Center(child: CircularProgressIndicator()):Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                 ),
                  child: CarouselSlider(

                    options: CarouselOptions(
                      autoPlay: true,
                      disableCenter: true,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      pageSnapping: true,
                      autoPlayInterval: Duration(seconds: 2),
                      autoPlayAnimationDuration: Duration(seconds: 2),
                      autoPlayCurve: Curves.easeInOut,
                    ),
                    items: imgList
                        .map((item) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:ClipRRect(child: Image.network(item),borderRadius: BorderRadius.circular(20) ,),

                    ))
                        .toList(),
                  )),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),

              Row(
                children: [
                  Text("My Product :",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 350,
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),

                    itemBuilder: (context,index){
                      return Card(
                        color: Colors.white,
                        elevation:  5,
                        clipBehavior: Clip.antiAliasWithSaveLayer,

                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                               child: ClipRRect( borderRadius: BorderRadius.circular(20) ,child: Image.network("${productmy[index].imageProduct}",fit: BoxFit.cover,)),
                              height: 200,
                             ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text("Name :    ${productmy[index].nameProduct}",style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text("Resturant :    ${productmy[index].nameRes}",style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text("Total :    ${productmy[index].priceProduct+" \$"}",style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),),
                            ),
                          ],
                        ),
                      );
                    }
                    , separatorBuilder: (context,index){
                    return SizedBox(width: 5);
                  }
                    ,
                    itemCount: productmy.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      );}
    );
  }
}
