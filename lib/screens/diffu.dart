import 'dart:convert';


import 'package:dio/dio.dart';


import 'package:flutter/material.dart';
import 'package:pet_corner/models/get_animals_model.dart';


import 'third_screen.dart';



class PetCorner extends StatefulWidget {
  @override
  _PetCornerState createState() => _PetCornerState();
}

class _PetCornerState extends State<PetCorner> {

  GetAnimals listcurrent = GetAnimals();
  Datum store = Datum();
  String indx = " ";
  String name = " ";

  bool _fetching = true;
  void getHttp() async {
    setState(() {
      _fetching = true;
    });
    try {
      Response response =
      await Dio().get("https://networkintern.herokuapp.com/api/animals");
      setState(() {
        listcurrent = getAnimalsFromMap(jsonEncode(response.data));
        _fetching = false;
      });
      print(response);
    } catch (e) {
      setState(() {
        _fetching = false;
      });
      print(e);
    }
  }
  int pressedButtonNo ;
  @override
  void initState() {
    getHttp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:
          // Container(
          //     padding: EdgeInsets.only(top: 25),
          //     child:
          Stack(
            //alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 23, vertical: 29),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/home_bg.png"),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.rectangle,
                  //color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: AssetImage("assets/images/menu.png"),
                          height: 18,
                          width: 18,
                        ),
                        Image(
                          image: AssetImage("assets/images/user.png"),
                          height: 26,
                          width: 26,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Container(
                      height: 52,
                      width: 208,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Hello, ',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xFFFFFFFF),
                                )),
                            TextSpan(
                                text: ' Anastasia',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: '  Welcome to Pet Corner',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x38000000),
                              //spreadRadius: 1,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 14,
                          ),
                          Image(
                            image: AssetImage("assets/images/search.png"),
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Text(
                            "Search pet",
                            style: TextStyle(
                                color: Color(0xFFADADAD),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 25, right: 23, left: 23),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pet Category",
                              style: TextStyle(
                                  color: Color(0xFF222222),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 19,
                            ),
                            Container(
                              height: 50,
                              child: listcurrent.data == null ? Container():
                              ListView.separated(
                                scrollDirection: Axis.horizontal,
                                primary: false,
                                shrinkWrap: true,
                                itemCount: listcurrent.data.length,
                                itemBuilder: (context, index) {
                                  GetAnimals current = listcurrent;
                                  return InkWell(
                                    onTap: (){
                                      setState(() {
                                        store= listcurrent.data[index];
                                        indx = listcurrent.data[index].title;
                                        print("$store");
                                      });
                                    },
                                    child: Category(
                                      name:current.data[index].title,
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 22,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //Expanded(

                      //child:

                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child:store.items == null ?
                          Container(
                            child: CircularProgressIndicator(),
                          ):
                          Container(
                            padding: EdgeInsets.only(right: 23, left: 23),
                            child: ListView.separated(
                              itemCount:store.items.length,
                              primary: false,
                              shrinkWrap: true,
                              //itemCount: 50,
                              //itemCount: listDoctors.length,
                              itemBuilder: (context, index) {

                                GetAnimals current = listcurrent;
                                return InkWell(
                                  onTap: (){
                                    setState(() {
                                      name = store.items[index].title;
                                      print("----------------------------------------------------------------------------------------------------------");
                                      print("nameof the variavae -------------------->${name}");
                                    });
                                  },
                                  child: CategoryList(
                                    name:store.items[index].title,
                                    image: store.items[index].image,
                                    subtitle: store.items[index].subTitle,
                                    gender: store.items[index].gender,
                                    months: store.items[index].months,
                                    length: store.items[index].length,
                                    distance: store.items[index].distance,
                                    nm: name,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 22,
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 23, right: 23),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, -2),
                                blurRadius: 6,
                                color: Color(0x333D015B),
                              )
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage("assets/images/home.png"),
                              height: 18,
                              width: 18,
                            ),
                            Image(
                              image: AssetImage("assets/images/chat.png"),
                              height: 18,
                              width: 18,
                              color: Color(0xFFCCCCCC),
                            ),
                            Image(
                              image: AssetImage("assets/images/add.png"),
                              height: 30,
                              width: 30,
                            ),
                            Image(
                              image: AssetImage("assets/images/calender.png"),
                              height: 18,
                              width: 18,
                            ),
                            Image(
                              image:
                              AssetImage("assets/images/notifications.png"),
                              height: 18,
                              width: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
      //),
    );
  }
}

class Category extends StatefulWidget {
  const Category({
    this.name,
    this.indx

  }) ;
  final String name;
  final String indx;

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 50,
      width: 60,
      decoration: widget.indx == widget.name ?BoxDecoration() :BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        //color: Colors.red,
        color: Color(0xFFF9F9F9),
      ),
      child: Center(
        child: Text(
          widget.name,
          style: TextStyle(
              color: Color(0xFF5A5A5A),
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({
    this.name,
    this.image,
    this.gender,
    this.subtitle,
    this.months,
    this.length,
    this.distance,
    this.nm
  }) ;
  final String name;
  final String image;
  final Gender gender;
  final String subtitle;
  final int months;
  final int length;
  final int distance;
  final String nm ;

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SingleAnimal(animalName: widget.name,),
          ),
        );
      },
      child: Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 6,
                color: Color(0x333D015B),
              ),
            ]),
        child: Row(
          children: [
            Text("${widget.name}" , style: TextStyle(color: Colors.green , fontSize: 30 , fontWeight: FontWeight.w400),),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 23, left: 12, bottom: 18, right: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //"Lilly",
                    widget.name,
                    style: TextStyle(
                        color: Color(0xFF3D015B),
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    //"Cute Cat",
                    widget.subtitle,
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    //"6 Months Old / 1 feet length",
                    "${widget.months} Months Old / ${widget.length} feet length",
                    style: TextStyle(
                        color: Color(0xFFADADAD),
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    //"Gender: Female",
                    "${widget.gender}",
                    style: TextStyle(
                        color: Color(0xFF5A5A5A),
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Image(
                        image: AssetImage("assets/images/location.png"),
                        height: 14,
                        width: 10,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        //"10 Miles",
                        "${widget.distance} Miles",
                        style: TextStyle(
                            color: Color(0xFFADADAD),
                            fontWeight: FontWeight.bold,
                            fontSize: 8),
                      ),
                    ],
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop(
                  MaterialPageRoute(
                    builder: (context) =>SingleAnimal (),
                  ),
                );
              },
              child: Image(
                image: AssetImage("assets/images/next.png"),
                height: 16,
                width: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}