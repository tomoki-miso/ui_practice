import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'model.g.dart';

abstract interface class RepositoryInterface {
  String get cache;
  void updateCache(String value);
}

@Riverpod(keepAlive: true)
RepositoryInterface repositoryAlive(Ref ref) => Repository();

@riverpod
String cacheAlive(Ref ref) => ref.read(repositoryAliveProvider).cache;

@Riverpod(keepAlive: true)
// String cacheAlive2(Ref ref) => Repository().cache;
String cacheAlive2(Ref ref) => ref.read(repositoryDisposeProvider).cache;

@riverpod
RepositoryInterface repositoryDispose(Ref ref) => Repository();

class Repository implements RepositoryInterface {
  String _cache = 'cache';
  @override
  String get cache => _cache;
  @override
  void updateCache(String value) {
    _cache = value;
  }
}

class AliveScreen extends ConsumerWidget {
  const AliveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: const Text('Alive Screen'),
        ),
        body: ListView(
          children: [
            ElevatedButton(
              onPressed: () async {
                ref
                    .read(repositoryDisposeProvider)
                    .updateCache('updated cache');
                await Future.delayed(const Duration(microseconds: 11));
                log(ref.read(repositoryDisposeProvider).cache);
              },
              child: const Text('Update Cache'),
            ),
            ElevatedButton(
              onPressed: () async {
                ref.read(repositoryAliveProvider).updateCache('updated cache');
                await Future.delayed(const Duration(seconds: 1));

                log(ref.read(repositoryAliveProvider).cache);
              },
              child: const Text('Update Cache'),
            ),
            ElevatedButton(
              onPressed: () async {
                final cache = ref.read(cacheAliveProvider);
                log(cache);

                ref.read(repositoryAliveProvider).updateCache('updated cache');
                await Future.delayed(const Duration(seconds: 1));

                final cache2 = ref.read(cacheAliveProvider);
                log(cache2);
                ref.invalidate(cacheAliveProvider);
                await Future.delayed(const Duration(seconds: 1));

                final cache3 = ref.read(cacheAliveProvider);
                log(cache3);
              },
              child: const Text('Update Cache'),
            ),
            ElevatedButton(
              onPressed: () async {
                final cache = ref.read(cacheAlive2Provider);
                log(cache);

                ref.read(repositoryAliveProvider).updateCache('updated cache');
                await Future.delayed(const Duration(seconds: 1));

                final cache2 = ref.read(cacheAlive2Provider);
                log(cache2);
                ref.invalidate(cacheAlive2Provider);
                await Future.delayed(const Duration(seconds: 1));

                final cache3 = ref.read(cacheAlive2Provider);
                log(cache3);
              },
              child: const Text('Update Cache'),
            ),
          ],
        ),
      );
}
