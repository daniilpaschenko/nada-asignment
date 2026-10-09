import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';

// Splits [text] into spans, highlighting every case-insensitive occurrence of
// [search] with a background. Falls back to plain [text] when search is empty.
List<InlineSpan> highlightOccurrences(
  String text,
  String search, {
  required TextStyle baseTextStyle,
}) {
  final String trimmedSearch = search.trim();
  if (trimmedSearch.isEmpty) {
    return <InlineSpan>[TextSpan(text: text, style: baseTextStyle)];
  }

  final String lowerText = text.toLowerCase();
  final String lowerSearch = trimmedSearch.toLowerCase();
  final List<InlineSpan> spans = <InlineSpan>[];
  final TextStyle highlight = baseTextStyle.merge(
    const TextStyle(
      backgroundColor: AppColors.searchHighlightBackground,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w700,
    ),
  );

  int cursor = 0;
  while (cursor < text.length) {
    final int match = lowerText.indexOf(lowerSearch, cursor);
    if (match == -1) {
      spans.add(TextSpan(text: text.substring(cursor), style: baseTextStyle));
      break;
    }
    if (match > cursor) {
      spans.add(
        TextSpan(text: text.substring(cursor, match), style: baseTextStyle),
      );
    }
    spans.add(
      TextSpan(
        text: text.substring(match, match + lowerSearch.length),
        style: highlight,
      ),
    );
    cursor = match + lowerSearch.length;
  }
  return spans;
}
