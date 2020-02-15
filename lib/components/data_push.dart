import 'package:firebase_database/firebase_database.dart';
import 'package:sahat_markaz/components/models/model_child_birth.dart';

void data_push_to_cloud(child_model childFormModelObject){
  //check for parents existanc//
  DatabaseReference check_parent_exixts = FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+childFormModelObject.child_father_cnic+childFormModelObject.child_mother_cnic+"/");
  check_parent_exixts.once().then((DataSnapshot snapshot) {
    if(snapshot.value==null){
      // not fount, new parent //
      DatabaseReference push_new_parents_information = FirebaseDatabase.instance.reference().child("Recorde/ChildrenData");
      push_new_parents_information.child(childFormModelObject.child_father_cnic+childFormModelObject.child_mother_cnic).set({
        'FatherName':childFormModelObject.child_father_name,
        'MotherName':childFormModelObject.child_mother_name,
        'FatherCNIC':childFormModelObject.child_father_cnic,
        'MotherCNIC':childFormModelObject.child_mother_cnic,
        'ParentsAddress':childFormModelObject.child_parents_address,
        'ParentsNumber':childFormModelObject.child_parents_phone,
      });

      DatabaseReference push_new_child_information = FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+childFormModelObject.child_father_cnic+childFormModelObject.child_mother_cnic+'/Children/');
      push_new_child_information.child(childFormModelObject.child_Sex+childFormModelObject.child_birth_date).set({
        'ChildSex':childFormModelObject.child_Sex,
        'ChildBirthDate':childFormModelObject.child_birth_date,
        'ChildBirthTime':childFormModelObject.child_birth_time,
        'ChildWeight':childFormModelObject.child_weight,
        'ChildHeight':childFormModelObject.child_height,
        'ChildBirthHospital':childFormModelObject.child_birth_hospital_name,
        'ChildBirthHospitalCity':childFormModelObject.child_birth_city,
      });
      DatabaseReference push_new_child_vaccination_information = FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+childFormModelObject.child_father_cnic+childFormModelObject.child_mother_cnic+'/Children/'+childFormModelObject.child_Sex+childFormModelObject.child_birth_date+"/");
      push_new_child_vaccination_information.child("immunisation").set({

        // after birth //
        'bcg':"false",
        'opv0':"false",
        'hapb':"false",

        // six weeks //
        'opv1':"false",
        'rota1':"false",
        'newmoko1':"false",
        'penta1':"false",

        // ten weeks//
        'opv2':"false",
        'rota2':"false",
        'newmoko2':"false",
        'penta2':"false",

        // 14 weeks //
        'opv3':"false",
        'ipv':"false",
        'newmoko3':"false",
        'penta3':"false",

        // 9 months//
        'mazlaz1':"false",
        // 15 months //
        'mazlaz2':"false",

      });

    }else{
      // found, parent exists

      // creating a new child in children section//
      DatabaseReference push_another_child_information = FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+childFormModelObject.child_father_cnic+childFormModelObject.child_mother_cnic+'/Children/');
      push_another_child_information.child(childFormModelObject.child_Sex+childFormModelObject.child_birth_date).set({
        'ChildSex':childFormModelObject.child_Sex,
        'ChildBirthDate':childFormModelObject.child_birth_date,
        'ChildBirthTime':childFormModelObject.child_birth_time,
        'ChildWeight':childFormModelObject.child_weight,
        'ChildHeight':childFormModelObject.child_height,
        'ChildBirthHospital':childFormModelObject.child_birth_hospital_name,
        'ChildBirthHospitalCity':childFormModelObject.child_birth_city,
      });
      DatabaseReference push_another_child_vaccination_information = FirebaseDatabase.instance.reference().child("Recorde/ChildrenData/"+childFormModelObject.child_father_cnic+childFormModelObject.child_mother_cnic+'/Children/'+childFormModelObject.child_Sex+childFormModelObject.child_birth_date+"/");
      push_another_child_vaccination_information.child("immunisation").set({
        // after birth //
        'bcg':"false",
        'opv0':"false",
        'hapb':"false",

        // six weeks //
        'opv1':"false",
        'rota1':"false",
        'newmoko1':"false",
        'penta1':"false",

        // ten weeks//
        'opv2':"false",
        'rota2':"false",
        'newmoko2':"false",
        'penta2':"false",

        // 14 weeks //
        'opv3':"false",
        'ipv':"false",
        'newmoko3':"false",
        'penta3':"false",

        // 9 months//
        'mazlaz1':"false",
        // 15 months //
        'mazlaz2':"false",
      });

      DatabaseReference update_parents_information = FirebaseDatabase.instance.reference().child("Recorde/ChildrenData");
      update_parents_information.child(childFormModelObject.child_father_cnic+childFormModelObject.child_mother_cnic).update({
        'ParentsAddress':childFormModelObject.child_parents_address,
        'ParentsNumber':childFormModelObject.child_parents_phone,
      });

    }
  }
  );
}