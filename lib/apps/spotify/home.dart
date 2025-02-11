import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ui_practice/apps/spotify/album.dart';
import 'package:ui_practice/apps/spotify/widegts/chip.dart';
import 'package:ui_practice/apps/spotify/widegts/recomended_tiles.dart';
import 'package:ui_practice/apps/spotify/widegts/top_song_box.dart';
import 'package:ui_practice/styles/colors.dart';
import 'package:ui_practice/styles/size.dart';

class SpotifyHome extends StatelessWidget {
  const SpotifyHome({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: AppColor.spBlack,
          title: SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height: 36,
                  width: 36,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.spGreen,
                  ),
                  child: const Center(child: Text('T')),
                ),
                const Gap(AppSize.paddingS),
                const AllChip(),
                const Gap(AppSize.paddingS),
                const MusicChip(),
                const Gap(AppSize.paddingS),
                const PodcastChip(),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.paddingM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(AppSize.paddingM),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final alubum in topAlbums)
                        TopSongsBox(album: alubum),
                    ],
                  ),
                  const Gap(24),
                  const Row(
                    children: [
                      SizedBox(
                        height: 56,
                        width: 56,
                        child: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            'https://thesongbards.com/wp2/wp-content/uploads/2024/03/TheSongbards_BandImage_ForWeb.jpg',
                          ),
                        ),
                      ),
                      Gap(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'のニューリリース',
                            style: TextStyle(color: AppColor.spWhiteGrey),
                          ),
                          Text(
                            'The Songbards',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(AppSize.paddingM),
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColor.spGrey,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://cf.mora.jp/contents/package/0000/00000175/0037/377/925/0037377925.200.jpg',
                          ),
                        ),
                        const Gap(12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap(AppSize.paddingS),
                              Text(
                                'シングル',
                                style: TextStyle(
                                  color: AppColor.spWhiteGrey,
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'リリアン/サンセベリア',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.more_horiz,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              Text(
                                'The Songbards',
                                style: TextStyle(
                                  color: AppColor.spWhiteGrey,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.add_circle_outline_outlined,
                                    color: AppColor.spWhiteGrey,
                                    size: 24,
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.play_circle_sharp,
                                    color: Colors.white,
                                    size: 36,
                                  ),
                                ],
                              ),
                              Gap(AppSize.paddingS),
                            ],
                          ),
                        ),
                        const Gap(12),
                      ],
                    ),
                  ),
                  const Gap(AppSize.paddingM),
                  const Text(
                    '本日のおすすめ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Gap(AppSize.paddingM),
                  SizedBox(
                    height: 210,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendedAlbums.length,
                      itemBuilder: (context, index) => RecommendedTiles(
                        album: recommendedAlbums[index],
                      ),
                    ),
                  ),
                  const Gap(AppSize.paddingXL),
                ],
              ),
            ),
          ),
        ),
      );
}
