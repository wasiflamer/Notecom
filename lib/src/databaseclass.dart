

/* ----------------  imports for sqflite    -------------------- */

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


/* ----------------  Object Model  ---------------------- */


class note {
  
  final int? id;
  final String title;
  final String content;
  final int color_id;

  const note({

    this.id,
    required this.title,
    required this.content,
    required this.color_id,

  });

  factory note.fromMap(Map<String, dynamic> json) => note(
    
    id       : json['id'],
    title    : json['title'],
    content  : json['content'],
    color_id : json['color_id'],

  );

 
  Map<String, dynamic> toMap() {
    return { 
      
      'id'       : id,
      'title'    : title,
      'content'  : content,
      'color_id' : color_id,
    };
  }

}

/* -------------- DatabaseHelper ------------------ */


class DatabaseHelper {

  // use _privateConstructor method on our class 
  DatabaseHelper._privateConstructor();

  // making an instance 
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // checking if the dataabse already exists 
  static Database? _database4 ; 
  Future<Database> get database async =>  _database4 ??= await _initDatabase();


  // if dataabse dont exists then create a new one 
  Future<Database> _initDatabase() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path , 'notes.db');
  return await openDatabase(
    path,
    version: 1,
    onCreate: _onCreate,
  );
  }

  // create a table with the following fields 
  Future _onCreate(Database db, int version ) async {
    await db.execute('''
    CREATE TABLE notes (
      id INTEGER PRIMARY KEY NOT NULL,
      title TEXT,
      content TEXT,
      color_id INTEGER
      )'''
    );
  }





   // function to add notes to the database 
   Future<int> addnote(note notey) async {
   Database db = await instance.database;
   return await db.insert('notes', notey.toMap());
  }

   // fetch notes 
   Future<List<Map>> fetchnote() async {
   Database db = await instance.database;
   return await db.rawQuery('SELECT * FROM notes;');
  }

   // delete notes 
   Future<List<Map>> deletenote(int id) async {
   Database db = await instance.database;
   return await db.rawQuery('Delete FROM notes WHERE id = ? ;' , [id]);
  }

   
   // update notes 
   Future<int> updatenotes(note notey) async {
   Database db = await instance.database;
   return await db.update('notes', notey.toMap() , where: 'id = ?' , whereArgs: [notey.id]);
  }

  
   // clear
   Future<List<Map>> deleteall() async {
   Database db = await instance.database;
   return await db.rawQuery('DELETE FROM notes;');
  }
   
  


}