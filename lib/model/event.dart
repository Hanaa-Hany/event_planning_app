import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  static const String collectionName = "Events";
  String? id;
  String? eventName;
  String? title;
  String? description;
  DateTime? dateTime;
  String? time;
  bool? isFav;
  String? image;

  Event(
      {this.id="",
      required this.eventName,
      required this.title,
      required this.description,
      required this.dateTime,
      required this.time,
      this.isFav=false,
      required this.image});

  Event.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> data, SnapshotOptions)
      : this(
          id: data["id"] as String?,
          eventName: data['eventName'] as String?,
          title: data["title"] as String?,
          isFav: data['isFav'] as bool?,
          description: data["desc"] as String?,
          dateTime: data['dateTime'] != null
              ? DateTime.fromMillisecondsSinceEpoch(data['dateTime'])
              : null,
          time: data["time"] as String?,
          image: data['image'] as String?,
        );

  Map<String, Object?> toFireStore(Event, SetOptions) {
    return {
      'id': id,
      'eventName': eventName,
      'title': title,
      'desc': description,
      'dateTime': dateTime?.millisecondsSinceEpoch,
      'time': time,
      'isFav': isFav,
      'image': image
    };
  }
}
