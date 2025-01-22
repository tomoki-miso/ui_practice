import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:ui_practice/styles/colors.dart';
import 'package:ui_practice/styles/size.dart';

class CalcHome extends HookConsumerWidget {
  const CalcHome({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = AudioPlayer();
    final formula = useState('0');
    final preFormula = useState('');

    String formatNum(double value) =>
        value % 1 == 0 ? value.toInt().toString() : value.toString();

    void appendFormula(String value) {
      const List<String> operators = ['+', '-', '×', '÷'];

      final bool isNotPreFormulaEmpty = preFormula.value.isNotEmpty;
      final bool isFormulaResult = double.tryParse(formula.value) != null;
      final bool isNewInputNumber = int.tryParse(value) != null;
      final bool isNewInputOperator = operators.contains(value);

      final bool shouldResetForNewInput =
          isNotPreFormulaEmpty && isFormulaResult && isNewInputNumber;

      if (formula.value == '0') {
        formula.value = '';
      }

      if (shouldResetForNewInput) {
        formula.value = '';
        preFormula.value = '';
      }

      if (value == '.') {
        final parts = formula.value.split(RegExp(r'[+\-×÷]'));
        final lastPart = parts.isNotEmpty ? parts.last : '';

        if (!lastPart.contains('.')) {
          formula.value += value;
        }
        return;
      }

      if (!isNewInputNumber && !isNewInputOperator && value != '.') {
        return;
      }

      formula.value += value;
    }

    void clearFormula() {
      formula.value = '0';
      preFormula.value = '';
    }

    void revertSign() {
      try {
        final String input = formula.value;
        if (input == '0') {
          return;
        }
        if (input.startsWith('(-') && input.endsWith(')')) {
          formula.value = input.substring(2, input.length - 1);
        }
        final double value = double.parse(input);
        formula.value = value.isNegative
            ? formatNum(value.abs())
            : '(-${formatNum(value)})';
      } on Exception {
        return;
      }
    }

    Future<double> nabeatsu(double value) async {
      if (value % 3 != 0 || value == 0) {
        return value;
      }
      await player.play(AssetSource('music/failure.mp3'));

      final List<int> numbers = [for (int i = 1; i <= 9; i++) i]..shuffle();
      return nabeatsu(value + numbers.first);
    }

    Future<void> calculate() async {
      try {
        final formatedFormula =
            formula.value.replaceAll('×', '*').replaceAll('÷', '/');
        final parser = Parser();
        final exp = parser.parse(formatedFormula);
        final contextModel = ContextModel();

        preFormula.value = formula.value;
        final tempResult = exp.evaluate(EvaluationType.REAL, contextModel);
        final result = await nabeatsu(tempResult);

        formula.value = formatNum(result);
      } on Exception {
        formula.value = 'Error';
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Icon(
          Icons.list,
          color: AppColor.caOrange,
          size: 32,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                preFormula.value,
                style: const TextStyle(
                  fontSize: 24,
                  color: AppColor.caGrey,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                formula.value,
                style: const TextStyle(fontSize: 56),
                maxLines: 1,
              ),
            ),
            Wrap(
              spacing: AppSize.paddingS,
              runSpacing: AppSize.paddingS,
              children: [
                CalcButton(
                  text: 'AC',
                  color: AppColor.caGrey,
                  onTap: clearFormula,
                ),
                CalcButton(
                  icon: Icons.cached_outlined,
                  color: AppColor.caGrey,
                  onTap: revertSign,
                ),
                CalcButton(
                  text: '%',
                  color: AppColor.caGrey,
                  onTap: () => appendFormula('%'),
                ),
                CalcButton(
                  text: '÷',
                  color: AppColor.caOrange,
                  onTap: () => appendFormula('÷'),
                ),
                CalcButton(
                  text: '9',
                  onTap: () => appendFormula('9'),
                ),
                CalcButton(
                  text: '8',
                  onTap: () => appendFormula('8'),
                ),
                CalcButton(
                  text: '7',
                  onTap: () => appendFormula('7'),
                ),
                CalcButton(
                  text: '×',
                  color: AppColor.caOrange,
                  onTap: () => appendFormula('×'),
                ),
                CalcButton(
                  text: '6',
                  onTap: () => appendFormula('6'),
                ),
                CalcButton(
                  text: '5',
                  onTap: () => appendFormula('5'),
                ),
                CalcButton(
                  text: '4',
                  onTap: () => appendFormula('4'),
                ),
                CalcButton(
                  text: '-',
                  color: AppColor.caOrange,
                  onTap: () => appendFormula('-'),
                ),
                CalcButton(
                  text: '3',
                  onTap: () => appendFormula('3'),
                ),
                CalcButton(
                  text: '2',
                  onTap: () => appendFormula('2'),
                ),
                CalcButton(
                  text: '1',
                  onTap: () => appendFormula('1'),
                ),
                CalcButton(
                  text: '+',
                  onTap: () => appendFormula('+'),
                  color: AppColor.caOrange,
                ),
                const CalcButton(
                  icon: Icons.calculate,
                ),
                CalcButton(
                  text: '0',
                  onTap: () => appendFormula('0'),
                ),
                CalcButton(
                  text: '.',
                  onTap: () => appendFormula('.'),
                ),
                CalcButton(
                  text: '=',
                  color: AppColor.caOrange,
                  onTap: calculate,
                ),
              ],
            ),
            const Gap(AppSize.paddingXL),
          ],
        ),
      ),
    );
  }
}

class CalcButton extends StatelessWidget {
  const CalcButton({
    this.onTap,
    this.text,
    this.icon,
    this.color = AppColor.caDarkGrey,
    super.key,
  });

  final String? text;
  final IconData? icon;
  final Color? color;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: 84,
          height: 84,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: text != null
              ? Center(
                  child: Text(
                    text!,
                    style: const TextStyle(fontSize: 32),
                  ),
                )
              : Icon(
                  icon,
                  color: Colors.white,
                  size: 42,
                ),
        ),
      );
}
