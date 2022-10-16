import 'package:flutter/material.dart';
import 'package:flutter_application_2/202/model_initialize.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({Key? key}) : super(key: key);

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {

PostModel8 user9 = PostModel8(body: 'a');
@override
  void initState() {
    super.initState();

    final user1=PostModel1()//ikiside bir yöntem
    ..userId=1;
    user1.body ='Hello';

    final user2=PostModel2(1, 2, 'a', 'b');
    user2.body='a';
    
    final user3 = PostModel3(1, 2, 'a', 'b');
    // user3.body='A'; bu olmaz çünkü final var

    final user4= PostModel4(userId: 1, id: 2, title: 'a', body: 'b');
    
    final user5=PostModel5(userId: 1, id: 2, title: 'title', body: 'body');
    //user5. yazarsak bir şey göremeyiz çünkü private yaptık 
    //görebilmesi için getter metot yazması lazım 1 tane yazdık
    user5.userId;

    final user6 = PostModel6(userId: 1, id: 2, title: 'title', body: 'body');

    final user7 = PostModel7();

    final user8 = PostModel8(body: 'a');
    
  }


  @override
  Widget build(BuildContext context) {
    // user9 finaldı üstte PostModel8' yaptık onu 
    //eğerki değiştirmek istiyorsak içindekini böyle yapmamız lazım
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          //user9 = PostModel8(title: 'On Pressed');

          //copywith'ten sonra

          user9 = user9.copyWith(title: 'vb');


          //null gelme durumunu korumak için yapılıyor çok önemli
          user9.updateBody('veli');
        });
      },),
      appBar: AppBar(
        title: Text(user9.title ?? 'not has any data'),
      ),

    );
  }
}