import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/model/event.dart';

class FirebaseUtils {

  static CollectionReference<Event> getFireStoreCollection(){
    return FirebaseFirestore.instance.collection(Event.collectionName)
        .withConverter<Event>(
      fromFirestore: (snapshot, _) => Event.fromFireStore(snapshot,_),
      toFirestore: (event, _) => event.toFireStore(Event, SetOptions),
    );

  }
  static Future<void> addEventToFireStore(event){
    event.id=getFireStoreCollection().doc().id;
    return getFireStoreCollection().doc().set(event);
  }

  //firebase deal with json but developer deal with object
// so if i want to read data from fireStore i should convert json to object
}