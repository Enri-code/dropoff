import 'package:dropoff/src/core/utils/app_responses.dart';
import 'package:dropoff/src/core/utils/custom.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/explore_filter.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/generic_brand_name.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/major_category.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/page_filter.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/product_detail.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/sub_category.dart';
import 'package:dropoff/src/features/__examples/explore/domain/repository/explore_datasource.dart';
import 'package:either_dart/either.dart';

class ExploreRepository {
  final ExploreDatasource datasource;

  ExploreRepository(this.datasource);

  AsyncApiErrorOr<MajorCategoryData> getMajorCategories() async {
    try {
      final result = await datasource.getMajorCategories();
      return Right(result);
    } on ApiError catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(ApiError.unknown);
    }
  }

  AsyncApiErrorOr<List<ProductDetail>> loadDrugCategory(
      ExploreFilter filter) async {
    try {
      final result = await datasource.loadDrugCategory(filter);
      return Right(result);
    } on ApiError catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(ApiError.unknown);
    }
  }

  AsyncApiErrorOr<List<ProductDetail>> loadHealthCareCategory(
      ExploreFilter filter) async {
    try {
      final result = await datasource.loadHealthCareCategory(filter);
      return Right(result);
    } on ApiError catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(ApiError.unknown);
    }
  }

  AsyncApiErrorOr<List<GenericBrandName>> getBrandNames(
      PageFilter pageFilter) async {
    try {
      final result = await datasource.getBrandNames(pageFilter);
      return Right(result);
    } on ApiError catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(ApiError.unknown);
    }
  }

  AsyncApiErrorOr<List<GenericBrandName>> getGenericNames(
      PageFilter pageFilter) async {
    try {
      final result = await datasource.getGenericNames(pageFilter);
      return Right(result);
    } on ApiError catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(ApiError.unknown);
    }
  }

  AsyncApiErrorOr<List<SubCategory>> getSubcategories(
      int categoryId, PageFilter filter) async {
    try {
      final result = await datasource.getSubcategories(categoryId, filter);
      return Right(result);
    } on ApiError catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(ApiError.unknown);
    }
  }
}
