// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ui_practice/apps/spotify/widegts/chip.dart' as _i4;
import 'package:ui_practice/apps/spotify/widegts/recomended_tiles.dart' as _i2;
import 'package:ui_practice/apps/spotify/widegts/top_song_box.dart' as _i3;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'apps',
    children: [
      _i1.WidgetbookFolder(
        name: 'spotify',
        children: [
          _i1.WidgetbookFolder(
            name: 'widegts',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'RecommendedTiles',
                useCase: _i1.WidgetbookUseCase(
                  name: 'RecommendedTiles',
                  builder: _i2.recomendedTiles,
                ),
              ),
              _i1.WidgetbookLeafComponent(
                name: 'TopSongsBox',
                useCase: _i1.WidgetbookUseCase(
                  name: 'TopSongsBox',
                  builder: _i3.topSongBox,
                ),
              ),
            ],
          )
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'Column',
        useCase: _i1.WidgetbookUseCase(
          name: 'All Chips',
          builder: _i4.allChips,
        ),
      )
    ],
  ),
];
