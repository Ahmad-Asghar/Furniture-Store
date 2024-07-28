import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/blocs/theme_bloc/theme_bloc.dart';
import 'package:furniture_store/common/widgets/app_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../blocs/theme_bloc/theme_event.dart';
import '../blocs/theme_bloc/theme_state.dart';
import '../common/app_colors.dart';
import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/png/back1.jpg')
        )
        ),
        child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<ThemeBloc,ThemeState>(
           builder: (context,themeState) {
             return GestureDetector(
               onTap: (){
                 context.read<ThemeBloc>().add(ToggleTheme());
               },
               child: Padding(
                 padding:  EdgeInsets.only(left: 6.w),
                 child: Padding(
                   padding:  EdgeInsets.only(top: 15.h),
                   child: Container(
                     color: AppColors.whiteColor.withOpacity(0.4),
                     child: Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           CustomTextWidget(
                             title: "Gohar Obsession's",
                             fontSize: 5.w,
                              color: themeState.themeData.brightness == Brightness.light
                                   ? AppColors.blackColor
                                   : AppColors.whiteColor,

                           ),
                           CustomTextWidget(
                             title: "YOUR SENSE OF\nCOMFORT\nREDEFINED",
                             fontSize: 8.5.w,
                             color: themeState.themeData.brightness == Brightness.light
                                 ? AppColors.greyTextColor.withOpacity(0.7)
                                 : AppColors.whiteColor,
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
               ),
             );
           }
         ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding:  EdgeInsets.all(4.w),
                child: InkWell(
                  onTap: (){
                 // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                  },
                  child: Container(
                    height: 8.h,
                    width: 8.h,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all()
                    ),
                    child: Center(
                      child: Icon(Icons.double_arrow_rounded,size: 10.w,),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
