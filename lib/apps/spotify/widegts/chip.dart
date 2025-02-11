import 'package:flutter/material.dart';
import 'package:ui_practice/styles/colors.dart';

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
