import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0.0),
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      color: const Color(0xff353c49),
      onPressed: () {},
    );
  }
}

class CircularButton extends StatelessWidget {
  const CircularButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 291, 0, 100),
      child: SizedBox(
          width: 91,
          height: 48,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xffff9119),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: const Text(
              '완료',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'PretendardVariable',
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          )),
    );
  }
}

