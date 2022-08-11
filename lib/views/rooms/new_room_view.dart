import 'package:flutter/material.dart';

class NewRoomView extends StatefulWidget {
  const NewRoomView({Key? key}) : super(key: key);

  @override
  State<NewRoomView> createState() => _NewRoomViewState();
}

class _NewRoomViewState extends State<NewRoomView> {
  late final TextEditingController _name;
  late final TextEditingController _description;
  late final TextEditingController _resolution;

  @override
  void initState() {
    _name = TextEditingController();
    _description = TextEditingController();
    _resolution = TextEditingController();

    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(children: [
        InputFormWithTitle(
          title: '방 이름',
          textEditingController: _name,
        ),
        InputFormWithTitle(
          title: '방 내용',
          textEditingController: _description,
        ),
        InputFormWithTitle(
          title: '각오',
          textEditingController: _resolution,
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(_name.text);
          print(_description.text);
          print(_resolution.text);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class InputFormWithTitle extends StatefulWidget {
  const InputFormWithTitle(
      {Key? key, required this.title, required this.textEditingController})
      : super(key: key);

  final String title;
  final TextEditingController textEditingController;

  @override
  State<InputFormWithTitle> createState() => _InputFormWithTitleState();
}

class _InputFormWithTitleState extends State<InputFormWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title),
        TextField(
          controller: widget.textEditingController,
        ),
      ],
    );
  }
}
