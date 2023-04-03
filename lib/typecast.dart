

  class CustomModal {
  bool? status;
  List<CategoriesResponse>? categoriesResponse;

  CustomModal({this.status, this.categoriesResponse});

  CustomModal.fromJson(Map<String, dynamic> json) {
  status = json["status"];
  categoriesResponse = json["categories_response"] == null ? null : (json["categories_response"] as List).map((e) => CategoriesResponse.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> _data = <String, dynamic>{};
  _data["status"] = status;
  if(categoriesResponse != null) {
  _data["categories_response"] = categoriesResponse?.map((e) => e.toJson()).toList();
  }
  return _data;
  }
  }

  class CategoriesResponse {
  String? id;
  String? categoryName;
  String? categoryImgUrl;
  String? deleted;

  CategoriesResponse({this.id, this.categoryName, this.categoryImgUrl, this.deleted});

  CategoriesResponse.fromJson(Map<String, dynamic> json) {
  id = json["id"];
  categoryName = json["category_name"];
  categoryImgUrl = json["category_img_url"];
  deleted = json["deleted"];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> _data = <String, dynamic>{};
  _data["id"] = id;
  _data["category_name"] = categoryName;
  _data["category_img_url"] = categoryImgUrl;
  _data["deleted"] = deleted;
  return _data;
  }
  }
