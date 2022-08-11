import 'package:sossu/enums/category.dart';

class Room{
  final String name;
  final String description;
  final String resolution;
  final List<MyCategory> categories;

  Room({
    required this.name,
    required this.description,
    required this.resolution,
    required this.categories,
  });

}

class RoomList{
  RoomList._sharedInstance();
  static final RoomList _shared = RoomList._sharedInstance();
  factory RoomList() => _shared;

  final List<Room> _roomList = [
    Room(name: '제목', description: '방 내용', resolution: '각오', categories: []),
    Room(name: '제목', description: '방 내용', resolution: '각오', categories: []),
    Room(name: '제목', description: '방 내용', resolution: '각오', categories: []),
    Room(name: '제목', description: '방 내용', resolution: '각오', categories: []),
  ];

   int get length => _roomList.length;

  void add({required Room room}){
    _roomList.add(room);
  }

  void remove({required Room room}){
    _roomList.remove(room);
  }

  Room? room({required int atIndex}) =>
      length > atIndex ? _roomList[atIndex] : null;
  
}