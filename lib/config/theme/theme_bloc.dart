import 'package:bloc/bloc.dart';
import 'package:design_pattern/config/theme/app_theme.dart';
import 'package:design_pattern/config/theme/theme_cache_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) async{
      if(event is ChangeThemeEvent){
        final index= event.theme.index;
        await ThemeCacheHelper().cacheThemeIndex(index);
        emit(LoadedThemeState(theme: appThemeData[event.theme]!));
      }else if(event is GetCurrentThemeEvent){
        final cacheIndex=ThemeCacheHelper().getCachedIndex();
        final theme = AppTheme.values.firstWhere((appTheme)=>appTheme.index == cacheIndex);
        emit(LoadedThemeState(theme: appThemeData[theme]!));
      }

    });
  }
}
