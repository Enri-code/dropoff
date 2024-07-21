import 'package:dropoff/src/features/__examples/explore/domain/models/explore_filter.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/product_detail.dart';
import 'package:dropoff/src/features/__examples/explore/presentation/cubit/explore_major_category_cubit.dart';
import 'package:equatable/equatable.dart';

enum ExploreDisplay {
  grid,
  list;

  bool get isGrid => this == grid;
  bool get isList => this == list;
}

class ExploreData extends Equatable {
  final List<ProductDetail> drugProducts;
  final List<ProductDetail> healthCareProducts;
  final MajorCategoryType categoryType;
  final ExploreFilter filter;
  final ExploreDisplay displayType;

  /// get a list of products for the current category
  List<ProductDetail> get products =>
      categoryType.isDrug ? drugProducts : healthCareProducts;

  const ExploreData({
    required this.drugProducts,
    required this.healthCareProducts,
    required this.categoryType,
    required this.filter,
    required this.displayType,
  });

  factory ExploreData.initial() => ExploreData(
        drugProducts: const [],
        healthCareProducts: const [],
        categoryType: MajorCategoryType.drug,
        filter: ExploreFilter.initial(),
        displayType: ExploreDisplay.grid,
      );

  ExploreData copy({
    List<ProductDetail>? drugProducts,
    List<ProductDetail>? healthCareProducts,
    MajorCategoryType? categoryType,
    ExploreFilter? filter,
    ExploreDisplay? displayType,
  }) =>
      ExploreData(
        drugProducts: drugProducts ?? this.drugProducts,
        healthCareProducts: healthCareProducts ?? this.healthCareProducts,
        categoryType: categoryType ?? this.categoryType,
        filter: filter ?? this.filter,
        displayType: displayType ?? this.displayType,
      );

  @override
  List<Object?> get props => [
        drugProducts,
        healthCareProducts,
        categoryType,
        filter,
        displayType,
      ];
}
