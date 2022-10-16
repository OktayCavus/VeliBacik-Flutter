import 'package:flutter/material.dart';
import 'package:flutter_application_2/202/package/launch_manager.dart';
import 'package:flutter_application_2/202/package/loading_bar.dart';
import 'package:flutter_application_2/202/theme/light_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageLearn extends StatefulWidget {
  const PackageLearn({Key? key}) : super(key: key);

  @override
  State<PackageLearn> createState() => _PackageLearnState();
}


//DİKKAT LAUNCH MİXİN'İ WİTH İLE VERDİK
class _PackageLearnState extends State<PackageLearn> with TickerProviderStateMixin,LaunchMixin{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onSecondary,
        onPressed: () {
        launchUrl(Uri.parse('https://pub.dev/packages/url_launcher'));
      },
      child: Text('a'),),
      body: Column(
        children: [
          Text('a', style: Theme.of(context).textTheme.subtitle1,),
          const LoadingBar(),
        ],
      )
    );
  }
}

