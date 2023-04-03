import 'package:demo01/riverpods_sample_code/post_state.dart';
import 'package:demo01/riverpods_sample_code/user_data_modal.dart';
import 'package:demo01/riverpods_sample_code/users_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api.dart';
import '../listScreen.dart';
import '../todo.dart';

class ProviderMain extends ConsumerWidget {
  const ProviderMain({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  // temp()async{
  //   final ApiProvider _apiProvider = ApiProvider();
  //   UserDataModal userDataModal = await  _apiProvider.fetchData();
  //   if(userDataModal != null) {
  //     print(
  //         "api response................................ ${userDataModal.data![0]
  //             .firstName ?? ""}");
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the ProviderMain object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Consumer(builder: (ctx, ref, child) {
        PostState state = ref.watch(postProvider);
        if (state is InitialPostState) {
          return Text("Press to data fetch");
        }

        if (state is PostLoadingPostState) {
          return Text("Press to fab icon for data fetch");
        }

        if (state is InitialPostState) {
          return CircularProgressIndicator();
        }

        if (state is ErrorPostState) {
          return Text(state.message);
        }

        if (state is PostLoadedPostState) {
          return Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ...List.generate(
                    state.userDataModal.data!.length,
                    (i) =>ListTile(
                      leading: Image.network("${state.userDataModal.data![i].avatar}"),
                      title:  Container(
                        child: Text("${state.userDataModal.data![i].firstName} ${state.userDataModal.data![i].lastName}"),
                      ),
                      subtitle: Container(
                        child: Text("${state.userDataModal.data![i].email}"),
                      ) ,
                    )).toList(),
              ],
            ),
          );
        }
        return Text("Nothing Found");
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(postProvider.notifier).fetchPost();
        },
        child: Icon(Icons.ac_unit),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
