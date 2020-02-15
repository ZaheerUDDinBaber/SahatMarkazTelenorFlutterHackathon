import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
int total_families = 0;
int total_children = 0;

double total_male = 0;
double total_female = 0;
double total_other = 0;

Map<String, double> dataMapPercentage = Map();
Map<String, double> dataMapNumbers = Map();
List<Color> colorList = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
];


Future loadReportsData() async{
  dataMapNumbers.clear();
  dataMapPercentage.clear();
  // total count for Families Registered//
  DatabaseReference db = FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/");
  var results = db.once().then((DataSnapshot snapshot){
    total_families = 0;
    Map<dynamic, dynamic> values = snapshot.value;
    int i = 1;
    total_children = 0;
    total_male = 0;
    total_female = 0;
    total_other = 0;
    values.forEach((key,values) {
     total_families = total_families+i;

     for (var entry in values["Children"].entries) {
          total_children++;
          if(entry.value["ChildSex"].toString() == "Male"){
            total_male++;
          }
          if(entry.value["ChildSex"].toString() == "Female"){
            total_female++;
          }
          if(entry.value["ChildSex"].toString() == "Other"){
            total_other++;
          }
     }
    });

    // putting values in pichart//
    dataMapPercentage.putIfAbsent("Male", () => total_male);
    dataMapPercentage.putIfAbsent("Female", () => total_female);
    dataMapPercentage.putIfAbsent("Other", () => total_other);

    dataMapNumbers.putIfAbsent("Male", () => total_male);
    dataMapNumbers.putIfAbsent("Female", () => total_female);
    dataMapNumbers.putIfAbsent("Other", () => total_other);

  });


  return results;

}


