import 'package:flutter/material.dart';
import 'package:hdict/services/cloud/models/cloud_dictionary.dart';
import 'package:hdict/theme/app_colors.dart';
import 'package:hdict/widgets/my_appbar.dart';

import '../../theme/text_theme.dart';
import '../../utilities/helper_widgets.dart';
import '../../widgets/buttons/dictionary_revise.dart';

class DictionaryCardView extends StatefulWidget {
  const DictionaryCardView({Key? key}) : super(key: key);

  @override
  State<DictionaryCardView> createState() => _DictionaryCardViewState();
}

class _DictionaryCardViewState extends State<DictionaryCardView> {
  @override
  Widget build(BuildContext context) {
    final dictionary =
        ModalRoute.of(context)!.settings.arguments as CloudDictionary;
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      backgroundColor: AppColors.whiteColor,
      appBar: const MyAppBar(hasActionButton: DictionaryReviseButton()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(29),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(
                dictionary.word,
                style: AppTextStyles.title3,
              ),
            ),
            addVerticalSpace(41),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: AppColors.searchBarColor),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 29),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '의미',
                        style: AppTextStyles.buttonText,
                      ),
                      addVerticalSpace(29),
                      Text(
                        dictionary.meaning,
                        style: AppTextStyles.body1.copyWith(
                            color: AppColors.textColorWith60Alpha),
                      ),
                      addVerticalSpace(26),
                      Text(
                        dictionary.subMeaning,
                        style: AppTextStyles.body8.copyWith(
                            color: AppColors.textColorWith60Alpha,
                            height: 1.8,
                            ),

                      ),
                      addVerticalSpace(82),
                      const Text(
                        '활용',
                        style: AppTextStyles.buttonText,
                      ),
                      addVerticalSpace(29),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: convertListStringToListText(
                            listString: convertMassTextToList(
                                massText: dictionary.uses)),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> convertMassTextToList(
    {required String massText, Pattern pattern = '*'}) {
  return massText.split(pattern);
}

List<Widget> convertListStringToListText(
    {required List<String> listString, double gap = 20}) {
  return listString
      .map(
        (text) => Column(
          children: [
            
            Text(
              text,
              style: AppTextStyles.body8
                  .copyWith(color: AppColors.textColorWith60Alpha),
            ),
            addVerticalSpace(gap),
          ],
        ),
      )
      .toList();
}
