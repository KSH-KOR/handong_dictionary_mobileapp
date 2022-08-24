import 'package:flutter/material.dart';
import 'package:hdict/enums/request_action.dart';
import 'package:hdict/theme/app_colors.dart';
import 'package:hdict/theme/text_theme.dart';
import 'package:hdict/utilities/helper_widgets.dart';
import 'package:hdict/widgets/buttons/request.dart';

import '../../widgets/my_appbar.dart';
import '../../widgets/textfield.dart';

class AddRequestView extends StatefulWidget {
  const AddRequestView({Key? key}) : super(key: key);

  @override
  State<AddRequestView> createState() => _AddRequestViewState();
}

class _AddRequestViewState extends State<AddRequestView> {
  late final TextEditingController _wordNameTextEditingController;
  late final TextEditingController _requestTextEditingController;

  @override
  void initState() {
    _wordNameTextEditingController = TextEditingController();
    _requestTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _wordNameTextEditingController.dispose();
    _requestTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                  child: Text(
                    '용어 추가 요청',
                    style: AppTextStyles.title5,
                  ),
                ),
              ),
              addVerticalSpace(30),
              SizedBox(
                height: 600,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '단어 이름',
                        style: AppTextStyles.body7,
                      ),
                      addVerticalSpace(15),
                      AppTextField(
                        textEditingController: _wordNameTextEditingController,
                        hintText: 'ex\) 한한',
                        maxLines: 1,
                      ),
                      addVerticalSpace(36),
                      const Text(
                        '내용',
                        style: AppTextStyles.body7,
                      ),
                      addVerticalSpace(15),
                      AppTextField(
                        height: 26,
                        textEditingController: _requestTextEditingController,
                        hintText: '내용을 입력해주세요.',
                      ),
                    ],
                  ),
                ),
              ),
              addVerticalSpace(30),
              SizedBox(
                width: 91,
                height: 48,
                child: RequestButton(
                  snackBarText: '용어 추가 요청이 완료되었습니다.',
                  requestAction: RequestAction.addRequest,
                  wordTextEditingController: _wordNameTextEditingController,
                  requestContentTextEditingController: _requestTextEditingController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
