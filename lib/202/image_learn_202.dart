import 'package:flutter/material.dart';
import 'package:flutter_application_2/product/global/resource_context.dart';
import 'package:provider/provider.dart';

class imageLearn202 extends StatefulWidget {
  const imageLearn202({Key? key}) : super(key: key);

  @override
  State<imageLearn202> createState() => _imageLearn202State();
}

class _imageLearn202State extends State<imageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed:(){
            context.read<resourceContext>().remove();
          }, 
          icon: Icon(Icons.remove))
        ],
        title: Center(child: Text(context.read<resourceContext>().model?.data?.length.toString() ?? '')),
      ),
      body: //Image.asset(imagePaths.luffy.path()),
      imagePaths.luffy.toWidget(height: 80)
    );
  }
}


// ignore: camel_case_types
enum imagePaths{
  luffy
}

extension imagePathExtension on imagePaths{
  String path(){
    return 'assets/png/$name.png';
  }

  Widget toWidget({double height =40}){
    return Image.asset(path(),height: height,);
  }
}