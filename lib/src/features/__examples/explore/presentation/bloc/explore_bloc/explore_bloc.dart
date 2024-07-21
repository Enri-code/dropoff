import 'package:dropoff/src/core/utils/app_responses.dart';
import 'package:dropoff/src/features/__examples/explore/data/repository/explore_repository.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/explore_data.dart';
import 'package:dropoff/src/features/__examples/explore/domain/models/explore_filter.dart';
import 'package:dropoff/src/features/__examples/explore/presentation/cubit/explore_major_category_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final ExploreRepository repo;

  ExploreBloc(this.repo) : super(ExploreInitial()) {
    on<RefreshCategoryEvent>(_refreshCategory);
    on<ToggleGridEvent>(_toggle);
    on<UpdateFilter>(_updateFilter);
  }

  void _toggle(ToggleGridEvent event, Emitter<ExploreState> emit) async {
    ExploreDisplay display = state.data.displayType.isGrid
        ? ExploreDisplay.list
        : ExploreDisplay.grid;
    emit(ExploreSuccess(state.data.copy(displayType: display)));
  }

  void _updateFilter(UpdateFilter event, Emitter<ExploreState> emit) async {
    emit(ExploreSuccess(state.data.copy(filter: event.filter)));
    if (event.forceReload) {
      add(RefreshCategoryEvent(
        categoryType: state.data.categoryType,
        forceReload: event.forceReload,
      ));
    }
  }

  void _refreshCategory(
      RefreshCategoryEvent event, Emitter<ExploreState> emit) async {
    /// show loading state if enabled in event
    if (event.showLoader) {
      /// set this to the current category type
      /// category types are drugs and healthcare
      emit(ExploreLoading(state.data.copy(categoryType: event.categoryType)));
    }

    /// refresh drug if category type is drug
    if (event.categoryType.isDrug) {
      /// if forceReload is true refresh data even if there exist data in the bloc
      /// if forceReload is false refresh data only when data is empty
      /// /// if forceReload is false and bloc contains data dont refresh
      if (!event.forceReload && state.data.drugProducts.isNotEmpty) {
        /// if data is not fetched set state to success and return
        emit(ExploreSuccess(state.data));
        return;
      }

      final result = await repo.loadDrugCategory(state.data.filter);
      result.fold(
        (left) => emit(ExploreFailed(state.data, left)),
        (right) {
          emit(ExploreSuccess(state.data.copy(drugProducts: right)));
        },
      );
    } else {
      /// if forceReload is true refresh data even if there exist data in the bloc
      /// if forceReload is false refresh data only when data is empty
      /// if forceReload is false and bloc contains data dont refresh
      if (!event.forceReload && state.data.healthCareProducts.isNotEmpty) {
        /// if data is not fetched set state to success and return
        emit(ExploreSuccess(state.data));
        return;
      }

      final result = await repo.loadHealthCareCategory(state.data.filter);
      result.fold(
        (left) => emit(ExploreFailed(state.data, left)),
        (right) {
          emit(ExploreSuccess(state.data.copy(healthCareProducts: right)));
        },
      );
    }
  }
}
