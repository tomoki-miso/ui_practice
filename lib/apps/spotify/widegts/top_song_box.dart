import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_practice/apps/spotify/album.dart';
import 'package:ui_practice/styles/colors.dart';
import 'package:ui_practice/styles/size.dart';

class TopSongsBox extends StatelessWidget {
  const TopSongsBox({
    required this.album,
    super.key,
  });

  final Album album;

  @override
  Widget build(BuildContext context) => Container(
        height: 64,
        width: 175,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColor.spGrey,
        ),
        child: Row(
          children: [
            SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(imageUrl: album.imageUrl),
              ),
            ),
            const Gap(AppSize.paddingS),
            Expanded(
              child: Text(
                album.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Gap(AppSize.paddingS),
          ],
        ),
      );
}
