part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();
}

final class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
}

class LoadedThemeState extends ThemeState{
  final ThemeData theme;

  const LoadedThemeState({required this.theme});

  @override
  List<Object?> get props => [theme];
}
