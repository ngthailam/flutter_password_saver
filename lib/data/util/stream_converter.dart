import 'dart:async';

import 'package:flutter/foundation.dart';

/// Convert this [Listenable] to a [Stream].
extension ListenableToStream<T extends Listenable> on T {
  /// Convert this [Listenable] to a [Stream].
  Stream<T> toStream() => toStreamWithTransform<T, T>(this, (t) => t);
}

Stream<R> toStreamWithTransform<T extends Listenable, R>(
  T listenable,
  R Function(T) transform,
) {
  final controller = StreamController<R>();
  VoidCallback? listener;

  controller.onListen = () {
    try {
      final l = () => controller.add(transform(listenable));
      listenable.addListener(l);
      listener = l;
    } catch (_ /*Ignore*/) {
      controller.close();
    }
  };

  controller.onCancel = () {
    if (listener == null) {
      // addListener thrown error.
      return;
    }

    try {
      listenable.removeListener(listener!);
      listener = null;
    } catch (_ /*Ignore*/) {}
  };

  return controller.stream;
}
