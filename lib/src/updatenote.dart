
// ignore_for_file: camel_case_types, prefer_const_constructors,

import 'package:flutter/material.dart';
import 'package:notecom/src/databaseclass.dart';
import 'package:notecom/main.dart';
import 'homescreen.dart';


var snackBar_update = SnackBar(
    duration: Duration(milliseconds: 1500),
    elevation: 8,
    behavior: SnackBarBehavior.floating,
    content:  Row(
      children: [
        Padding(padding: EdgeInsets.only(right: 10) , child: Icon(Icons.new_releases , color: Colors.orange, size: 30,)),
        Text('Note Updated!'),
      ],
    ),
    shape:    RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
           ),  
  );


/*---------------- updatenote class  ----------------*/

class updatenote extends StatefulWidget {
  const updatenote({super.key, required this.id , required this.title , required this.content , required this.color_id });
  final dynamic id;
  final dynamic title;
  final dynamic content;
  final dynamic color_id;


  @override
  State<updatenote> createState() => _updatenoteState();
}

class _updatenoteState extends State<updatenote> {

  // instance of text_ediitng controllers 
  late final titleController     = TextEditingController(text: widget.title);
  late final contentController   = TextEditingController(text: widget.content);

   // disposing the controllers
   @override
   void dispose() {
     titleController.dispose();
     contentController.dispose();
     super.dispose();
   }


  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: Container(

      decoration: const BoxDecoration(
      image: DecorationImage(
      image: AssetImage("images/background/2.png"),
      fit: BoxFit.none,
      ),
      ),

        child: SingleChildScrollView(
          child: Container(
            width: 400,
            height: 800,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
               Padding(
               padding: EdgeInsets.only(left: 24 , right: 24 , top: 124),

                  // title text field 
                  child: TextField(   

                  textInputAction: TextInputAction.next, 

                  // text style
                  style: TextStyle(color: buildMaterialColor(textcolorrs[widget.color_id]) , fontSize: 22 , fontFamily: 'Russo One'), 

                 // cursor
                  cursorColor: buildMaterialColor(textcolorrs[widget.color_id]),
                  cursorHeight: 27,
                  cursorRadius: Radius.elliptical(20,20),
                  cursorWidth: 2.0,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  textAlign: TextAlign.center,

                  // border 
                  decoration: InputDecoration(
                  filled: true,
                  fillColor: buildMaterialColor(colorrs[widget.color_id]),       

                  // label text
                  labelText: 'Title',
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelStyle:     TextStyle(color:buildMaterialColor(labelcolorrs[widget.color_id]), fontSize: 26 , fontFamily: 'Russo One',),
                  floatingLabelBehavior:  FloatingLabelBehavior.always,
         
                  border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.only( topLeft:Radius.elliptical(20,20), topRight:Radius.elliptical(20,20) ),
                   ),
                  ),


                  // title controller
                  controller: titleController,   

                  
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24 , right: 24 , bottom: 24 , top: 10),


                  // content field 
                  child: TextField(


                    textInputAction: TextInputAction.newline, 

                     // text style
                    style: TextStyle(color: Colors.white , fontSize: 22 , fontFamily: 'Mulish',),

                    // cursor
                    cursorColor: Color.fromARGB(255, 255, 255, 255),
                    cursorHeight: 25,
                    cursorRadius: Radius.elliptical(20,20),
                    cursorWidth: 2.0,
                    maxLines: null,
                    textCapitalization: TextCapitalization.sentences,
                    textAlign: TextAlign.center,

                    // border 
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[900],

                    labelText: 'Content',
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelStyle:TextStyle(color:buildMaterialColor(labelcolorrs[widget.color_id]), fontSize: 26 , fontFamily: 'Russo One'),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                   
                    border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.only( bottomLeft:Radius.elliptical(20,20), bottomRight:Radius.elliptical(20,20) ),
                     ),
                    ),


                  // content controller 
                  controller: contentController,
               
                ),
              ),
            ],
            ),
          ),
        ),
      ),
      appBar: AppBar( 

          shape: const  RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
          bottomRight:  Radius.elliptical(30,30),
          bottomLeft:   Radius.elliptical(30,30),
          ),

          ),
        
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.library_add_check),
          
          onPressed: () {
        
            // update the note
            setState(() {
              DatabaseHelper.instance.updatenotes(note(id: int.parse(widget.id), title: titleController.text, content: contentController.text , color_id: widget.color_id ));
            });
                  
            ScaffoldMessenger.of(context).showSnackBar(snackBar_update);
            Navigator.pop(context);

          }
        ),

         extendBodyBehindAppBar: true, 

     );
   }
}


/*--------------------------------------------*/