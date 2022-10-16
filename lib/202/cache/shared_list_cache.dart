import 'package:flutter/material.dart';
import 'package:flutter_application_2/202/cache/shared_learn_cache.dart';
import 'package:flutter_application_2/202/cache/shared_manager.dart';
import 'package:flutter_application_2/202/cache/user_cache/user_cache_manager.dart';
import 'package:flutter_application_2/202/cache/user_model.dart';


class SharedListCache extends StatefulWidget {
  const SharedListCache({Key? key}) : super(key: key);

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStateful<SharedListCache> {

  late final UserCacheManager userCacheManager ;
   List <User> _users = [] ;

  @override
  void initState() {
    super.initState();
    initializeAndSave();

  }

  Future<void> initializeAndSave() async {
    changeLoading();
    final SharedManager manager =SharedManager();
    await manager.init();
    userCacheManager = UserCacheManager(manager);
    _users = userCacheManager.getItems() ??[] ;
    changeLoading();

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading? CircularProgressIndicator() : SizedBox.shrink(),
        actions: isLoading ? null : [
          IconButton(onPressed:() async {
            changeLoading();
            await userCacheManager.saveItems(_users);
            changeLoading();

          }, icon:const Icon(Icons.download_for_offline_outlined),),
           IconButton(onPressed:() {}, icon:const Icon(Icons.remove_circle_outline),)
        ],
      ),

      body: _userListView(users: _users),
    );
  }
}

class _userListView extends StatelessWidget {
_userListView({
    Key? key, required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name ?? ""),
            subtitle: Text(users[index].description ?? ""),
            trailing: Text(users[index].url ?? "",style: Theme.of(context).textTheme.subtitle1?.copyWith(
              decoration: TextDecoration.underline
            ),),
          ),
        );
      },
    );
  }
}