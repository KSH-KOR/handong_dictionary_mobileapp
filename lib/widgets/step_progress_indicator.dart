import 'package:flutter/material.dart';
import 'package:hdict/theme/app_colors.dart';
import 'package:hdict/theme/text_theme.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CustomizedStepProgressIndicator extends StatelessWidget {
  const CustomizedStepProgressIndicator({Key? key, required this.totalSteps, required this.currentStep}) : super(key: key);

  final int totalSteps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('$currentStep/$totalSteps', style: AppTextStyles.body1.copyWith(color: AppColors.primaryColorWithAplpha),),
        StepProgressIndicator(
                    totalSteps: totalSteps,
                    currentStep: currentStep,
                    size: 10,
                    padding: 0,
                    selectedColor: AppColors.primaryColor,
                    selectedSize: 13,
                    unselectedColor: AppColors.primaryColorWithAplpha,
                    roundedEdges: const Radius.circular(10),
                  ),
      ],
    );
  }
}