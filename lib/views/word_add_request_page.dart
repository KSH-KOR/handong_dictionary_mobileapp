import 'package:flutter/material.dart';

import '../widgets/buttons.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(
          width: 9.47,
          height: 16.22,
          child: MyBackButton(),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            const Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: Text(
                  '용어 추가 요청',
                  style: TextStyle(
                    fontFamily: 'PretendardVariable',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 30, 24, 26),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '단어 이름',
                        style: TextStyle(
                          fontFamily: 'PretendardVariable',
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: SizedBox(
                      width: 327,
                      child: TextField(
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: Color(0xfff5f6f8),
                          border: OutlineInputBorder(),
                          hintText: 'ex\) 한한',
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.0)),
                            borderSide: BorderSide(
                                width: 1, color: Color(0xfff5f6f8)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.0)),
                            borderSide: BorderSide(
                                width: 1, color: Color(0xfff5f6f8)),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(21, 12, 0, 12),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 22),
                        child: Text(
                          '추가 사항',
                          style: TextStyle(
                            fontFamily: 'PretendardVariable',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 14,
                    ),
                    child: SizedBox(
                      width: 327,
                      child: TextField(
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: Color(0xfff5f6f8),
                          border: OutlineInputBorder(),
                          hintText: '내용을 입력해주세요.',
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                width: 1, color: Color(0xfff5f6f8)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                width: 1, color: Color(0xfff5f6f8)),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(25, 28, 0, 12),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null, //엔터 입력 -> 텍스트필드 증가
                      ),
                    ),
                  ),
                  Padding(
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
                              color: Colors.white,
                              fontFamily: 'PretendardVariable',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
