import 'package:flutter/material.dart';
import 'package:sossu/property/contest.dart';
import 'package:sossu/property/rooms.dart';

class ContestGridView extends StatefulWidget {
  const ContestGridView({Key? key, this.crossAxisCount = 2, this.itemHeight = 150, required this.roomList, required this.ontap}) : super(key: key);

  final int crossAxisCount;
  final double itemHeight;
  final RoomList roomList;
  final Function ontap;

  @override
  State<ContestGridView> createState() => _ContestGridViewState();
}

class _ContestGridViewState extends State<ContestGridView> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    const int crossAxisCount = 2;
    const double itemHeight = 150;
    final double itemWidth = size.width / crossAxisCount;
    
    return GridView.builder(
                shrinkWrap: true,
                itemCount: widget.roomList.length,
                controller: ScrollController(keepScrollOffset: false),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (itemWidth / itemHeight),
                    crossAxisCount: crossAxisCount),
                itemBuilder: (_, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => widget.ontap(index),
                        child: Container(
                          width: 100,
                          height: 170,
                          margin: const EdgeInsets.all(4.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 205, 205, 205)),
                          child: Center(
                            child: RoomBox(room: widget.roomList.room(atIndex: index)!)
                          ),
                        ),
                      ),
                    ],
                  );
                });
          
  }
}

class RoomBox extends StatefulWidget {
  const RoomBox({Key? key, required this.room}) : super(key: key);

  final Room room;

  @override
  State<RoomBox> createState() => _RoomBoxState();
}

class _RoomBoxState extends State<RoomBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(children: [
          Container(
            width: 50,
            height: 100,
            decoration: const BoxDecoration(color: Colors.grey),
            child: Text(widget.room.name),
          ),
          Container(
            width: 50,
            height: 25,
            decoration: const BoxDecoration(color: Colors.grey),
            child: Text(widget.room.description),
          ),
        ]),
      ),
    );
  }
}