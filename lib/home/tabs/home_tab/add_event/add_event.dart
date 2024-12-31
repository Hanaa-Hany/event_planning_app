import 'package:event_planning_app/home/tabs/home_tab/add_event/date_time_widget.dart';
import 'package:event_planning_app/home/tabs/home_tab/tab_widget.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:event_planning_app/utils/assets_manager.dart';
import 'package:event_planning_app/widget/custom_elevated_btn.dart';
import 'package:event_planning_app/widget/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  static const String routeName = "AddEvent";

  AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int selectedIndex = 0;

  List<String> eventCategoriesList = [
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
  List<String> eventIconsList = [
    AssetsManager.sportIcon,
    AssetsManager.birthdayIcon,
    // AssetsManager.meetingIcon,
    // AssetsManager.gamingIcon,
    // AssetsManager.eatingIcon,
    // AssetsManager.holidayIcon,
    // AssetsManager.exhibitionIcon,
    // AssetsManager.workshopIcon,
    AssetsManager.bookIcon,
    AssetsManager.bookIcon,
    AssetsManager.bookIcon,
    AssetsManager.bookIcon,
    AssetsManager.bookIcon,
    AssetsManager.bookIcon,
    AssetsManager.bookIcon,
  ];
  List<String> eventBackgroundList = [
    AssetsManager.sportBgLight,
    AssetsManager.birthdayBgLight,
    AssetsManager.meetingBgLight,
    AssetsManager.gamingBgLight,
    AssetsManager.eatingBgLight,
    AssetsManager.holidayBgLight,
    AssetsManager.exhibitionBgLight,
    AssetsManager.workshopBgLight,
    AssetsManager.bookBgLight,
  ];
  var selectedImage = AssetsManager.sportBgLight;
  TextEditingController titleController = TextEditingController();
  TextEditingController discController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  String? formattedDate;
  TimeOfDay? selectedTime;
  String? formattedTime;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.create_event,
            style: AppStyle.medium20primary),
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * .04, vertical: height * .01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //we have another way that i can make radius using clipRRect
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    selectedImage,
                    fit: BoxFit.fill,
                    height: height*.25,
                  )),
              SizedBox(
                height: height * .02,
              ),
              SizedBox(
                // padding: EdgeInsets.symmetric(horizontal: width * .04),
                height: height * .045,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectedIndex = index;
                        selectedImage = eventBackgroundList[selectedIndex];
                        print(eventBackgroundList[selectedIndex]);
                        setState(() {});
                      },
                      child: TabWidget(
                        eventName: eventCategoriesList[index],
                        isSelected: selectedIndex == index,
                        selectedBackgroundColor: AppColors.primaryColor,
                        unSelectedBackgroundColor: AppColors.babyBlueColor,
                        selectedTextStyle: AppStyle.medium14baby,
                        unSelectedTextStyle: AppStyle.medium14primary,
                        borderColor: AppColors.primaryColor,
                      ),
                    );
                  },
                  itemCount: eventCategoriesList.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: width * .02,
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(AppLocalizations.of(context)!.title,
                        style: AppStyle.medium16black),
                    SizedBox(
                      height: height * .01,
                    ),
                    CustomTextFieldWidget(
                      hintText: AppLocalizations.of(context)!.event_title,
                      prefixIcon: AssetsManager.editIcon,
                      controller: titleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter event title';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Text(AppLocalizations.of(context)!.description,
                        style: AppStyle.medium16black),
                    SizedBox(
                      height: height * .01,
                    ),
                    CustomTextFieldWidget(
                      hintText: AppLocalizations.of(context)!.event_description,
                      maxLines: 4,
                      controller: discController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter event description';
                        }
                        return null;
                      },
                    ),
                    //),
                    DateTimeWidget(
                      title: AppLocalizations.of(context)!.event_date,
                      icon: AssetsManager.dateIcon,
                      btnName:selectedDate==null? AppLocalizations.of(context)!.choose_date:
                      formattedDate!,
                      pressed: showDate,
                    ),
                    DateTimeWidget(
                      title: AppLocalizations.of(context)!.event_time,
                      icon: AssetsManager.clockIcon,
                      btnName:selectedTime==null? AppLocalizations.of(context)!.choose_time:
                      formattedTime!,
                      pressed: showTime,
                    ),

                    Text(AppLocalizations.of(context)!.location,
                        style: AppStyle.medium16black),
                    SizedBox(
                      height: height * .02,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * .02, vertical: height * .01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: AppColors.primaryColor, width: 1),
                      ),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * .03,
                                  vertical: height * .015),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.primaryColor),
                              child: ImageIcon(
                                AssetImage(AssetsManager.locationIcon),
                              )),
                          SizedBox(
                            width: width * .01,
                          ),
                          Text(
                            AppLocalizations.of(context)!.choose_event_location,
                            style: AppStyle.medium16primary,
                          ),
                          Spacer(),
                          Icon(
                            Icons.navigate_next,
                            color: AppColors.primaryColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),

                    CustomElevatedBtn(
                        text: AppLocalizations.of(context)!.add_event,
                        onPressed: addEvent),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
   void addEvent(){

      if(_formKey.currentState?.validate()==true) {
        //addEvent to fireStore

    };
  }
  void showDate()async{
     var chooseDate=await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
     selectedDate=chooseDate;
     formattedDate=DateFormat("dd/MM/yyyy").format(selectedDate!);
    setState(() {

    });
  }
  void showTime()async{
    var chooseTime=await showTimePicker(context: context, initialTime: TimeOfDay.now());
    selectedTime=chooseTime;
    formattedTime=selectedTime?.format(context);
    setState(() {

    });
  }
}
