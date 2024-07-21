import 'package:dropoff/src/features/__examples/explore/domain/models/explore_filter.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/generic_brand_name.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/major_category.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/page_filter.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/product_detail.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/sub_category.dart';

abstract class ExploreDatasource {
  Future<List<ProductDetail>> loadDrugCategory(ExploreFilter filter);
  Future<List<ProductDetail>> loadHealthCareCategory(ExploreFilter filter);
  Future<List<GenericBrandName>> getBrandNames(PageFilter pageFilter);
  Future<List<GenericBrandName>> getGenericNames(PageFilter pageFilter);
  Future<List<SubCategory>> getSubcategories(
      int categoryId, PageFilter pageFilter);
  Future<MajorCategoryData> getMajorCategories();
}
