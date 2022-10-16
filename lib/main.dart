import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/101/navigation_learn.dart';
import 'package:flutter_application_2/202/theme/light_theme.dart';
import 'package:flutter_application_2/product/global/resource_context.dart';
import 'package:flutter_application_2/product/global/theme.notifier.dart';
import 'package:provider/provider.dart';

import '202/OOP_learn_view.dart';
import '202/alert_learn.dart';
import '202/cache/secure_context/secure_context_learn.dart';
import '202/cache/shared_learn_cache.dart';
import '202/cache/shared_list_cache.dart';
import '202/form_learn_view.dart';
import '202/sheet_learn.dart';
import '303/call_back_learn.dart';
import '303/lottie_learn.dart';
import '303/reqres_resource/view/reqres_view.dart';
import '303/tabbar_advance.dart';



// ekrana haber vereceksek changenotifier
void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier(),),
    Provider(create: (_) => resourceContext(),)
  ],
 builder:(context, child) =>const MyApp() ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifier>().currentTheme,
      
      //lightTheme().theme,
      
      
      /* ThemeData.dark().copyWith(
        

        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label
        ),

        bottomAppBarTheme:BottomAppBarTheme(
          shape:CircularNotchedRectangle()
          
        ) ,

        listTileTheme:ListTileThemeData(contentPadding: EdgeInsets.zero, ),
        //ÖNEMLİ
        progressIndicatorTheme:ProgressIndicatorThemeData(
          color: Colors.red,
        ),
        //burdaki yazım bütün kartları aynı şekle sokar
        cardTheme:CardTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        ) ,
          
          errorColor: colorsItems().coralTree,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
           centerTitle: true,
           elevation: 0,
            systemOverlayStyle:SystemUiOverlayStyle.light 
           )
      ), */
      home:  LottieLearn()
      );
  }
}



