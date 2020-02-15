import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:sahat_markaz/ModuleLadyHealthWorker/models/parent_model.dart';
import 'package:sahat_markaz/ModuleLadyHealthWorker/models/child_model.dart';

bool found;
Map map_data;
parent parentData =null;

Map children_map;
bool child_found;
List<parents_child_list> child_list = [];

Map singleChildDetails_map;
bool single_child_found;
immunization vaccination_chart=null;
child_for_immunization chaild_details=null;

Future searchParentsofChildrenForImmunization(String SearchParameterFatherMother_CNIC) async{
  if (SearchParameterFatherMother_CNIC.length ==0){
      // if no parameeters//
    SearchParameterFatherMother_CNIC = "NoUser";
  }
  DatabaseReference search_query=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+SearchParameterFatherMother_CNIC+"/");
  var results = search_query.once().then((DataSnapshot snapshot) {
    if(snapshot.value==null){
      // not fount //
      found = false;
    }else{// found
      found=true;
      map_data = snapshot.value;
      parentData = parent(map_data['FatherName'].toString(), map_data['FatherCNIC'].toString(),map_data['MotherName'].toString(),map_data['MotherCNIC'].toString(), map_data['ParentsAddress'].toString(),map_data['ParentsNumber'].toString(),);

    }
  }
  ).catchError((error) {
    found = false;
    return error;
  });
  return results;
}


Future searchChildForImmunization(String SearchParameterFatherMother_CNIC_ForChildrenImmunization) async{
  DatabaseReference search_query=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+SearchParameterFatherMother_CNIC_ForChildrenImmunization+"/Children/");
  var results = search_query.once().then((DataSnapshot snapshot) {
    if(snapshot.value==null){
      // not fount //
      child_found = false;
    }else{// found
      child_found=true;
      child_list.clear();
      children_map = snapshot.value;
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        String icon = "";
        if(values['ChildSex'].toString()=="Male"){
          icon = "assets/icons/male_sex.png";
        }else if(values['ChildSex'].toString()=="Other"){
          icon = "assets/icons/other_sex.png";
        }else if(values['ChildSex'].toString()=="Female"){
          icon = "assets/icons/female_sex.png";
        }
        parents_child_list newchild = new parents_child_list(key.toString(),values['ChildSex'].toString(),values['ChildBirthDate'].toString(), icon);
        child_list.add(newchild);
      });

      }
  }
  ).catchError((error) {
    child_found = false;
    return error;
  });
  return results;
}



Future searchDetailsSingleChildForImmunization(String SearchParameterFatherMother_CNIC_ForChildrenImmunization, String child_key) async{

  DatabaseReference search_query=FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+SearchParameterFatherMother_CNIC_ForChildrenImmunization+"/Children/$child_key/");
  var results = search_query.once().then((DataSnapshot snapshot) {


    if(snapshot.value==null){
      // not fount //
      single_child_found = false;
    }else{// found
      single_child_found=true;
      singleChildDetails_map = snapshot.value;
      chaild_details = new child_for_immunization(singleChildDetails_map['ChildSex'],singleChildDetails_map['ChildWeight'],singleChildDetails_map['ChildHeight'],singleChildDetails_map['ChildBirthDate'],singleChildDetails_map['ChildBirthTime'],singleChildDetails_map['ChildBirthHospital'],singleChildDetails_map['ChildBirthHospitalCity']);
      //calculateAge();
      // loading chart values of vaccinations
    vaccination_chart = new immunization(false, false, false, false, false, false, false, false, false, false, false,false, false, false, false, false, false);
    vaccination_chart.update_values(singleChildDetails_map['immunisation']['bcg'],singleChildDetails_map['immunisation']['opv0'],singleChildDetails_map['immunisation']['hapb'],
        singleChildDetails_map['immunisation']['opv1'],singleChildDetails_map['immunisation']['rota1'],singleChildDetails_map['immunisation']['newmoko1'],singleChildDetails_map['immunisation']['penta1'],
        singleChildDetails_map['immunisation']['opv2'],singleChildDetails_map['immunisation']['rota2'],singleChildDetails_map['immunisation']['newmoko2'],singleChildDetails_map['immunisation']['penta2'],
        singleChildDetails_map['immunisation']['opv3'],singleChildDetails_map['immunisation']['ipv'],singleChildDetails_map['immunisation']['newmoko3'],singleChildDetails_map['immunisation']['penta3'],
        singleChildDetails_map['immunisation']['mazlaz1'],singleChildDetails_map['immunisation']['mazlaz2']
    );
    }
  }
  ).catchError((error) {
    single_child_found = false;
    return error;
  });
  return results;
}