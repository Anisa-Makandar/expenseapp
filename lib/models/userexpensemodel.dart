import 'package:expenseapplication/database/dbhelper.dart';

class UserModel {
  int user_id;
  String uemail;
  String umobileno;
  String upassword;
  String urepassword;

  UserModel(
      {required this.user_id,
      required this.uemail,
      required this.umobileno,
      required this.upassword,
      required this.urepassword});

  // from map---> toModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      user_id: map[DBHelper.COLUMN_USER_ID],
      uemail: map[DBHelper.COLUMN_USER_EMAIL],
      umobileno: map[DBHelper.COLUMN_USER_MOBILENUMBER],
      upassword: map[DBHelper.COLUMN_USER_PASSWORD],
      urepassword: map[DBHelper.COLUMN_USER_REPASSWORD],
    );
  }

  //from Model ---> to map
  Map<String, dynamic> toMap() {
    return {
      DBHelper.COLUMN_USER_EMAIL: uemail,
      DBHelper.COLUMN_USER_MOBILENUMBER: umobileno,
      DBHelper.COLUMN_USER_PASSWORD: upassword,
      DBHelper.COLUMN_USER_REPASSWORD: urepassword,
    };
  }
}
