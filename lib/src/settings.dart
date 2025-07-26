
// ignore_for_file: prefer_const_constructors



import 'package:flutter/material.dart';
import 'package:notecom/main.dart';
import 'package:notecom/src/about.dart';
import 'attributations.dart';



class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      // to remove debug banner 
      debugShowCheckedModeBanner: false,

      home: Scaffold(

          appBar: AppBar(

          backgroundColor: buildMaterialColor(Color(0xff3943B7)),

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

              // go back to homescreen
              Navigator.pop(context);

            },
            style: ElevatedButton.styleFrom(
            foregroundColor: buildMaterialColor(Colors.black87),
            backgroundColor: buildMaterialColor(Color(0xffafcbfa),),
            shape: const CircleBorder(),
            
            ),
            child: const Icon(Icons.arrow_back_sharp),
          ),

          ),

          Container(
          padding: const EdgeInsets.only(right: 60), child: const Text('Settings', style: TextStyle(fontSize: 25.0 , fontFamily: 'Russo One', ))) 
          ],   
          ), 
          ),

          body: Container(
          decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage("images/background/2.png"),
          fit: BoxFit.none,
          ),
          ),

          child: Center(
            child: Card(

                elevation: 10,
              
                color:  buildMaterialColor(Color(0xff3943B7)),
                margin: EdgeInsets.only(bottom: 150 , top: 50),

                shape:  const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(20,20)),
                ), 

                child: SizedBox(
                width: 300,
                height: 300,

                child:  ListView( 

                 padding: EdgeInsets.zero,     
                 children: [
                
                 ListTile(
                 leading: Icon(Icons.color_lens_sharp , color: Colors.white , size: 40,),
                 title: const Text('Look and Feel', style: TextStyle(fontSize: 18.0 , fontFamily: 'Russo One', color: Colors.white )),
                 onTap: () {

                      InkWell(
                      splashColor: const  Color.fromARGB(255, 255, 255, 255).withAlpha(10),    
                      borderRadius: const BorderRadius.all(Radius.elliptical(20,20)),                  
                      );
                 
                  },
                 ),

                 ListTile(
                 
                 leading: Icon(Icons.wysiwyg_rounded, color: Colors.white , size: 40,),
                 title: const Text('Attributes', style: TextStyle(fontSize: 18.0 , fontFamily: 'Russo One', color: Colors.white )),
                 onTap: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => attributes(),
                          ),
                          );

                      InkWell(
                      splashColor: const  Color.fromARGB(255, 255, 255, 255).withAlpha(10),    
                      borderRadius: const BorderRadius.all(Radius.elliptical(20,20)),                  
                      );
         
                  },     
                 ),

                  ListTile(
                 leading: Icon(Icons.new_releases_outlined, color: Colors.white , size: 40,),
                 title: const Text('About', style: TextStyle(fontSize: 18.0 , fontFamily: 'Russo One', color: Colors.white )),
                 onTap: () {

                  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => about(),
                          ),
                          );

                      InkWell(
                      splashColor: const  Color.fromARGB(255, 255, 255, 255).withAlpha(10),    
                      borderRadius: const BorderRadius.all(Radius.elliptical(20,20)),                  
                      );
         
                  },     
                 ),
              ],
              ), 
              ),
              ),              
              ),
          ),
       
        extendBodyBehindAppBar: true,
        
    ),
    );
      
  }
}

