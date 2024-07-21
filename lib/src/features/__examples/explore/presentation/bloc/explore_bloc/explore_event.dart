part of 'explore_bloc.dart';

abstract class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

class UpdateFilter extends ExploreEvent {
  final ExploreFilter filter;
  final bool forceReload;

  const UpdateFilter(this.filter, [this.forceReload = true]);

  @override
  List<Object> get props => [filter, forceReload];
}

// class LoadHealthCareEvent extends ExploreEvent {}

/// Event to toggle gridview
class ToggleGridEvent extends ExploreEvent {}

class RefreshCategoryEvent extends ExploreEvent {
  final MajorCategoryType categoryType;
  final bool forceReload;
  final bool showLoader;

  /// Event To Refresh Explore list
  /// forceReload gives bloc permission to rewrite existing data
  const RefreshCategoryEvent({
    required this.categoryType,
    required this.forceReload,
    this.showLoader = true,
  });

  @override
  List<Object> get props => [categoryType, forceReload];
}
