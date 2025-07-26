
// ignore_for_file: camel_case_types, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:notecom/src/settings.dart';
import 'package:notecom/src/updatenote.dart';
import 'makenote.dart';
import 'package:notecom/src/databaseclass.dart';
import 'dart:math';
import 'package:notecom/main.dart';

// *------- generate random number Function -------- * //

int random(int min, int max) {
  
  return min + Random().nextInt(max - min);

}

/*------------- colors for notes -----------------*/

 var colorrs = const  [
   
    Color(0xff22181C),
    Color(0xff6B2737),
    Color(0xff3943B7),
    Color(0xff2E4057),
    Color(0xff2D936C),
    Color(0xffFFBF81),
    Color(0xffE76B74),
    Color(0xff2D936C),
    Color(0xff391463),
    Color(0xffFF9F1C),
    Color(0xffFFA9A3),
    Color(0xff283044),
    Color(0xff613F75),
    Color(0xffACECA1),
    Color(0xff6A3937),
    Color(0xffFFEEF2),
    Color(0xff553739),
    Color(0xff63CCCA),
    Color(0xffED6A5E),
    Color(0xffFF8552),
    Color(0xffD9BBF9),
    Color(0xff18435A),
    Color(0xff2E2E3A),
    Color(0xffF9AB55),
   
    
  ]; 


  var textcolorrs = const  [

   Colors.white,
   Colors.white,
   Colors.white,
   Colors.white,
   Colors.white,
   Color(0xff484349),
   Colors.white,
   Colors.white,
   Colors.white,
   Color(0xff484349),
   Color(0xff484349),
   Colors.white,
   Colors.white,
   Color(0xff484349),
   Colors.white,
   Color(0xff484349),
   Colors.white,
   Color(0xff484349),
   Color(0xff484349),
   Color(0xff484349),
   Color(0xff484349),
   Colors.white,
   Colors.white,
   Color(0xff484349),
    
  ];


   var labelcolorrs = const  [

    Color(0xffFF9F1C),
    Color(0xffFF9F1C),
    Color(0xffFF9F1C),
    Color(0xffFF9F1C),
    Color(0xffFF9F1C),
    Color.fromARGB(255, 209, 70, 128),
    Color(0xffFFEEF2),
    Color(0xffFFEEF2),
    Color(0xffFF9F1C),
    Color(0xffFFEEF2),
    Color.fromARGB(255, 209, 70, 128),
    Color(0xffFF9F1C),
    Color(0xffFF9F1C),
    Color.fromARGB(255, 209, 70, 128),
    Color(0xffFF9F1C),
    Color.fromARGB(255, 209, 70, 128),
    Color(0xffFFEEF2),
    Color.fromARGB(255, 209, 70, 128),
    Color(0xffFFEEF2),
    Color(0xffFFEEF2),
    Color.fromARGB(255, 209, 70, 128),
    Color(0xffFFEEF2),
    Color(0xffFF9F1C),
    Color.fromARGB(255, 107, 70, 209),
  
    
  ];


  /*------------ snack bar deleted note ---------- */ 

  var snackBar_delete = SnackBar(
    duration: Duration(milliseconds: 1500),
    elevation: 8,
    behavior: SnackBarBehavior.floating,
    content:  Row(
      children: [
        Padding(padding: EdgeInsets.only(right: 10) , child: Icon(Icons.disabled_by_default_sharp , color: Colors.red, size: 30,)),
        Text('Note Deleted!'),
      ],
    ),
    shape:    RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
           ),  
  );


    /*------------ start up image---------- */ 
   
    final Widget png = Image.asset('images/404.png' , width: 400 , height: 500 );



/*------------------ homescreen class ------------------*/

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
  
}


class _homescreenState extends State<homescreen> {


  // keep tracks of total notes 
  late int avail_notes ;

  /*----------- stream controller -----------------------*/

  final StreamController _streamController = StreamController();
  late Timer _timer;

     dynamic getData()  async {
    
     dynamic data = await DatabaseHelper.instance.fetchnote();

     avail_notes = data.length;
    
    //Add your data to stream
    _streamController.add(data);
  }

