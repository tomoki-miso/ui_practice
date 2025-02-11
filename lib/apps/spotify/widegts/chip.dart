import 'package:flutter/material.dart';
import 'package:ui_practice/styles/colors.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class AllChip extends StatelessWidget {
  const AllChip({super.key});

  @override
  Widget build(BuildContext context) => Chip(
        label: const Text(
          'すべて',
          style: TextStyle(color: Colors.black),
        ),
        shape: const StadiumBorder(),
        side: const BorderSide(color: AppColor.spGreen),
        color: WidgetStateProperty.all(AppColor.spGreen),
      );
}

class MusicChip extends StatelessWidget {
  const MusicChip({super.key});

  @override
  Widget build(BuildContext context) => Chip(
        label: const Text(
          '音楽',
          style: TextStyle(color: Colors.white),
        ),
        shape: const StadiumBorder(),
        side: const BorderSide(color: AppColor.spGrey),
        color: WidgetStateProperty.all(AppColor.spGrey),
      );
}

class PodcastChip extends StatelessWidget {
  const PodcastChip({super.key});

  @override
  Widget build(BuildContext context) => Chip(
        label: const Text(
          'ポッドキャスト',
          style: TextStyle(color: Colors.white),
        ),
        shape: const StadiumBorder(),
        side: const BorderSide(color: AppColor.spGrey),
        color: WidgetStateProperty.all(AppColor.spGrey),
      );
}

class CustomChip extends StatelessWidget {
  const CustomChip({
    required this.label,
    required this.isSelected,
    super.key,
  });

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final bgColor = isSelected ? AppColor.spGreen : AppColor.spGrey;
    final txColor = isSelected ? Colors.black : Colors.white;
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: txColor),
      ),
      shape: const StadiumBorder(),
      side: BorderSide(color: bgColor),
      color: WidgetStateProperty.all(bgColor),
    );
  }
}

@widgetbook.UseCase(
  name: 'All Chips',
  type: Column,
)
Widget allChips(BuildContext context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AllChip(),
          const SizedBox(height: 8),
          const MusicChip(),
          const SizedBox(height: 8),
          const PodcastChip(),
          const SizedBox(height: 8),
          CustomChip(
            label: context.knobs.string(label: 'ラベル'),
            isSelected: context.knobs.boolean(label: '選択状態'),
          ),
        ],
      ),
    );
