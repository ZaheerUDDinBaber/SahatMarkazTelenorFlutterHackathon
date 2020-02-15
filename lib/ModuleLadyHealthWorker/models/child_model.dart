class parents_child_list{
  String child_key;
  String child_Sex;
  String child_birth_date;
  String icon;
  parents_child_list(this.child_key, this.child_Sex, this.child_birth_date, this.icon);
}

class child_for_immunization{
  String child_Sex;
  String child_weight;
  String child_height;
  String child_birth_date;
  String child_birth_time;
  String child_birth_hospital_name;
  String child_birth_city;

  child_for_immunization(this.child_Sex, this.child_weight,
      this.child_height, this.child_birth_date, this.child_birth_time,
      this.child_birth_hospital_name, this.child_birth_city);

}

class immunization{
  // after birth//
  bool bcg;
  bool opv0;
  bool hapb;
  // six weeks //
  bool opv1;
  bool rota1;
  bool newmoko1;
  bool penta1;
  // ten weeks//
  bool opv2;
  bool rota2;
  bool newmoko2;
  bool penta2;
  // 14 weeks //
  bool opv3;
  bool ipv;
  bool newmoko3;
  bool penta3;
  // 9 months//
  bool mazlaz1;
  // 15 months //
  bool mazlaz2;

  immunization(this.bcg, this.opv0, this.hapb, this.opv1, this.rota1,
      this.newmoko1, this.penta1, this.opv2, this.rota2, this.newmoko2,
      this.penta2, this.opv3, this.ipv, this.newmoko3, this.penta3,
      this.mazlaz1, this.mazlaz2);

  void update_values (bcg_,opv0_, hapb_,
      opv1_, rota1_, newmoko1_, penta1_,
      opv2_, rota2_, newmoko2_, penta2_,
      opv3_, ipv_, newmoko3_, penta3_,
      mazlaz1_, mazlaz2_) {
    // parssing string to boolean //

    if(bcg_.toString() == 'true'){
        bcg = true;
      }
    if(opv0_.toString() == 'true'){
      opv0 = true;
    }
    if(hapb_.toString() == 'true'){
      hapb = true;
    }


    if(opv1_.toString() == 'true'){
      opv1 = true;
    }
    if(rota1_.toString() == 'true'){
      rota1 = true;
    }
    if(newmoko1_.toString() == 'true'){
      newmoko1 = true;
    }
    if(penta1_.toString() == 'true'){
      penta1 = true;
    }



    if(opv2_.toString() == 'true'){
      opv2 = true;
    }
    if(rota2_.toString() == 'true'){
      rota2 = true;
    }
    if(newmoko2_.toString() == 'true'){
      newmoko2 = true;
    }
    if(penta2_.toString() == 'true'){
      penta2 = true;
    }


    if(opv3_.toString() == 'true'){
      opv3 = true;
    }
    if(ipv_.toString() == 'true'){
      ipv = true;
    }
    if(newmoko3_.toString() == 'true'){
      newmoko3 = true;
    }
    if(penta3_.toString() == 'true'){
      penta3 = true;
    }


    if(mazlaz1_.toString() == 'true'){
      mazlaz1 = true;
    }
    if(mazlaz2_.toString() == 'true'){
      mazlaz2 = true;
    }

  }
}


//calculateAge() {
//  // y,m,d//
//  final birthDate = DateTime(2020, 1, 11);
//  DateTime currentDate = DateTime.now();
//  int age = currentDate.year - birthDate.year;
//  int month1 = currentDate.month;
//  int month2 = birthDate.month;
//
//  if (month2 > month1) {
//    age--;
//  } else if (month1 == month2) {
//    int day1 = currentDate.day;
//    int day2 = birthDate.day;
//    if (day2 > day1) {
//      age--;
//    }
//  }
//
//  print(age);
//  return age;
//}