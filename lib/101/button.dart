import 'package:flutter/material.dart';


  
class ButtonLearn extends StatelessWidget { //stls yazabiliriz
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(

      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(child: Text('TextButton', style: Theme.of(context).textTheme.subtitle1)
          ,onPressed: (){},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states){
              if(states.contains(MaterialState.pressed))
                return Colors.red;
                else return Colors.white;
            })

          ),
          ),

          ElevatedButton(onPressed:() {
            
          }, child: Text('ElevatedButton')),

          IconButton(onPressed: (){
              //servies istek at gibi şeyler yapılır

          }, icon:Icon(Icons.abc_rounded)), //eğer bir component özel isimle koyulmuşsa icon gibi ıconla alakalı component kullan
        
          FloatingActionButton(onPressed: (){},
          child: Icon(Icons.add)),

          

          OutlinedButton(
            
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder()
            ),
            onPressed: (){}, 
            child: Text('OutlinedButton')),
OutlinedButton.icon(onPressed: () {
  
}, icon: Icon(Icons.abc_outlined), label:Text('OutlinedButton.icon')),
          InkWell(onTap: (){},
          child: Text('InkWell')
        
          ), //ınkwell text'e ontap yüklemeye yaradı
        
        Container(
          height: 200,
          color:Colors.white,
        ),

        ElevatedButton(
          style:ElevatedButton.styleFrom(primary: Colors.black,shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          )),
          onPressed: () {},
           
         child: Padding(
           
           padding:EdgeInsets.only(bottom:15,top:15,left:30,right: 30) ,
           child: Text('Place Bid',
           style: Theme.of(context).textTheme.headline5,
           ),
         ))
        
        
        ],
      ),
    );    
  }
 
  
  
}