import 'package:flutter/material.dart';
import 'package:flutter_application_2/101/appBar.dart';


class animatedLearnView extends StatefulWidget {
  const animatedLearnView({Key? key}) : super(key: key);
  
  @override
  State<animatedLearnView> createState() => _animatedLearnViewState();
}


class _animatedLearnViewState extends State<animatedLearnView> with TickerProviderStateMixin  {
        //Text('data',style: Theme.of(context).textTheme.subtitle1,),
    // EXTENSİON YAZILDIKTAN SONRAKİ HALİ
   // Text('data',style: context.textTheme().headline1),



   @override
  void initState() {
    super.initState();
    //vsync var diye ticker provider state mixin verdik with ile
    //güçleri buna kazandırmış olduk (statefulWidget'a)
    controller=AnimationController(vsync: this , duration:_DurationItems.durationLow);
  }

  late AnimationController controller;
   bool _isOpacity = false;

    bool _isVisible = false;

    void _changeVisible(){
      setState(() {
        _isVisible = !_isVisible;
      });
    }

    void _changeOpacity(){
      setState(() {
        _isOpacity = !_isOpacity;
      });
    }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: _PlaceholderWidget(),
      ),

      floatingActionButton: FloatingActionButton(onPressed: () {
        _changeVisible();
        controller.animateTo(_isVisible ? 1 : 0);
      },
      ),

      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              duration: _DurationItems.durationLow,
              opacity: _isOpacity ? 1 : 0,
              child: Text('data')),
            trailing: IconButton(onPressed: () {
                _changeOpacity();
            }, icon:const Icon(Icons.precision_manufacturing_rounded)),
          ),

        AnimatedIcon(icon: AnimatedIcons.close_menu , 
        progress: controller,
        ),
          AnimatedDefaultTextStyle(
            child: Text('data'),
            style: (_isVisible ? context.textTheme().subtitle1 : context.textTheme().headline1) ?? TextStyle(), 
            duration: _DurationItems.durationLow
            ),

        AnimatedContainer(duration: _DurationItems.durationLow,
        // EKRANIN %20 Sİ DEMEK 
          height:_isVisible ? 0 : MediaQuery.of(context).size.height *0.2,
          width: MediaQuery.of(context).size.width *0.2,
          color: Colors.blue,),

          Expanded(child: Stack(
            children: [
              AnimatedPositioned(top:40, curve: Curves.elasticInOut ,child: Text('data'), 
              duration: _DurationItems.durationLow)
            ],
          )),

          Expanded(
            child: AnimatedList(itemBuilder: (context,index,animation) {
                return Text('data');
            }),
          )


        ],
      ),

//firstChild birinci durum secondChild ikinci durum
            
 //_isVisible ? Placeholder() : null,

    );
  }

  AnimatedCrossFade _PlaceholderWidget() {
    return AnimatedCrossFade(firstChild: Placeholder(), 
    secondChild: SizedBox.shrink(),
    crossFadeState: _isVisible ? CrossFadeState.showFirst  :CrossFadeState.showSecond ,
    duration: _DurationItems.durationLow);
  }
}

class _DurationItems{
  static const durationLow = Duration(seconds: 1);
}



// GLOBAL OBJELERİDE ÖZELLEŞTİREBİLİRİZ

extension BuildContextExtension on BuildContext{
  TextTheme textTheme(){
    //this context oluyor üstte BuildContext context olduğu için
    return Theme.of(this).textTheme;
  }
}