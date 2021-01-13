import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pet_corner/models/get_singel_animal_model.dart';

class SingleAnimal extends StatefulWidget {
  SingleAnimal({this.animalName});

  final String animalName;

  @override
  _SingleAnimalState createState() => _SingleAnimalState();
}

class _SingleAnimalState extends State<SingleAnimal> {
  GetSingleAnimals singleAnimalObject = GetSingleAnimals();
  bool fetching = true;

  void getHttp() async {
    setState(() {
      fetching = true;
    });
    try {
      Response response = await Dio().get(
          "https://networkintern.herokuapp.com/api/animal?name=${widget.animalName}");
      setState(() {
        singleAnimalObject = getSingleAnimalsFromMap(jsonEncode(response.data));
        fetching = false;
        print(response);
      });
    } catch (e) {
      setState(() {
        fetching = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (fetching) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (singleAnimalObject.length == 0) {
      return Center(
        child: Text("No Data"),
      );
    }
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 23, vertical: 29),
            height: 330,
            width: double.infinity,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                //color: Colors.red,
                image: DecorationImage(
                  image: NetworkImage("${singleAnimalObject.image}"),
                  fit: BoxFit.fill,
                )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image(
                        image: AssetImage("assets/images/back.png"),
                        height: 20,
                        width: 20,
                      ),
                    ),
                    Image(
                      image: AssetImage("assets/images/user.png"),
                      height: 26,
                      width: 26,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${singleAnimalObject.title}",
                      style: TextStyle(
                          color: Color(0xFF3D015B),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Image(
                          image: AssetImage("assets/images/location.png"),
                          height: 22,
                          width: 15,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          //"18 Miles",
                          "${singleAnimalObject.distance} Miles",
                          style: TextStyle(
                              color: Color(0xFFADADAD),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "${singleAnimalObject.subTitle}",
                  style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Gender:  ${singleAnimalObject.gender}",
                  style: TextStyle(
                      color: Color(0xFF5A5A5A),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFCCCCCC), width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            //"Length: 1 feet",
                            " Age : ${singleAnimalObject.months} Months",
                            style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFCCCCCC), width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            //"Length: 1 feet",
                            " Length: ${singleAnimalObject.length} feet",
                            style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFCCCCCC), width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            //"Length: 1 feet",
                            " Color : ${singleAnimalObject.color} ",
                            style: TextStyle(
                                color: Color(0xFF222222),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 19,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  "${singleAnimalObject.description}",
                  style: TextStyle(
                      color: Color(0xFF5A5A5A),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF3D015B),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 6),
                    blurRadius: 12,
                    color: Color(0x4D3D015B),
                  )
                ]),
            child: Center(
              child: Text(
                "ADOPT",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
