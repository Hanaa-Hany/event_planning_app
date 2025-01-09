import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../firbase_utils.dart';
import '../model/event.dart';

class EventProvider extends ChangeNotifier{
  //data
  List<Event>eventList=[];
  int selectedIndex = 0;
  List <Event> filterEventList=[];
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
  //function

  void getEventFromFireStore()async{
    var querySnap=await FirebaseUtils.getFireStoreCollection()
        .orderBy("dateTime",descending: false).get();
    eventList=querySnap.docs.map((doc){
      return doc.data();
    }).toList();
    print("test");
    filterEventList=eventList;
    notifyListeners();
  }

  //order data (Sorting)

void filterEvent()async{
  var querySnap=await FirebaseUtils.getFireStoreCollection().where("eventName",isEqualTo: categoriesList[selectedIndex])
      .orderBy("dateTime",descending: false).get();
  filterEventList=querySnap.docs.map((doc){
    print(doc.data());
    return doc.data();

  }).toList();

  print("test");
  notifyListeners();

}

void changeSelectedIndex(int newSelectedIndex){
    selectedIndex=newSelectedIndex;
    print(" TEEEEEEEEEEEEEEST : $selectedIndex");
    if(selectedIndex==0){
      getEventFromFireStore();
    }else{
      filterEvent();
    }


}
}