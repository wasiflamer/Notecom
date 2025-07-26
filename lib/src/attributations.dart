
import 'package:flutter/material.dart';
import 'package:notecom/main.dart';


class attributes extends StatefulWidget {
  const attributes({super.key});

  @override
  State<attributes> createState() => _attributesState();
}

class _attributesState extends State<attributes> {
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
            backgroundColor: buildMaterialColor(Color(0xffafcbfa)),
            shape: const CircleBorder(),
            
            ),
            child: const Icon(Icons.arrow_back_sharp),
          ),

          ),

          Container(
          padding: const EdgeInsets.only(right: 60), child: const Text('Attributes', style: TextStyle(fontSize: 25.0 , fontFamily: 'Russo One',))) 
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
                margin: EdgeInsets.only(bottom: 80 , top: 100),

                shape:  const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(20,20)),
                ), 

                child: SizedBox(      
                width: 300,
                height: 400,
                
                child:  ListView( 
          
                  children: [

                    ListTile(
                      
                        subtitle:  Padding(
                        padding: const EdgeInsets.only(top:5),
                        child: Image.asset('images/storyset-inverted.jpg',  height: 40,),
                        ),
                      title: Text('Web illustrations by -' , style: TextStyle(color: Colors.white , fontSize: 20 , fontFamily: 'Mulsih'), textAlign: TextAlign.center), 

                    ),

                    ListTile(
                      
                        subtitle:  Padding(
                        padding: const EdgeInsets.only(top:5),
                        child: Image.asset('images/ofl.png',  height: 60,),
                        ),
                        title: Text('Fonts Provided By-' , style: TextStyle(color: Colors.white , fontSize: 20 , fontFamily: 'Mulsih'), textAlign: TextAlign.center), 

                    ),

                    ListTile(

        
                      
                        subtitle:  Padding(
                        padding: const EdgeInsets.only(top:5),
                        child: Image.asset('images/google_fonts.png',  height: 90,),
                        ),
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