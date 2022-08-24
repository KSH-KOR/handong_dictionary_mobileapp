import 'package:flutter/material.dart';
import 'package:hdict/theme/app_colors.dart';
import 'package:hdict/utilities/helper_widgets.dart';
import 'package:provider/provider.dart';
import '../services/textfield_provider.dart';
import '../theme/text_theme.dart';
import '../widgets/buttons/category_select_list.dart';
import '../widgets/buttons/dictionary_add.dart';
import '../widgets/dictionary/dictionary_view.dart';
import '../widgets/my_appbar.dart';
import '../widgets/textfield.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController _textEditingController;
  bool isSearchMode = false;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TextFieldProvider>(context);
    final Object arg =
        ModalRoute.of(context)!.settings.arguments ?? false;
    
    isSearchMode = _textEditingController.text.isNotEmpty;
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      appBar: const MyAppBar(hasActionButton: DictionaryAddButton()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            addVerticalSpace(3),
            const Text(
              '무엇이 궁금한가요?',
              style: AppTextStyles.title2,
            ),
            addVerticalSpace(38),
            AppTextField(
              maxLines: 1,
              isAutoFocused: arg as bool,
              hasPrefixIcon: true,
              textEditingController: _textEditingController,
            ),
            addVerticalSpace(7),
            isSearchMode ? Container() : const CategorySelectButtonList(),
            addVerticalSpace(7),
            SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: DictionaryView(
                  textEditingController: _textEditingController,
                  isSearchMode: isSearchMode,
                ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.whiteColor,
    );
  }
}
