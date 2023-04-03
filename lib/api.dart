import 'package:demo01/riverpods_sample_code/user_data_modal.dart';
import 'package:dio/dio.dart';

class ApiProvider{




    //CustomModal customModal= CustomModal();
     fetchData() async {
      final dio = Dio();
      UserDataModal userDataModal = UserDataModal();
      var response = await dio
          .get("https://reqres.in/api/users?page=2");
      print(response);
      if (response.data != null){

          userDataModal = UserDataModal.fromJson(response.data);
      }
      // customModal = CustomModal.fromJson(response);
      return userDataModal;
    }


}