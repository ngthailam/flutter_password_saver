import 'package:flutter/material.dart';
import 'package:flutter_password_saver/presentation/widget/primary_button.dart';
import 'package:flutter_svg/svg.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    Key? key,
    this.ctaText,
    this.onCtaPressed,
    this.description,
  }) : super(key: key);

  final String? description;
  final String? ctaText;
  final VoidCallback? onCtaPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/login.svg',
            height: 160,
            width: 160,
          ),
          const SizedBox(height: 32),
          if (description != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 16, left: 16),
              child: Text(
                description!,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          if (ctaText != null)
            PrimaryButton(
              margin: const EdgeInsets.symmetric(horizontal: 48),
              text: ctaText!,
              onPressed: onCtaPressed,
            ),
        ],
      ),
    );
  }
}
