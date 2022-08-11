import 'package:flutter/material.dart';
import 'package:sossu/property/rooms.dart';
import 'package:sossu/widgets/room_gridview.dart';

class RoomListView extends StatefulWidget {
  const RoomListView({Key? key}) : super(key: key);

  @override
  State<RoomListView> createState() => _RoomListViewState();
}

class _RoomListViewState extends State<RoomListView> {
  late final RoomList roomList;

  @override
  void initState() {
    roomList = RoomList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RoomGridView(roomList: roomList,),
    );
  }
}