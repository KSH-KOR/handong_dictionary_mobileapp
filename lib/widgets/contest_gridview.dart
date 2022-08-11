import 'package:flutter/material.dart';
import 'package:sossu/property/contest.dart';

class ContestGridView extends StatefulWidget {
  const ContestGridView({Key? key, this.crossAxisCount = 2, this.itemHeight = 150, required this.contestList, required this.ontap}) : super(key: key);

  final int crossAxisCount;
  final double itemHeight;
  final ContestList contestList;
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
                itemCount: widget.contestList.length,
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
                            child: ContestBox(contest: widget.contestList.contest(atIndex: index)!)
                          ),
                        ),
                      ),
                    ],
                  );
                });
          
  }
}

class ContestBox extends StatefulWidget {
  const ContestBox({Key? key, required this.contest}) : super(key: key);

  final Contest contest;

  @override
  State<ContestBox> createState() => _ContestBoxState();
}

class _ContestBoxState extends State<ContestBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(children: [
          Container(
            width: 50,
            height: 100,
            decoration: const BoxDecoration(color: Colors.grey),
            child: widget.contest.image,
          ),
          Container(
            width: 50,
            height: 25,
            decoration: const BoxDecoration(color: Colors.grey),
            child: Text(widget.contest.title!),
          ),
        ]),
      ),
    );
  }
}