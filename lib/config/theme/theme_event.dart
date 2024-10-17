part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props =>[];
}


class GetCurrentThemeEvent extends ThemeEvent{}

class ChangeThemeEvent extends ThemeEvent{
  final AppTheme theme ;

  const ChangeThemeEvent({required this.theme});

  @override
  List<Object?> get props => [theme];

}