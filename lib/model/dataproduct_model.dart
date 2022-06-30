import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dataproduct_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModels extends Equatable {
  final DataProduct product;

  const ProductModels({
    required this.product,
  });

  @override
  List<Object> get props => [
        product,
      ];
  factory ProductModels.fromJson(Map<String, dynamic> json) =>
      _$ProductModelsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DataProduct extends Equatable {
  final int id;
  final String name, unit, price, sku;
  @JsonKey(name: 'default_image_url')
  final imageurl;
  @JsonKey(name: 'price_per_gram')
  final pricepergram;
  @JsonKey(name: 'product_plu')
  final prodplu;
  @JsonKey(name: 'product_selling_price')
  final prodsellingprice;
  @JsonKey(name: 'product_discount_price')
  final proddisc;
  @JsonKey(name: 'detail-endpoint')
  final detail;

  const DataProduct({
    required this.id,
    required this.name,
    required this.unit,
    required this.price,
    required this.sku,
    required this.imageurl,
    required this.pricepergram,
    required this.prodplu,
    required this.prodsellingprice,
    required this.proddisc,
    required this.detail,
  });

  @override
  List<Object> get props => [
        id,
        name,
        unit,
        price,
        sku,
        imageurl,
        pricepergram,
        prodplu,
        prodsellingprice,
        proddisc,
        detail
      ];
  factory DataProduct.fromJson(Map<String, dynamic> json) =>
      _$DataProductFromJson(json);

  Map<String, dynamic> toJson() => _$DataProductToJson(this);
}
