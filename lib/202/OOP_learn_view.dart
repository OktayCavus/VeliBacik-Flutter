import 'package:flutter/material.dart';
import 'package:flutter_application_2/202/OOP_learn.dart';

class OOPLearnView extends StatefulWidget {
  const OOPLearnView({Key? key}) : super(key: key);

  @override
  State<OOPLearnView> createState() => _OOPLearnViewState();
}

class _OOPLearnViewState extends State<OOPLearnView> {

  FileDownload? download;

  @override
  void initState() {
    super.initState();
    download = FileDownload();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircularProgressIndicator()
        ],
      ),

      floatingActionButton: FloatingActionButton(onPressed: () {
          SMSDownload().toShare('5061037216');
      },),
    );
  }
}