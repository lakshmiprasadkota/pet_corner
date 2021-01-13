import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pet_corner/models/get_animals_model.dart';
import 'third_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetAnimals animalsList = GetAnimals();
  Datum animalsIndex = Datum();
  String compareNames = "Cats";
  String name = " ";
  dynamic res;

  get selectedIndex => null;

  void getHttp() async {
    try {
      Response response =
          await Dio().get("https://networkintern.herokuapp.com/api/animals");
      setState(() {
        animalsList = getAnimalsFromMap(jsonEncode(response.data));
        res = response;

        print(res);
      });
    } catch (e) {
      setState(() {
        print("error ---> $e");
      });
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    height: 300,
                    padding: EdgeInsets.symmetric(vertical: 23, horizontal: 23),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/home_bg.png"),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.rectangle,
                      //color: Colors.blue,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/menu.png",
                              height: 18,
                            ),
                            Image.asset(
                              "assets/images/user.png",
                              height: 26,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 31,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Container(
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
                                          fontWeight: FontWeight.w400)),
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
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              prefix: Image.asset(
                                "assets/images/search.png",
                                width: 20,
                                height: 20,
                              ),
                              hintText: " Search pet",
                              isDense: true,
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 2))),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: 250),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                      ),
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
                              padding:
                                  EdgeInsets.only(top: 25, right: 23, left: 23),
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
                                    child: animalsList.data == null
                                        ? Container()
                                        : ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            primary: false,
                                            shrinkWrap: true,
                                            itemCount: animalsList.data.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    animalsIndex =
                                                        animalsList.data[index];
                                                    compareNames = animalsList
                                                        .data[index].title;
                                                    print("$animalsIndex");
                                                  });
                                                },
                                                child: Category(
                                                  name: animalsList
                                                      .data[index].title,
                                                  compareName: compareNames,
                                                ),
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                width: 22,
                                              );
                                            }),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.white,
                                child: animalsIndex.items == null
                                    ? Container(
                                        height: 50,
                                        width: 50,
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      )
                                    : Container(
                                        padding: EdgeInsets.only(
                                            right: 23, left: 23),
                                        child: ListView.builder(
                                          itemCount: animalsIndex.items.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  name = animalsIndex
                                                      .items[index].title;
                                                });
                                              },
                                              child: CategoryList(
                                                name: animalsIndex
                                                    .items[index].title,
                                                image: animalsIndex
                                                    .items[index].image,
                                                subtitle: animalsIndex
                                                    .items[index].subTitle,
                                                gender: animalsIndex
                                                    .items[index].gender,
                                                months: animalsIndex
                                                    .items[index].months,
                                                length: animalsIndex
                                                    .items[index].length,
                                                distance: animalsIndex
                                                    .items[index].distance,
                                                animalName: name,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 23),
          decoration: BoxDecoration(
              color: Color(0xFFFFFF),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Color(0xff00000029),
                    offset: Offset(0, 3),
                    blurRadius: 6)
              ]),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                image: AssetImage("assets/images/notifications.png"),
                height: 18,
                width: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Category extends StatefulWidget {
  const Category({this.name, this.compareName});

  final String name;
  final String compareName;

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: widget.compareName == widget.name
              ? BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x4D3D015B),
                        offset: Offset(0, 6),
                        blurRadius: 10)
                  ],
                  borderRadius: BorderRadius.circular(12),
                  //color: Colors.red,
                  color: Color(0xFF3D015B),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  //color: Colors.red,
                  color: Color(0xFFF9F9F9),
                ),
          child: Center(
            child: Text(
              widget.name,
              style: TextStyle(
                  color: widget.compareName == widget.name
                      ? Color(0xFFFFFFFF)
                      : Color(0xFF5A5A5A),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList(
      {this.name,
      this.image,
      this.gender,
      this.subtitle,
      this.months,
      this.length,
      this.distance,
      this.animalName});

  final String name;
  final String image;
  final Gender gender;
  final String subtitle;
  final int months;
  final int length;
  final int distance;
  final String animalName;

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SingleAnimal(
                  animalName: widget.name,
                ),
              ),
            );
          },
          child: Container(
            height: 150,
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
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      // color: Colors.red,
                      image: DecorationImage(
                        image: NetworkImage(widget.image),
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 18,
                      left: 12,
                      bottom: 18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              color: Color(0xFF3D015B),
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                        Text(
                          widget.subtitle,
                          style: TextStyle(
                              color: Color(0xFF222222),
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                //"6 Months Old / 1 feet length",
                                "${widget.months} Months Old / ${widget.length} feet length",
                                style: TextStyle(
                                    color: Color(0xFFADADAD),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              ),
                            ),
                            Image.asset(
                              "assets/images/next.png",
                              width: 10,
                              height: 15,
                            )
                          ],
                        ),
                        Text(
                          //"Gender: Female",
                          "${widget.gender}",
                          style: TextStyle(
                              color: Color(0xFF5A5A5A),
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
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
                              "${widget.distance} Miles",
                              style: TextStyle(
                                  color: Color(0xFFADADAD),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 8),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 22,
        )
      ],
    );
  }
}
