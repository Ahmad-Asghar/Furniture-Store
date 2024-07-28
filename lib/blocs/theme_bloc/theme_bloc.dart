
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/blocs/theme_bloc/theme_event.dart';
import 'package:furniture_store/blocs/theme_bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super( LightThemeState(ThemeData.light())) {
    on<ToggleTheme>(_onToggleTheme);
  }

  void _onToggleTheme(ToggleTheme event, Emitter<ThemeState> emit) {
    if (state is LightThemeState) {
      emit(DarkThemeState(ThemeData.dark()));
    } else {
      emit(LightThemeState(ThemeData.light()));
    }
  }
}