  @override
  void initState() {
    getData();

    //Check the database every 1 seconds
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) => getData());

    super.initState();
  }

  @override
  void dispose() {
    //cancel the timer
    if (_timer.isActive) _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (

                  backgroundColor: Colors.white,
   

                   extendBody: true,
                   body: Container(           
                    decoration: const BoxDecoration(
                    image: DecorationImage(
                   image: AssetImage("images/background/2.png"),
                   fit: BoxFit.none,
                   ),
                   ),

                   child: Center(

                   child: StreamBuilder(
                   stream: _streamController.stream,
                   builder: ( BuildContext context, AsyncSnapshot snapshot) 
                   {
                   
                    if (snapshot.connectionState == ConnectionState.waiting)
                    {
                      return  CircularProgressIndicator() ; 	
                    }
                    else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done)
                    {
                      
                        // if data is empty 
                        if ( avail_notes == 0 )
                        {

                            return Center(
                              child:png,                         
                          
                            );
                        }

                        if (snapshot.hasError) 
                        {
                            return const Text('Error');
                        } 
                        else if (snapshot.hasData)
                        {

                            return GridView.builder(

                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 0,
                            maxCrossAxisExtent:300,
                            mainAxisExtent: 218,
                      
                            ),

                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, index) {

                        
                              return Card ( 

                              elevation: 6,
                    
                              
                              // card style
                              margin:  const EdgeInsets.only(top: 7 , left: 7 , right: 7),           
                              color:   buildMaterialColor(colorrs[snapshot.data[index]['color_id']]),                        
                              shape:   const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.elliptical(20,20)),
                              ),

                              child: ListTile( 
                              dense: true,         
                              onLongPress: () {                        

                              DatabaseHelper.instance.deletenote(snapshot.data[index]['id']);                                     
                              ScaffoldMessenger.of(context).showSnackBar(snackBar_delete);  
                                                                       
                              },
                         
                              onTap: () {
           
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => updatenote(
                                  id:       snapshot.data[index]['id'].toString(),
                                  title:    snapshot.data[index]['title'],
                                  content:  snapshot.data[index]['content'],
                                  color_id: snapshot.data[index]['color_id'],                                    
                                  ),
                                  
                              ),
                              );
                      
                              // click effect 
                              InkWell(
                              splashColor: const  Color.fromARGB(255, 255, 255, 255).withAlpha(10),    
                              borderRadius: const BorderRadius.all(Radius.elliptical(20,20)),                  
                              );
                              },
                              
                              contentPadding: const EdgeInsets.only(top: 13, left: 10, right: 10, bottom: 13),                         
                              shape:const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.elliptical(20,20)),
                              ),

  
                              textColor: buildMaterialColor(textcolorrs[snapshot.data[index]['color_id']]),
                             
                              title:    Text(snapshot.data[index]['title'],   maxLines: 3, overflow: TextOverflow.ellipsis, style:  TextStyle(fontSize: 22, fontFamily: 'Mulish-Bold',  )),
                              subtitle: Text(snapshot.data[index]['content'], maxLines: 4, overflow: TextOverflow.ellipsis, style:  TextStyle(fontSize: 20, fontFamily: 'Mulish',       )),

                              ),
                              );
                            });
                            }  
                        
                        }
                      
                    // something else is happaning !
                    return CircularProgressIndicator();
                  },

                ), 
                ),
                ),
   
          appBar: AppBar(

          shape: const   RoundedRectangleBorder(
          borderRadius:  BorderRadius.only(
          bottomRight:   Radius.circular(90),
          bottomLeft:    Radius.circular(90),
        
          
          ),

         

          ),

          title: Row(
        
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          Container(
            margin: const EdgeInsets.all(0),
            child  : ElevatedButton(
            onPressed: () {
              // go to about
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const settings()),
              );

            },
            style: ElevatedButton.styleFrom(
            foregroundColor: buildMaterialColor(Colors.black87),
            backgroundColor: buildMaterialColor(Color(0xffafcbfa),),
            shape: const CircleBorder(),
            
            ),
            child: const Icon(Icons.settings),
          ),

          ),

          Container(
          padding: const EdgeInsets.only(right: 60), child: const Text('Notecom', style: TextStyle(fontSize: 25.0 , fontFamily: 'Russo One', ))) 
          ],   
          ), 
          ),
  

        bottomNavigationBar: BottomAppBar(

        color:buildMaterialColor(Color(0xff3943B7)),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 6,
        child: Container(height: 50.0),

        ),
          
      floatingActionButton: FloatingActionButton(
      elevation: 6,
      backgroundColor: buildMaterialColor(Colors.white),
      child:  Icon(Icons.add, color:  buildMaterialColor(Colors.black),),
      onPressed: () {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  makenote(initail_rando: random(0, 23),)),
      );
      }
     
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBodyBehindAppBar: true, 

    );
  }                    
}


/*---------------------------------------------------*/