class SubCategoryResponseModel {
  SubCategoryResponseModel({
    required this.success,
    required this.metaData,
    required this.data,
  });
  late final bool success;
  late final MetaData? metaData;
  late final Data? data;

  SubCategoryResponseModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    metaData = json['meta_data'] != null ? MetaData.fromJson(json['meta_data']) : null;
    data = !json.containsKey('extra') ?Data.fromJson(json['data']): null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['meta_data'] = metaData?.toJson();
    _data['data'] = data?.toJson();
    return _data;
  }
}

class MetaData {
  MetaData({
    required this.total,
    required this.pageSize,
    required this.next,
    this.previous,
  });
  late final int total;
  late final String pageSize;
  late final int? next;
  late final Null previous;

  MetaData.fromJson(Map<String, dynamic> json){
    total = json['total'];
    pageSize = json['page_size'];
    next = json['next'];
    previous = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['page_size'] = pageSize;
    _data['next'] = next;
    _data['previous'] = previous;
    return _data;
  }
}

class Data {
  Data({
    required this.products,
  });
  late final List<Product> products;

  Data.fromJson(Map<String, dynamic> json){
    products = List.from(json['data']).map((e)=>Product.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = products.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Product {
  Product({
    required this.id,
    required this.images,
    required this.taxValue,
    required this.updatedSellingPrice,
    required this.stockAvailable,
    required this.name,
    required this.slug,
    required this.sku,
    required this.sellingPrice,
    required this.specifications,
    required this.meta,
    required this.onlineDiscount,
    required this.offlineDiscount,
    required this.serviceWarranty,
    required this.gsheba,
    this.gshebaWarrantyDurationType,
    this.serviceWarrantyDurationType,
    required this.sellWarranty,
    required this.officialWarranty,
    this.officialWarrantyDurationType,
    required this.replacementWarranty,
    this.replacementWarrantyDurationType,
    required this.sellWarrantyDurationType,
    required this.minimumStockQuantity,
    required this.isActive,
    required this.isFeatured,
    required this.isTopSale,
    required this.isUpcoming,
    required this.isNewArrival,
    required this.showOnLandingPage,
    required this.showInEcommerce,
    required this.onTheGo,
    required this.isCartDisabled,
    required this.isSpecialDay,
    required this.rating,
    required this.integrityGuaranteed,
    required this.ordering,
    this.bannerMessage,
    required this.metaTitle,
    required this.metaDescription,
    required this.canonical,
    required this.ogImage,
    required this.ogTitle,
    required this.ogDescription,
    required this.ogUrl,
    required this.isOnlyPos,
    required this.isOnlyEcommerce,
    this.notes,
    this.youtubeLinks,
    this.customWarranty,
    required this.advanceAmountHomeDelivery,
    required this.advanceAmountShopPickup,
    this.advanceTypeHomeDelivery,
    this.advanceTypeShopPickup,
    required this.brand,
    this.posProductInfo,
  });
  late final int id;
  late final String images;
  late final num taxValue;
  late final num updatedSellingPrice;
  late final bool stockAvailable;
  late final String name;
  late final String slug;
  late final String sku;
  late final num sellingPrice;
  late final List<dynamic> specifications;
  late final Meta meta;
  late final OnlineDiscount onlineDiscount;
  late final OfflineDiscount offlineDiscount;
  late final num serviceWarranty;
  late final num gsheba;
  late final Null gshebaWarrantyDurationType;
  late final Null serviceWarrantyDurationType;
  late final num sellWarranty;
  late final num officialWarranty;
  late final Null officialWarrantyDurationType;
  late final num replacementWarranty;
  late final Null replacementWarrantyDurationType;
  late final String sellWarrantyDurationType;
  late final num minimumStockQuantity;
  late final bool isActive;
  late final bool isFeatured;
  late final bool isTopSale;
  late final bool isUpcoming;
  late final bool isNewArrival;
  late final bool showOnLandingPage;
  late final bool showInEcommerce;
  late final bool onTheGo;
  late final bool isCartDisabled;
  late final bool isSpecialDay;
  late final num rating;
  late final IntegrityGuaranteed integrityGuaranteed;
  late final num ordering;
  late final Null bannerMessage;
  late final String metaTitle;
  late final String metaDescription;
  late final String canonical;
  late final String ogImage;
  late final String ogTitle;
  late final String ogDescription;
  late final String ogUrl;
  late final bool isOnlyPos;
  late final bool isOnlyEcommerce;
  late final Null notes;
  late final Null youtubeLinks;
  late final Null customWarranty;
  late final String advanceAmountHomeDelivery;
  late final String advanceAmountShopPickup;
  late final Null advanceTypeHomeDelivery;
  late final Null advanceTypeShopPickup;
  late final num brand;
  late final Null posProductInfo;

  Product.fromJson(Map<String, dynamic> json){
    id = json['id'];
    images = json['images'];
    taxValue = json['tax_value'];
    updatedSellingPrice = json['updated_selling_price'];
    stockAvailable = json['stock_available'];
    name = json['name'];
    slug = json['slug'];
    sku = json['sku'];
    sellingPrice = json['selling_price'];
    specifications = List.castFrom<dynamic, dynamic>(json['specifications']);
    meta = Meta.fromJson(json['meta']);
    onlineDiscount = OnlineDiscount.fromJson(json['online_discount']);
    offlineDiscount = OfflineDiscount.fromJson(json['offline_discount']);
    serviceWarranty = json['service_warranty'];
    gsheba = json['gsheba']??0;
    gshebaWarrantyDurationType = null;
    serviceWarrantyDurationType = null;
    sellWarranty = json['sell_warranty'];
    officialWarranty = json['official_warranty']??0;
    officialWarrantyDurationType = null;
    replacementWarranty = json['replacement_warranty']??0;
    replacementWarrantyDurationType = null;
    sellWarrantyDurationType = json['sell_warranty_duration_type']??'--';
    minimumStockQuantity = json['minimum_stock_quantity'];
    isActive = json['is_active'];
    isFeatured = json['is_featured'];
    isTopSale = json['is_top_sale'];
    isUpcoming = json['is_upcoming'];
    isNewArrival = json['is_new_arrival'];
    showOnLandingPage = json['show_on_landing_page'];
    showInEcommerce = json['show_in_ecommerce'];
    onTheGo = json['on_the_go'];
    isCartDisabled = json['is_cart_disabled'];
    isSpecialDay = json['is_special_day'];
    rating = json['rating'];
    integrityGuaranteed = IntegrityGuaranteed.fromJson(json['integrity_guaranteed']);
    ordering = json['ordering'];
    bannerMessage = null;
    metaTitle = json['metaTitle'];
    metaDescription = json['metaDescription'];
    canonical = json['canonical']??'--';
    ogImage = json['ogImage']??'--';
    ogTitle = json['ogTitle']??'--';
    ogDescription = json['ogDescription']??'--';
    ogUrl = json['ogUrl']??'--';
    isOnlyPos = json['is_only_pos'];
    isOnlyEcommerce = json['is_only_ecommerce'];
    notes = null;
    youtubeLinks = null;
    customWarranty = null;
    advanceAmountHomeDelivery = json['advance_amount_home_delivery'];
    advanceAmountShopPickup = json['advance_amount_shop_pickup'];
    advanceTypeHomeDelivery = null;
    advanceTypeShopPickup = null;
    brand = json['brand'];
    posProductInfo = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['images'] = images;
    _data['tax_value'] = taxValue;
    _data['updated_selling_price'] = updatedSellingPrice;
    _data['stock_available'] = stockAvailable;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['sku'] = sku;
    _data['selling_price'] = sellingPrice;
    _data['specifications'] = specifications;
    _data['meta'] = meta.toJson();
    _data['online_discount'] = onlineDiscount.toJson();
    _data['offline_discount'] = offlineDiscount.toJson();
    _data['service_warranty'] = serviceWarranty;
    _data['gsheba'] = gsheba;
    _data['gsheba_warranty_duration_type'] = gshebaWarrantyDurationType;
    _data['service_warranty_duration_type'] = serviceWarrantyDurationType;
    _data['sell_warranty'] = sellWarranty;
    _data['official_warranty'] = officialWarranty;
    _data['official_warranty_duration_type'] = officialWarrantyDurationType;
    _data['replacement_warranty'] = replacementWarranty;
    _data['replacement_warranty_duration_type'] = replacementWarrantyDurationType;
    _data['sell_warranty_duration_type'] = sellWarrantyDurationType;
    _data['minimum_stock_quantity'] = minimumStockQuantity;
    _data['is_active'] = isActive;
    _data['is_featured'] = isFeatured;
    _data['is_top_sale'] = isTopSale;
    _data['is_upcoming'] = isUpcoming;
    _data['is_new_arrival'] = isNewArrival;
    _data['show_on_landing_page'] = showOnLandingPage;
    _data['show_in_ecommerce'] = showInEcommerce;
    _data['on_the_go'] = onTheGo;
    _data['is_cart_disabled'] = isCartDisabled;
    _data['is_special_day'] = isSpecialDay;
    _data['rating'] = rating;
    _data['integrity_guaranteed'] = integrityGuaranteed.toJson();
    _data['ordering'] = ordering;
    _data['banner_message'] = bannerMessage;
    _data['metaTitle'] = metaTitle;
    _data['metaDescription'] = metaDescription;
    _data['canonical'] = canonical;
    _data['ogImage'] = ogImage;
    _data['ogTitle'] = ogTitle;
    _data['ogDescription'] = ogDescription;
    _data['ogUrl'] = ogUrl;
    _data['is_only_pos'] = isOnlyPos;
    _data['is_only_ecommerce'] = isOnlyEcommerce;
    _data['notes'] = notes;
    _data['youtube_links'] = youtubeLinks;
    _data['custom_warranty'] = customWarranty;
    _data['advance_amount_home_delivery'] = advanceAmountHomeDelivery;
    _data['advance_amount_shop_pickup'] = advanceAmountShopPickup;
    _data['advance_type_home_delivery'] = advanceTypeHomeDelivery;
    _data['advance_type_shop_pickup'] = advanceTypeShopPickup;
    _data['brand'] = brand;
    _data['pos_product_info'] = posProductInfo;
    return _data;
  }
}


class Meta {
  Meta({
    required this.description,
    required this.shortDescription,
  });
  late final String description;
  late final String shortDescription;

  Meta.fromJson(Map<String, dynamic> json){
    description = json['description'];
    shortDescription = json['short_description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['description'] = description;
    _data['short_description'] = shortDescription;
    return _data;
  }
}

class OnlineDiscount {
  OnlineDiscount({
    required this.onlineDiscountAmount,
    required this.onlineDiscountMethod,
  });
  late final num onlineDiscountAmount;
  late final String onlineDiscountMethod;

  OnlineDiscount.fromJson(Map<String, dynamic> json){
    onlineDiscountAmount = json['online_discount_amount']??0;
    onlineDiscountMethod = json['online_discount_method']??'--';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['online_discount_amount'] = onlineDiscountAmount;
    _data['online_discount_method'] = onlineDiscountMethod;
    return _data;
  }
}

class OfflineDiscount {
  OfflineDiscount();

  OfflineDiscount.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class IntegrityGuaranteed {
  IntegrityGuaranteed({
    required this.quality,
    required this.authenticity,
    required this.sellerReliability,
  });
  late final String quality;
  late final String authenticity;
  late final String sellerReliability;

  IntegrityGuaranteed.fromJson(Map<String, dynamic> json){
    quality = json['quality'];
    authenticity = json['authenticity'];
    sellerReliability = json['seller_reliability'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['quality'] = quality;
    _data['authenticity'] = authenticity;
    _data['seller_reliability'] = sellerReliability;
    return _data;
  }
}