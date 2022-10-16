import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [centerCircularProgress()]),
      body: Center(
        child: LinearProgressIndicator(),
      ),
    );
  }
}

class centerCircularProgress extends StatelessWidget {
  const centerCircularProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
      /*burdaki color'ı dışarı almadık çünkü her sayfada loading bar aynı çalışıyor
      bu yüzden temada bir yeri var mı diye bakılır main
      color: Colors.white,
 */
      //value sayesinde durdurabiliyoruz
    value : progressValue().value,
    backgroundColor: progressColor().colors,
    )
    );
  }
}

class progressValue{
  final double value = 0.4;
}

class progressColor{
  final Color colors=Colors.white;
}