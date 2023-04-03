
import 'package:demo01/riverpods_sample_code/user_data_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api.dart';


final postProvider = StateNotifierProvider<PostNotifier,PostState >((ref) => PostNotifier());

@immutable
abstract class PostState{}

class InitialPostState extends PostState {}
class PostLoadingPostState extends PostState {}
class PostLoadedPostState extends PostState {
  PostLoadedPostState({
    required this.userDataModal

});
  final UserDataModal userDataModal;
}
class ErrorPostState extends PostState {
  ErrorPostState({required this.message});
  final String message;
}

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier():super(InitialPostState());
final ApiProvider _apiProvider = ApiProvider();
  void fetchPost()async{
    try{
      state = PostLoadingPostState();
      UserDataModal userDataModal = await   _apiProvider.fetchData();
      state = PostLoadedPostState(userDataModal:userDataModal);
    }catch(e){
      state = ErrorPostState(message: e.toString());
    }

  }
}

