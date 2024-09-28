import 'dart:async';
import 'package:expenseapplication/models/expensemodel.dart';
import 'package:expenseapplication/models/userexpensemodel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static DBHelper getinstance() => DBHelper._();
  Database? mDB;

  //login pref key

  static final String LOGIN_UID = "uid";

  //table name
  static final String USER_TABLE = "users";
  static final String EXPENSE_TABLE = "expense";
  static final String CATOGORIES_TABLE = "catogories";

  // user tabe columns
  static final String COLUMN_USER_ID = "uId";
  static final String COLUMN_USER_EMAIL = "uEmail";
  static final String COLUMN_USER_MOBILENUMBER = "uMobileno";
  static final String COLUMN_USER_PASSWORD = "uPassword";
  static final String COLUMN_USER_REPASSWORD = "uRepassword";

  // expense table columns
  static final String COLUMN_EXPENSE_ID = "expId";
  static final String COLUMN_EXPENSE_AMOUNT = "amt";
  static final String COLUMN_EXPENSE_DATE = 'date';
  static final String COLUMN_EXPENSE_TYPE = "type";
  static final String COLUMN_EXPENSE_TITLE = "title";
  static final String COLUMN_EXPENSE_DESC = "desc";
  static final String COLUMN_EXPENSE_REMBALANCE = "balance";

// categoroized table columns

  static final String COLUMN_CATOGORY_ID = " cId";
  static final String COLUMN_CATOGORY_PETROL = "petrol";
  static final String COLUMN_CATOGORY_PGRENT = " pgrent";
  static final String COLUMN_CATOGORY_SHOPING = "shopping";
  static final String COLUMN_CATOGORY_FEES = "fees";
  static final String COLUMN_CATOGORY_RESTAURANT = "restaurant";
  //notes column add uid here also
  static final String TABLE_NOTE_NAME = "note";
  static final String COLUMN_NOTE_ID = "note_id";
  static final String COLUMN_NOTE_TITLE = "note_title";
  static final String COLUMN_NOTE_DESC = "note_desc";

  Future<Database> getDB() async {
    mDB ??= await openDB();
    return mDB!;
  }

  Future<Database> openDB() async {
    var appDir = await getApplicationDocumentsDirectory();
    var dbpath = join(appDir.path, "expense.db");
    return openDatabase(
      dbpath,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "create table $USER_TABLE($COLUMN_USER_ID integer primary key autoincrement,$COLUMN_USER_EMAIL text unique, $COLUMN_USER_MOBILENUMBER text , $COLUMN_USER_PASSWORD text, $COLUMN_USER_REPASSWORD text)");
        db.execute(
            "create table $EXPENSE_TABLE($COLUMN_EXPENSE_ID integer primary key autoincrement,$COLUMN_USER_ID integer, $COLUMN_EXPENSE_AMOUNT integer , $COLUMN_EXPENSE_DATE text, $COLUMN_EXPENSE_TITLE text , $COLUMN_EXPENSE_DESC text, $COLUMN_EXPENSE_REMBALANCE integer)");
        db.execute(
            "create table $CATOGORIES_TABLE($COLUMN_CATOGORY_ID integer primary key autoincrement,$COLUMN_CATOGORY_PETROL integer , $COLUMN_CATOGORY_PGRENT integer , $COLUMN_CATOGORY_SHOPING text, $COLUMN_CATOGORY_FEES integer , $COLUMN_CATOGORY_RESTAURANT text, )");
      },
    );
  }

  // Insert table
  Future<bool> addExpense(expenseModel addexpense) async {
    var uid = await getUUID();
    addexpense.userId = uid;
    var db = await getDB();
    var rowseffected = await db.insert(EXPENSE_TABLE, addexpense.toMap());
    return rowseffected > 0;
  }

  // Fetch all notes
  Future<List<expenseModel>> getExpense() async {
    var db = await getDB();
    var uid = await getUUID();
    List<expenseModel> mData = [];
    var data = await db
        .query(USER_TABLE, where: "$COLUMN_USER_ID = ?", whereArgs: ['$uid']);
    for (Map<String, dynamic> eachMap in data) {
      var expensemodel = expenseModel.fromMap(eachMap);
      mData.add(expensemodel);
    }
    return mData;
  }

  // Update note
  void updateExpense(expenseModel updatedata) async {
    var db = await getDB();
    db.update(EXPENSE_TABLE, updatedata.toMap(),
        where: "$COLUMN_EXPENSE_ID =?",
        whereArgs: [" ${updatedata.expenseId}"]);
  }
  // Queries for user
  // user signuup

  Future<bool> addNewUser(UserModel newUser) async {
    var db = await getDB();
    bool haveaccount = await checkIfEmailAlreadyExists(newUser.uemail);
    bool accCreated = false;
    if (!haveaccount) {
      var rowsEffected = await db.insert(USER_TABLE, newUser.toMap());
      accCreated = rowsEffected > 0;
    }
    return accCreated;
  }

// user check im email already existsed
  Future<bool> checkIfEmailAlreadyExists(String email) async {
    var db = await getDB();
    var mdata = await db
        .query(USER_TABLE, where: "$COLUMN_USER_EMAIL = ?", whereArgs: [email]);
    if (mdata.isNotEmpty) {
      setUUID(UserModel.fromMap(mdata[0]).user_id);
    }

    return mdata.isNotEmpty;
  }

  // login/signin user

  Future<bool> authenticateUser(String email, String repassword) async {
    var db = await getDB();
    var mdata = await db.query(USER_TABLE,
        where: "$COLUMN_USER_EMAIL=? AND $COLUMN_USER_REPASSWORD = ?",
        whereArgs: [email, repassword]);
    if (mdata.isNotEmpty) {
      setUUID(UserModel.fromMap(mdata[0]).user_id);
    }

    return mdata.isNotEmpty;
  }

  //get UUID (user unique id)
  Future<int> getUUID() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt("UID")!;
  }

  //set UUID
  void setUUID(int uid) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt("UID", uid);
  }
}
