import 'package:flutter/material.dart';

class CustomMainTitle extends StatelessWidget {
  final String text;
  const CustomMainTitle(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: Theme.of(
      context,
    ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
  );
}

class CustomSectionTitle extends StatelessWidget {
  final String text;
  const CustomSectionTitle(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: Theme.of(
      context,
    ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
  );
}

class CustomBodyText extends StatelessWidget {
  final String text;
  const CustomBodyText(this.text, {super.key});
  @override
  Widget build(BuildContext context) =>
      Text(text, style: Theme.of(context).textTheme.bodyMedium);
}

class CustomMutedText extends StatelessWidget {
  final String text;
  const CustomMutedText(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
  );
}
