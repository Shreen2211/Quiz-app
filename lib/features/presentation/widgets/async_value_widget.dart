import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T) builder;

  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return value.when(
      loading: () => const CircularProgressIndicator(),
      error: (e, s) => Text('Error: $e'),
      data: builder,
    );
  }
}
