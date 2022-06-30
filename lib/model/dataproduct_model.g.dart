// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataproduct_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModels _$ProductModelsFromJson(Map<String, dynamic> json) =>
    ProductModels(
      product: DataProduct.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelsToJson(ProductModels instance) =>
    <String, dynamic>{
      'product': instance.product.toJson(),
    };

DataProduct _$DataProductFromJson(Map<String, dynamic> json) => DataProduct(
      id: json['id'] as int,
      name: json['name'] as String,
      unit: json['unit'] as String,
      price: json['price'] as String,
      sku: json['sku'] as String,
      imageurl: json['default_image_url'],
      pricepergram: json['price_per_gram'],
      prodplu: json['product_plu'],
      prodsellingprice: json['product_selling_price'],
      proddisc: json['product_discount_price'],
      detail: json['detail-endpoint'],
    );

Map<String, dynamic> _$DataProductToJson(DataProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unit': instance.unit,
      'price': instance.price,
      'sku': instance.sku,
      'default_image_url': instance.imageurl,
      'price_per_gram': instance.pricepergram,
      'product_plu': instance.prodplu,
      'product_selling_price': instance.prodsellingprice,
      'product_discount_price': instance.proddisc,
      'detail-endpoint': instance.detail,
    };
