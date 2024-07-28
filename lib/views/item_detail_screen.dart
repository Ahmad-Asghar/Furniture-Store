import 'package:animate_do/animate_do.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/blocs/items_detail_bloc/items_detail_bloc.dart';
import 'package:furniture_store/blocs/items_detail_bloc/items_detail_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../blocs/items_detail_bloc/items_detail_event.dart';
import '../blocs/theme_bloc/theme_bloc.dart';
import '../blocs/theme_bloc/theme_state.dart';
import '../common/app_colors.dart';
import '../common/widgets/app_text_widget.dart';


class ItemDetailScreen extends StatelessWidget {
  final int index;
  const ItemDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<ThemeBloc,ThemeState>(
      builder: (context,themeState) {
        bool isDarkMode = themeState.themeData.brightness==Brightness.dark?true:false;
        return BlocBuilder<ItemsBloc,ItemsState>(
            builder: (context,itemsState) {
            return itemsState is ItemsLoaded?
            Scaffold(
              backgroundColor: isDarkMode?AppColors.darkModeColor:AppColors.whiteColor,
              body: Column(
                children: [
                  Stack(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 1300),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: itemsState.items[index].showFullImage
                            ? Container(
                          key: const ValueKey(1),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(itemsState.items[index].fullImage),
                            ),
                          ),
                          height: 60.h,
                          width: double.infinity,
                        )
                            : Container(
                          key: const ValueKey(2),
                          height: 60.h,
                          width: double.infinity,
                          color: AppColors.gridColor.withOpacity(0.5),
                          child: Hero(
                            transitionOnUserGestures: true,
                            tag: index.toString(),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 11.h),
                                child: Image(
                                  height: 280,
                                  image: AssetImage(itemsState.items[index].image),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 4.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    icon: CircleAvatar(
                                        backgroundColor: AppColors.whiteColor,
                                        child:  Icon(Icons.arrow_back_rounded,color: AppColors.blackColor)
                                    )
                                ),
                                CustomTextWidget(
                                  title: 'Details',
                                    color: isDarkMode?AppColors.whiteColor:AppColors.blackColor,
                                    fontSize: 5.5.w,
                                ),
                                IconButton(
                                    onPressed: () {
                                      context.read<ItemsBloc>().add(OnItemUpdate(
                                        index,
                                        {'isLiked': !itemsState.items[index].isLiked},
                                      ));
                                    },
                                    icon: CircleAvatar(
                                        backgroundColor: AppColors.whiteColor,
                                        child:itemsState.items[index].isLiked?
                                        const Icon(Icons.favorite,color: Colors.red,)
                                            :Icon(Icons.favorite_border_rounded,color: AppColors.greyTextColor)
                                    )
                                ),

                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  context.read<ItemsBloc>().add(OnItemUpdate(
                                    index,
                                    {'showFullImage': !itemsState.items[index].showFullImage},
                                  ));
                                },
                                icon: CircleAvatar(
                                    backgroundColor: AppColors.whiteColor,
                                    child:   Image(
                                      height:20,
                                      color: itemsState.items[index].showFullImage?Colors.green:AppColors.blackColor,
                                      image: const AssetImage('assets/images/png/background.png'),
                                    )
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 1.4.h),
                  FadeInUp(
                    from: 200,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Hero(
                                tag:'name$index',
                                child: CustomTextWidget(
                                  title: itemsState.items[index].name,
                                  fontSize: 5.7.w,
                                  color: isDarkMode?AppColors.whiteColor:AppColors.blackColor,
                                ),
                              ),
                              Hero(
                                tag:'price$index',
                                child: Row(
                                  children: [
                                    CustomTextWidget(
                                      title: '\$',
                                      fontSize: 5.7.w,
                                      fontWeight: FontWeight.w600,
                                      color: isDarkMode?Colors.cyan:Colors.green,
                                    ),
                                    AnimatedFlipCounter(
                                      duration: const Duration(milliseconds: 600),
                                      value: itemsState.items[index].price*itemsState.items[index].count,
                                      textStyle: GoogleFonts.poppins(
                                        fontSize: 5.7.w,
                                        fontWeight: FontWeight.w600,
                                        color: isDarkMode?Colors.cyan:Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 0.5.h,),
                          CustomTextWidget(
                            title: itemsState.items[index].shortDescription,
                            fontSize: 4.4.w,
                            color: isDarkMode?AppColors.whiteColor:AppColors.greyTextColor,
                          ),
                          SizedBox(height: 1.h,),
                          CustomTextWidget(
                            title: "Colors",
                            fontSize: 5.3.w,
                            color: isDarkMode?AppColors.whiteColor:AppColors.blackColor,
                          ),
                          SizedBox(height: 0.6.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(itemsState.items[index].availableColors.length, (colorIndex) {
                                  return Padding(
                                    padding:  EdgeInsets.only(right: 2.w),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: (){
                                        context.read<ItemsBloc>().add(OnItemUpdate(
                                          index,
                                          {'selectedColor': colorIndex},
                                        ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.transparent,
                                          border: Border.all(
                                            color:itemsState.items[index].selectedColor==colorIndex?
                                            itemsState.items[index].availableColors[colorIndex]:
                                            Colors.transparent,
                                            width: 2
                                          )
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.all(itemsState.items[index].selectedColor==colorIndex?2.0:0),
                                          child: Container(
                                            height: 35,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: itemsState.items[index].availableColors[colorIndex],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                  if(itemsState.items[index].count!=1){
                                    context.read<ItemsBloc>().add(OnItemUpdate(
                                      index,
                                      {'count': itemsState.items[index].count-1},
                                    ));
                                  }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.gridColor.withOpacity(0.8)
                                      ),
                                      height: 30,
                                      width: 30,
                                      child: const Icon(Icons.remove,size: 22,),
                                    ),
                                  ),
                                  SizedBox(width: 3.w,),
                                  AnimatedFlipCounter(
                                    duration: const Duration(milliseconds: 600),
                                    value: itemsState.items[index].count,
                                    textStyle: GoogleFonts.poppins(
                                      fontSize: 5.w,
                                      fontWeight: FontWeight.w600,
                                      color: isDarkMode?Colors.white:Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 3.w,),
                                  InkWell(
                                    onTap: (){
                                      context.read<ItemsBloc>().add(OnItemUpdate(
                                        index,
                                        {'count': itemsState.items[index].count+1},
                                      ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: AppColors.gridColor.withOpacity(0.8)
                                      ),
                                      height: 30,
                                      width: 30,
                                      child: const Icon(Icons.add,size: 22,),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h,),
                          CustomTextWidget(
                            title: "Product Description",
                            fontSize: 5.3.w,
                            color: isDarkMode?AppColors.whiteColor:AppColors.blackColor,
                          ),
                          SizedBox(height: 0.4.h,),
                          CustomTextWidget(
                            title: itemsState.items[index].description,
                            fontSize: 4.w,
                            color: isDarkMode?AppColors.whiteColor:AppColors.greyTextColor,
                          ),
                          SizedBox(height: 1.h,),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(Size.fromHeight(6.6.h)),
                                    elevation: MaterialStateProperty.all(0),
                                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        side: BorderSide(
                                          color: isDarkMode?AppColors.whiteColor:AppColors.blackColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: CustomTextWidget(
                                    title: 'Buy Now',fontSize: 5.w,
                                    color: isDarkMode?AppColors.whiteColor:AppColors.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          )


                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ):const SizedBox();
          }
        );
      }
    );
  }
}







