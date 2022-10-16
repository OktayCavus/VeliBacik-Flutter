// PART PARTOF PRİVATE DOSYA VE DİĞER DOSYAYI HABERLEŞTİRMEK İÇİN
//KULLANILIYOR

part of './part_of_learn.dart';


class PartOfAppBar extends StatelessWidget with PreferredSizeWidget{
  const PartOfAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('a'),
      actions: [
        IconButton(onPressed: () {},
         icon: Icon(Icons.abc_rounded))
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size.fromHeight(kToolbarHeight) ;
}