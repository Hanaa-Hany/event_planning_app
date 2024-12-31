import 'package:event_planning_app/home/tabs/home_tab/tab_item_widget.dart';
import 'package:event_planning_app/home/tabs/home_tab/tab_widget.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<String> categoriesList = [
      "All",
      "Sport",
      "Birthday",
      "Meeting",
      "Gaming",
      "Eating",
      "Holiday",
      "Exhibition",
      "Workshop",
      "Book club"
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back",
                    style: AppStyle.regular14baby,
                  ),
                  Text(
                    "Hanaa Hany",
                    style: AppStyle.bold24baby,
                  ),
                ],
              ),
              Row(children: [
                Icon(
                  Icons.sunny,
                  color: AppColors.babyBlueColor,
                ),
                Container(
                    padding: EdgeInsets.all(width * .015),
                    margin: EdgeInsetsDirectional.symmetric(
                        horizontal: width * .015),
                    decoration: BoxDecoration(
                      color: AppColors.babyBlueColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "EN",
                      style: AppStyle.bold14primary,
                    ))
              ])
            ],
          ),
        ),
        body: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * .04, vertical: height * .01),
            decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Column(children: [
              Row(
                children: [
                  Icon(
                    CupertinoIcons.location_solid,
                    color: AppColors.babyBlueColor,
                  ),
                  Text(
                    "Cairo,Egypt",
                    style: AppStyle.regular14baby,
                  )
                ],
              ),
              DefaultTabController(
                  length: categoriesList.length,
                  initialIndex: 0,
                  child: TabBar(
                      onTap: (index) {
                        selectedIndex = index;
                        setState(() {});
                      },
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      labelPadding: EdgeInsets.all(8),
                      tabAlignment: TabAlignment.start,
                      tabs:
                          //[

                          //second way using map
                          //tabs should take list and i have list of string and i want to loop on it
                          //so used map to convert list of string items to list of widget
                          categoriesList.map((categoriesName) {
                        return TabWidget(
                            eventName: categoriesName,
                            isSelected: selectedIndex ==
                                categoriesList.indexOf(categoriesName),
                          selectedBackgroundColor: AppColors.babyBlueColor,
                          unSelectedBackgroundColor: Colors.transparent,
                          selectedTextStyle: AppStyle.medium14primary,
                          unSelectedTextStyle: AppStyle.medium14baby,);
                      }).toList()

                      //first way using loop
                      // for(int i=0;i<categoriesList.length;i++)
                      //   TabWidget(eventName: categoriesList[i],isSelected: checkSelectedTab(i) ,)

                      // TabWidget(selectedColor: AppColors.babyBlueColor,eventName: categoriesList[0],),
                      // TabWidget(selectedColor: AppColors.babyBlueColor,eventName: categoriesList[1]),
                      // TabWidget(selectedColor: AppColors.babyBlueColor,eventName: categoriesList[2]),
                      // TabWidget(selectedColor: AppColors.babyBlueColor,eventName: categoriesList[3]),
                      // TabWidget(selectedColor: AppColors.babyBlueColor,eventName: categoriesList[4]),
                      // TabWidget(selectedColor: AppColors.babyBlueColor,eventName: categoriesList[5]),
                      // TabWidget(selectedColor: AppColors.babyBlueColor,eventName: categoriesList[6]),
                      // TabWidget(selectedColor: AppColors.babyBlueColor,eventName: categoriesList[7]),
                      // TabWidget(selectedColor: AppColors.babyBlueColor,eventName: categoriesList[8]),

                      // ],

                      )),
              // ),
            ]),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TabItemWidget();
              },
              itemCount: 20,
            ),
          )
        ]));
  }

  //first way using loop
  bool checkSelectedTab(int index) {
    print(selectedIndex);

    if (selectedIndex == index) {
      return true;
    } else {
      return false;
    }
  }
}
