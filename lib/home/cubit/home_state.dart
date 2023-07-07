part of 'home_cubit.dart';

enum HomeTab { feed, map, favorite, profile }

final class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.feed,
  });

  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
