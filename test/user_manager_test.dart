import 'package:flutter_application_2/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  setUp((){});

  test('User Calculate', (){
    final users =[ 
      genericUser('vb', '11', 10),
      genericUser('vb', '11', 10),
      genericUser('vb', '11', 10)
      ];

    final userManagement = UserManagement(AdminUser('name', 'id', 15, 1));

    final result = userManagement.calculateMoney(users);

   final response = userManagement.showNames<String>(users);
   // expect(result, 30);

   // initialValue eklmesinden sonra
  //çünkü 14.satırda money 15 verildi
   expect(result, 45);

  });
}