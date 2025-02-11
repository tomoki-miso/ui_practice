import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_practice/apps/spotify/album.dart';
import 'package:ui_practice/styles/colors.dart';
import 'package:ui_practice/styles/size.dart';

class RecommendedTiles extends StatelessWidget {
  const RecommendedTiles({
    required this.album,
    super.key,
  });

  final Album album;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 16),
        child: SizedBox(
          width: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CachedNetworkImage(imageUrl: album.imageUrl),
                ),
              ),
              const Gap(AppSize.paddingS),
              Text(
                album.title,
                style:
                    const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                album.artist,
                style: const TextStyle(
                  color: AppColor.spWhiteGrey,
                  fontSize: 10,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );
}
