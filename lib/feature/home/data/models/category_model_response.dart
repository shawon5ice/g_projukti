class CategoryModelResponse {
  CategoryModelResponse({
    required this.success,
    required this.metaData,
    required this.data,
  });
  late final bool success;
  late final MetaData metaData;
  late final List<Data> data;

  CategoryModelResponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    metaData = MetaData.fromJson(json['meta_data']);
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['meta_data'] = metaData.toJson();
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class MetaData {
  MetaData({
    required this.total,
    required this.pageSize,
  });
  late final int total;
  late final int pageSize;

  MetaData.fromJson(Map<String, dynamic> json){
    total = json['total'];
    pageSize = json['page_size'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['page_size'] = pageSize;
    return _data;
  }
}

class Data {
  Data({
    required this.name,
    required this.slug,
    required this.ordering,
    required this.categories,
    required this.translation,
  });
  late final String name;
  late final String slug;
  late final int ordering;
  late final List<Categories> categories;
  late final Translation translation;

  Data.fromJson(Map<String, dynamic> json){
    name = json['name'];
    slug = json['slug'];
    ordering = json['ordering'];
    categories = List.from(json['categories']).map((e)=>Categories.fromJson(e)).toList();
    translation = Translation.fromJson(json['translation']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['slug'] = slug;
    _data['ordering'] = ordering;
    _data['categories'] = categories.map((e)=>e.toJson()).toList();
    _data['translation'] = translation.toJson();
    return _data;
  }
}

class Categories {
  Categories({
    required this.name,
    required this.slug,
    required this.logo,
    required this.subcategories,
    required this.translation,
  });
  late final String name;
  late final String slug;
  late final String logo;
  late final List<Subcategories> subcategories;
  late final Translation translation;

  Categories.fromJson(Map<String, dynamic> json){
    name = json['name'];
    slug = json['slug'];
    logo = json['logo'];
    subcategories = List.from(json['subcategories']).map((e)=>Subcategories.fromJson(e)).toList();
    translation = Translation.fromJson(json['translation']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['slug'] = slug;
    _data['logo'] = logo;
    _data['subcategories'] = subcategories.map((e)=>e.toJson()).toList();
    _data['translation'] = translation.toJson();
    return _data;
  }
}

class Subcategories {
  Subcategories({
    required this.name,
    required this.slug,
    this.logo,
    required this.translation,
  });
  late final String name;
  late final String slug;
  late final Null logo;
  late final Translation translation;

  Subcategories.fromJson(Map<String, dynamic> json){
    name = json['name'];
    slug = json['slug'];
    logo = null;
    translation = Translation.fromJson(json['translation']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['slug'] = slug;
    _data['logo'] = logo;
    _data['translation'] = translation.toJson();
    return _data;
  }
}

class Translation {
  Translation({
    required this.bnName,
  });
  late final String bnName;

  Translation.fromJson(Map<String, dynamic> json){
    bnName = json['bn_name']??'--';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bn_name'] = bnName;
    return _data;
  }
}