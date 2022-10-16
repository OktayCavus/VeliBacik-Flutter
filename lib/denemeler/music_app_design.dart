import 'package:flutter/material.dart';

class MusicAppDesing extends StatefulWidget {
   MusicAppDesing({Key? key}) : super(key: key);

  @override
  State<MusicAppDesing> createState() => _MusicAppDesingState();
}

class _MusicAppDesingState extends State<MusicAppDesing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: Icon(Icons.arrow_back_ios_new_rounded),
      title: Text('home'),
      actions: [
        
        Container(
          margin: EdgeInsets.only(right:15),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.share)
          ],//children
          )
          )
          ],//actions
          ),
        body: 
      
           ListView(
            children:   <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: 
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                  onPressed: () {}, 
                  style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent) ) ,
                  child: 
            Card(
            child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    child: ListTile(
                      minLeadingWidth: 100,
                      leading: Image.asset("assets/png/kakashi.png"),
                      title: Text('Kakashi'),
                      subtitle: Text('Sensei'),
                      trailing:IconButton(onPressed: () {},
                      icon: Icon(Icons.pause))
                      ),
                  ),
            )
          ),),
                ),
              ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {}, 
                style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent) ) ,
                child: 
              Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: ListTile(
                    minLeadingWidth: 100,
                    leading: Image.asset("assets/png/kakashi.png"),
                    title: Text('Kakashi'),
                    subtitle: Text('Sensei'),
                    trailing:IconButton(onPressed: () {},
                    icon: Icon(Icons.pause))
                    ),
                ),
              )
            ),),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(

                onPressed: () {}, 
                style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent) ) ,
                child: 
              Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: ListTile(
                    minLeadingWidth: 100,
                    leading: Image.asset("assets/png/kakashi.png"),
                    title: Text('Kakashi'),
                    subtitle: Text('Sensei'),
                    trailing:IconButton(onPressed: () {},
                    icon: Icon(Icons.pause))
                    ),
                ),
              )
            ),),
          ),
          
          ]
          ,),

          bottomNavigationBar: 
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),
              color: Colors.grey ),

              child: Row(
                children: [
                  Expanded(
                    child: IconButton(onPressed: () {
                    }, icon: Icon(Icons.home),
                    ),
                  ),
                  Expanded(
                    child: IconButton(onPressed: () {
                    }, icon: Icon(Icons.home),
                    ),
                  ),
                  Expanded(
                    child: IconButton(onPressed: () {
                    }, icon: Icon(Icons.home),
                    ),
                  ),
                  Expanded(
                    child: IconButton(onPressed: () {
                    }, icon: Icon(Icons.home),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),

      );
  }
}