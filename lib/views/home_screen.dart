import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store/blocs/catagory_bloc/category_bloc.dart';
import 'package:furniture_store/blocs/catagory_bloc/category_state.dart';
import 'package:furniture_store/blocs/theme_bloc/theme_state.dart';
import 'package:furniture_store/common/widgets/app_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../blocs/catagory_bloc/category_event.dart';
import '../blocs/items_detail_bloc/items_detail_bloc.dart';
import '../blocs/items_detail_bloc/items_detail_event.dart';
import '../blocs/items_detail_bloc/items_detail_state.dart';
import '../blocs/theme_bloc/theme_bloc.dart';
import '../blocs/theme_bloc/theme_event.dart';
import '../common/app_colors.dart';
import '../models/items_model.dart';
import 'item_detail_screen.dart';

List<String> categories=[
   'All',
   'Chair',
   'Table',
   'Lamp',
   'Sofa',
   'Bed',
   'Drawer',
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc,ThemeState>(
      builder: (context,themeState) {

        bool isDarkMode = themeState.themeData.brightness==Brightness.dark?true:false;

        return Scaffold(
          backgroundColor: isDarkMode?AppColors.darkModeColor:AppColors.whiteColor,

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h,),
              Padding(
                padding:  EdgeInsets.only(left: 4.w,right: 2.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      title: 'Find Your\nDream Furniture',
                      fontSize: 6.w,
                      color: isDarkMode?AppColors.whiteColor:AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: AppColors.gridColor.withOpacity(0.5),
                            child:Icon(Icons.shopping_cart_rounded,color: isDarkMode?AppColors.whiteColor: AppColors.blackColor)
                        ),
                        IconButton(
                            onPressed: (){
                              context.read<ThemeBloc>().add(ToggleTheme());
                            },
                            icon: CircleAvatar(
                                backgroundColor: AppColors.gridColor.withOpacity(0.5),
                                child:Icon(isDarkMode?Icons.light_mode_rounded:Icons.dark_mode_rounded,color: isDarkMode?AppColors.whiteColor: AppColors.blackColor)
                            )
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 1.h,),
              SizedBox(
                height: 5.h,
              child: BlocBuilder<CategoryBloc,CategoryState>(
                  builder: (context, categoryState) {
                  return ListView.builder(
                    padding: EdgeInsets.only(left: 4.w),
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context,int index){
                        bool isSelected = false;
                        if (categoryState is CategorySelected) {
                          isSelected = categoryState.selectedCategory == index;
                        }
                        return Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(25),
                            onTap: (){
                              context.read<CategoryBloc>().add(SelectCategory(index));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? (isDarkMode
                                    ? Colors.white
                                    : AppColors.darkModeColor)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: isSelected
                                      ? (isDarkMode ? AppColors.whiteColor : AppColors.darkModeColor)
                                      : (isDarkMode ? AppColors.whiteColor : AppColors.darkModeColor)
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                                  child: CustomTextWidget(
                                    title: categories[index],
                                    color: isSelected
                                        ? (isDarkMode ? AppColors.darkModeColor : AppColors.whiteColor)
                                        : (isDarkMode ? AppColors.whiteColor : AppColors.darkModeColor),
                                  ),
                                ),
                              ),
                            )

                          ),
                        );
                      }
                      );
                }
              ),
              ),
              SizedBox(height: 0.3.h,),
              Divider(
                  color:isDarkMode?AppColors.whiteColor.withOpacity(0.3):AppColors.greyTextColor.withOpacity(0.3),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 4.w),
                child: SizedBox(
                  height: 23.h,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Column(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 800),
                            height:isDarkMode? 5.h:0,),
                          Container(
                            height: 18.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                  colors: [AppColors.primaryColor,AppColors.secondaryColor]
                              )
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 1.8.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextWidget(title: "Promo for first\nPurchase",fontSize: 5.6.w,fontWeight: FontWeight.w300),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(title: "Special Offers",fontWeight: FontWeight.w300,fontSize: 3.5.w,),
                                      CustomTextWidget(title: "40% Off Prices",fontSize: 4.5.w,fontWeight: FontWeight.w400),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 800),
                            height: isDarkMode? 0:5.h,)
                        ],
                      ),
                      Padding(
                        padding:  EdgeInsets.only(right: 5.w),
                        child: FadeInRight(
                            from: 600,
                            child: const Image(image: AssetImage('assets/images/png/showcase.png'),height: 150,)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: isDarkMode?1.h:0.h,),
              Padding(
                padding:  EdgeInsets.only(left:4.w,bottom: 0.2.h),
                child: CustomTextWidget(
                  title: "Popular",
                  fontSize: 5.w,
                  color: isDarkMode?AppColors.whiteColor:AppColors.blackColor,
                ),
              ),
              BlocBuilder<ItemsBloc, ItemsState>(
                  builder: (context, itemsState) {
                  if(itemsState is ItemsLoaded){
                    return Expanded(
                      child: GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
                          itemCount: 7,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 5,
                              crossAxisCount: 2
                          ),
                          itemBuilder: (BuildContext context,int index){
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetailScreen(index: index,)));
                              },
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 800),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: AppColors.gridColor.withOpacity(0.5),
                                        borderRadius:  BorderRadius.only(
                                            bottomRight: Radius.circular(isDarkMode?5:150,),
                                            bottomLeft: const Radius.circular(5),
                                            topRight: const Radius.circular(5),
                                            topLeft: const Radius.circular(5)
                                        )
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.only(left: 3.w,bottom: 1.5.h),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 1.3.h,),
                                              Hero(
                                                tag:'name$index',
                                                child: CustomTextWidget(
                                                  title: itemsState.items[index].name,
                                                  fontSize: 4.1.w,
                                                  color: isDarkMode?AppColors.whiteColor:AppColors.blackColor,

                                                ),
                                              ),
                                              Hero(
                                                tag:'price$index',
                                                child: CustomTextWidget(
                                                  title: "\$${itemsState.items[index].price.toInt()}",
                                                  fontSize: 4.1.w,
                                                  color: isDarkMode?AppColors.whiteColor:AppColors.blackColor,

                                                ),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                context.read<ItemsBloc>().add(OnItemUpdate(
                                                  index,
                                                  {'isLiked': !itemsState.items[index].isLiked},
                                                ));
                                              },
                                              child: CircleAvatar(
                                                radius: 12,
                                                  backgroundColor: AppColors.whiteColor,
                                                  child:itemsState.items[index].isLiked?
                                                  const Icon(Icons.favorite,color: Colors.red,size: 16,)
                                                      :Icon(Icons.favorite_border_rounded,color: AppColors.greyTextColor,size: 16,)
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(right:5.w),
                                    child:index%2==0? FadeInLeft(
                                      from:600,
                                      child: Hero(
                                        transitionOnUserGestures: true,
                                        tag:index.toString(),
                                        child: Image(
                                            height:120,
                                            image: AssetImage(itemsState.items[index].image,)
                                        ),
                                      ),
                                    ):FadeInRight(

                                      from:600,
                                      child: Hero(
                                        transitionOnUserGestures: true,
                                        tag: (index).toString(),
                                        child: Image(
                                            height:120,
                                            image: AssetImage(itemsState.items[index].image,)
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    );
                  }else{
                    return const SizedBox();
                  }
                }
              )
            ],
          ),
        );
      }
    );
  }
}
