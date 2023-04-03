import 'package:demo01/typecast.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ListingScreen extends StatefulWidget {
  ListingScreen({Key? key}) : super(key: key);

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  final dio = Dio();
  var ApiData;
  //CustomModal customModal= CustomModal();
  void fetchData() async {
    var response = await dio
        .get("https://adminapp.tech/Admin/all_apis.php?func=categories");
    print(response);
    if (response.data != null){
    setState(() {
      ApiData = response;
    });}
    // customModal = CustomModal.fromJson(response);
  }


  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listing Page"),
      ),
      body: ApiData != null
          ? ListView.builder(
              itemCount: ApiData.data["categories_response"].length,
              itemBuilder: (c, i) => myitem(c, i))
          : CircularProgressIndicator(),
    );
  }

  Widget? myitem(c, i) {
    return Container(
        child: ListTile(
      leading: Image.network(
        ApiData.data["categories_response"][i]["category_img_url"],
        errorBuilder: (ct,ob,stack)=>Text(ob.toString()),
        width: 100,
        height: 50,
      ),
      title: GestureDetector(
          onTap: () {
            fetchData();
            //print("sdsds");
          },
          child: Text(
              "${ApiData.data["categories_response"][i]["category_name"]}")),
    ));
  }
}
