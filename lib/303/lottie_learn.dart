import 'package:flutter/material.dart';
import 'package:flutter_application_2/product/constant/durations.items.dart';
import 'package:flutter_application_2/product/constant/lottie_items.dart';
import 'package:flutter_application_2/product/global/theme.notifier.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


class LottieLearn extends StatefulWidget {
  const LottieLearn({Key? key}) : super(key: key);

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}
//https://assets6.lottiefiles.com/packages/lf20_ydo1amjm.json
//product içindeki constant içine koyduk
class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin {
  late AnimationController animationController; 

  bool isLight=false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: DurationItems.durationNormal());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        // BUNU BUTON YAPMAMIZ LAZIM Inkwell İLE SARALIM
        //SÜREKLİ OYNADIĞI İÇİN LOTTİE'NİN REPEAT FALSE YAPALIM
        //controller ile değişme süresini falan ayarladık
        //ıklandığında değişmesini sağlayalım (ontap)
        actions: [
          InkWell(
            onTap: (){
              animationController.animateTo(isLight ? 0.5 : 1);
              context.read<ThemeNotifier>().changeTheme();
              isLight = ! isLight;
            },

            child: Lottie.asset(LottieItems.themeChange.lottiePath,
            repeat: false,
            controller: animationController,
          
          ))
        ],
      ),


      body: LoadingLottie(),
    
    );
  
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    Key? key,
  }) : super(key: key);
  final _loadingLottie = 'https://assets1.lottiefiles.com/datafiles/nT4vnUFY9yay7QI/data.json';

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(_loadingLottie));
  }
}