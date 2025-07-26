
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:notecom/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';



double buttom_padding = 0 ;
double top_padding    = 0 ; 

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
  
  
   double screen_height =  MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio;

   if (screen_height < 1080 )
   {
       buttom_padding = 80 ;
       top_padding = 100 ;  
   }
   else if ( screen_height >= 1080 )
   {
       buttom_padding = 220 ;
       top_padding = 150;
   }
  
   
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

              // go back to settings
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
          padding: const EdgeInsets.only(right: 60), child: const Text('About', style: TextStyle(fontSize: 25.0 , fontFamily: 'Russo One', ))) 
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
          color:buildMaterialColor(Color(0xff3943B7)),
          
          shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.all( Radius.circular(46)),
          ),

          margin: EdgeInsets.only(bottom: buttom_padding , top: top_padding ),
  
          elevation: 10,
          child: Column(
            
            children: [
              SizedBox(
              width: 300,
              height: 150,

              child:  Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.only( topLeft:Radius.circular(46) , topRight:Radius.circular(46)),
              image: DecorationImage(
              image: AssetImage("images/logo.jpg"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              ),
              ), 
              ),
              ),

              SizedBox(

              width: 300,
              height: 240,
              child:  Column(
                children: [
                  
                  Container(
                  
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.only( bottomLeft:Radius.circular(46) , bottomRight:Radius.circular(46)),
                  color: buildMaterialColor(Color(0xff3943B7)),
                  ),

                  child: Align(
                  
                  alignment: Alignment.topLeft ,
                  child: Padding(padding: EdgeInsets.all(10),
                  child: ListTile(
                  tileColor: buildMaterialColor(Color(0xff3943B7)),
                  title: Text('Notecom' , style: TextStyle(color: Colors.white , fontSize: 20 , fontFamily: 'Russo One'),),
                  subtitle: Text('Was Built For My CS50x Final Project - More Features Will Be Added Later on, Contact Me On My Socials For Feedbacks - Dedicated To None Other Then My Two Lovely Birds Zoe and Icarus ❤', 
                  style: TextStyle(color: Colors.white70 , fontSize: 16 , fontFamily: 'sans'),),
                 
                  ),
                  ),
                  ),
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                   
                    children: [
                     
                    // Whatsapp button 
                    Padding(
                      padding: const EdgeInsets.only(left: 5 , right: 5  ),
                      child: ElevatedButton(
                      style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(buildMaterialColor(Color.fromARGB(255, 37, 211, 102)),),
                      foregroundColor: MaterialStateProperty.all<Color>(buildMaterialColor(Color.fromARGB(255, 255, 255, 255)),),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide.none
                      ),
                      ),
                      ),
                      onPressed:  ()   {},
  
                      child: IconButton(
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                      icon: FaIcon(FontAwesomeIcons.whatsapp , size: 30,), 
                      onPressed: () async  {
                     
                        var number = "+923337171414";
                        var whatsappAndroid =Uri.parse("whatsapp://send?phone=$number&text=From Notecom Userbase, ");
                        if (await canLaunchUrl(whatsappAndroid)) {
                        await launchUrl(whatsappAndroid);
                        }   

                       },
                       ),
                       ),
                       ),

                      // Github button 
                      Padding(
    
                      padding: const EdgeInsets.only(right: 5, left: 5 ),
                      child: ElevatedButton(
                      style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(buildMaterialColor(Color(0xfff5f5f5)),),
                      foregroundColor: MaterialStateProperty.all<Color>(buildMaterialColor(Color.fromARGB(255, 40, 40, 40)),),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide.none
                      ),
                      ),
                      ),
                      onPressed:  ()   {},
  
                      child: IconButton(
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                      icon: FaIcon(FontAwesomeIcons.github , size: 30,), 
                      onPressed: () async  {

                      const url = "https://github.com/wasiflamer";

                       var parsed = Uri.parse(url) ;

                       if (await canLaunchUrl(parsed)) {
                           await launchUrl(parsed);
                       } else {
                           throw "Could not launch";
                       }
                    
                       
                       },
                       ),
                       ),
                       ),

                     // youtube button 
                      Padding(
                      padding: const EdgeInsets.only(left: 5 , right: 5 ),
                      child: ElevatedButton(
                      style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(buildMaterialColor(Color.fromARGB(255, 250, 0, 0)),),
                      foregroundColor: MaterialStateProperty.all<Color>(buildMaterialColor(Color.fromARGB(255, 40, 40, 40)),),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide.none
                      ),
                      ),
                      ),
                      onPressed:  ()   {},
  
                      child: IconButton(
                        
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                      icon: FaIcon(FontAwesomeIcons.youtube , size: 30,), 
                      onPressed: () async  {

                       const url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ";

                       var parsed = Uri.parse(url) ;

                       if (await canLaunchUrl(parsed)) {
                           await launchUrl(parsed);
                       } else {
                           throw "Could not launch";
                       }
                       
                       },
                       ),
                       ),
                    ),
                    ],       
                  ),
                ],
              ),
              ),
            ],
          ),
          ),
        ),
        ),

      extendBodyBehindAppBar: true,  
        
    ),
    );
      
  }
}

