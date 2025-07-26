
// ignore_for_file: camel_case_types, prefer_const_constructors,

import 'package:flutter/material.dart';
import 'package:notecom/src/databaseclass.dart';
import 'package:notecom/main.dart';
import 'package:notecom/src/homescreen.dart';


/*---------------- makenote class  ----------------*/

class makenote extends StatefulWidget {
  final dynamic initail_rando;
  const makenote({super.key , required this.initail_rando});

  @override
  State<makenote> createState() => _makenoteState();
}

class _makenoteState extends State<makenote> {


  var snackBar = SnackBar(
    duration: Duration(milliseconds: 1500),
    elevation: 8,
    behavior: SnackBarBehavior.floating,
    content:  Row(
      children: [
        Padding(padding: EdgeInsets.only(right: 10) , child: Icon(Icons.check_box , color: Colors.green, size: 30,)),
        Text('Note Added!'),
      ],
    ),
    shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
           ),  
  );

  
  // instance of text_ediitng controllers 
  final titleController   = TextEditingController();
  final contentController = TextEditingController();
  

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

      backgroundColor: Colors.grey[900],
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
            height: 900,
            child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
               Padding(
                padding: EdgeInsets.only(left: 24 , right: 24 , top: 124),
                
                  // title textfield
                  child: TextField(

                  // keyboard Button action 
                  textInputAction: TextInputAction.next,

                  // text style
                  style: TextStyle(color: buildMaterialColor(textcolorrs[widget.initail_rando]) , fontSize: 22 , fontFamily: 'Russo One'),

                  // cursor
                  cursorColor: buildMaterialColor(textcolorrs[widget.initail_rando]),
                  cursorHeight: 27,
                  cursorRadius: Radius.elliptical(20,20),
                  cursorWidth: 2.0,
                  autofocus: true,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  textAlign: TextAlign.center,

                  // border 
                  decoration: InputDecoration(
                  filled: true,
                  fillColor: buildMaterialColor(colorrs[widget.initail_rando]),
              
                  // label text
                  labelText: 'Title',
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelStyle:     TextStyle(color:buildMaterialColor(labelcolorrs[widget.initail_rando]), fontSize: 26 , fontFamily: 'Russo One',),
                  floatingLabelBehavior:  FloatingLabelBehavior.always,
                             
                
                  border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.only( topLeft:Radius.elliptical(20,20), topRight:Radius.elliptical(20,20)),
                   ),
                  ),
                  
                  // title controller
                  controller: titleController,   

                ),


              ),
              Padding(
                
                  padding: EdgeInsets.only(left: 24 , right: 24 , bottom: 24 , top: 10),

                    // content textfield
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
                    floatingLabelStyle:TextStyle(color:buildMaterialColor(labelcolorrs[widget.initail_rando]), fontSize: 26 , fontFamily: 'Russo One'),
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
          
          onPressed: ()   {

              setState(()   {

                DatabaseHelper.instance.addnote(
                note(title: titleController.text, content: contentController.text , color_id : widget.initail_rando));
                
              });
             
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

          }
        ),

        extendBodyBehindAppBar: true, 

     );
   }
}


/*--------------------------------------------*/