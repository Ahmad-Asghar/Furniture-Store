import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/blocs/catagory_bloc/category_bloc.dart';
import 'package:furniture_store/blocs/items_detail_bloc/items_detail_bloc.dart';
import 'package:furniture_store/views/intro_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'blocs/theme_bloc/theme_bloc.dart';
import 'blocs/theme_bloc/theme_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc(),
        ),
        BlocProvider(
          create: (_) => CategoryBloc(),
        ),
        BlocProvider(
            create: (_)=>ItemsBloc()
        )
      ],
      child: BlocBuilder<ThemeBloc,ThemeState>(
          builder: (context,themeState) {
          return ResponsiveSizer(
              builder: (context, orientation, screenType) {
                bool isDarkMode = themeState.themeData.brightness==Brightness.dark?true:false;
                SystemChrome.setSystemUIOverlayStyle(
                    !isDarkMode?
                    SystemUiOverlayStyle.dark.copyWith(statusBarColor:Colors.transparent):
                    SystemUiOverlayStyle.light.copyWith(statusBarColor:Colors.transparent)
                );
              return MaterialApp(
                theme: themeState.themeData,
                debugShowCheckedModeBanner: false,
                home: const IntroScreen(),
              );
            }
          );
        }
      ),
    );
  }
}

