import 'package:dropoff/src/core/utils/app_responses.dart';
import 'package:dropoff/src/features/__examples/explore/data/repository/explore_repository.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/major_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'explore_major_category_state.dart';

class ExploreMajorCategoryCubit extends Cubit<ExploreMajorCategoryState> {
  final ExploreRepository repo;

  ExploreMajorCategoryCubit(this.repo) : super(ExploreMajorCategoryInitial());

  Future getCategories() async {
    emit(ExploreMajorCategoryLoading());
    final result = await repo.getMajorCategories();
    result.fold((left) {
      emit(ExploreMajorCategoryFailed(left));
    }, (right) {
      emit(ExploreMajorCategorySuccess(right));
    });
  }

  void changeCategoryType(MajorCategoryType type) {
    if (state is ExploreMajorCategorySuccess) {
      final successState = state as ExploreMajorCategorySuccess;
      emit(ExploreMajorCategorySuccess(successState.categoryData, type));
    }
  }
}
