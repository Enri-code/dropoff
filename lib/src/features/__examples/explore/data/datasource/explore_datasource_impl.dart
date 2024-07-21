import 'package:dropoff/src/features/__examples/explore/domain/models/explore_filter.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/generic_brand_name.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/major_category.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/page_filter.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/product_detail.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/sub_category.dart';
import 'package:dropoff/src/features/__examples/explore/domain/repository/explore_datasource.dart';

class ExploreDatasourceImpl extends ExploreDatasource {
  final RestService service;
  ExploreDatasourceImpl(this.service);

  @override
  Future<List<ProductDetail>> loadDrugCategory(ExploreFilter filter) async {
    final response = await service.get(
      path: 'product/drugs',
      params: filter.toJson(),
    );
    if (response.hasError) throw response.error;
    return List<Map>.from(response.data!['data'])
        .map((prod) => ProductDetail.fromJson(prod))
        .toList();
  }

  @override
  Future<List<ProductDetail>> loadHealthCareCategory(
      ExploreFilter filter) async {
    final response = await service.get(
      path: 'product/health-care',
      params: filter.toJson(),
    );
    if (response.hasError) throw response.error;
    return List<Map>.from(response.data!['data'])
        .map((prod) => ProductDetail.fromJson(prod))
        .toList();
  }

  @override
  Future<List<GenericBrandName>> getBrandNames(PageFilter pageFilter) async {
    final response = await service.get(path: 'brand/brands');
    if (response.hasError) throw response.error;

    return List<Map>.from(response.data!['data'])
        .map((e) => GenericBrandName.fromJson(e))
        .toList();
  }

  @override
  Future<List<GenericBrandName>> getGenericNames(PageFilter pageFilter) async {
    final response = await service.get(path: 'generic-name/generic-names');
    if (response.hasError) throw response.error;

    return List<Map>.from(response.data!['data'])
        .map((e) => GenericBrandName.fromJson(e))
        .toList();
  }

  @override
  Future<List<SubCategory>> getSubcategories(
      int categoryId, PageFilter pageFilter) async {
    final response = await service.get(
      path: 'category/$categoryId/sub-categories',
      params: pageFilter.toJson(),
    );
    if (response.hasError) throw response.error;

    return List<Map>.from(response.data!['data'])
        .map((e) => SubCategory.fromJson(e))
        .toList();
  }

  @override
  Future<MajorCategoryData> getMajorCategories() async {
    final response = await service.get(path: 'category/categories');
    if (response.hasError) throw response.error;
    return MajorCategoryData.fromJson(response.data!['data']);
  }
}
