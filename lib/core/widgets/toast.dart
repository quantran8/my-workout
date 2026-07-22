import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../theme/tokens.dart';

part 'toast.g.dart';

/// Current toast message, or null when nothing is showing.
///
/// Held in Riverpod rather than an [Overlay] so a toast can be raised from a
/// controller or a validation guard without a [BuildContext].
@riverpod
class Toast extends _$Toast {
  Timer? _timer;

  @override
  String? build() {
    ref.onDispose(() => _timer?.cancel());
    return null;
  }

  void show(String message) {
    state = message;
    _timer?.cancel();
    _timer = Timer(AppMotion.toastVisible, () => state = null);
  }

  void hide() {
    _timer?.cancel();
    state = null;
  }
}

/// Raises a toast from anywhere with a [WidgetRef].
void showAppToast(WidgetRef ref, String message) =>
    ref.read(toastProvider.notifier).show(message);

/// Renders the active toast as a bottom-anchored white pill that slides up and
/// fades in. Mount once, above the app's content.
class ToastHost extends ConsumerWidget {
  const ToastHost({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(toastProvider);
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return Scaffold(
      body: Stack(
        children: [
          child,
          Positioned(
            left: 20,
            right: 20,
            bottom: 28 + bottomInset,
            child: IgnorePointer(
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 300),
                curve: AppMotion.enterCurve,
                offset: message == null ? const Offset(0, 0.6) : Offset.zero,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: message == null ? 0 : 1,
                  child: _ToastPill(message: message),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ToastPill extends StatelessWidget {
  const _ToastPill({required this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadii.button),
        boxShadow: const [
          BoxShadow(color: Color(0x40000000), blurRadius: 24, offset: Offset(0, 8)),
        ],
      ),
      child: Text(
        // Keep the last message during the fade-out so the text doesn't vanish
        // a frame before the pill does.
        message ?? '',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
