import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_dimens.dart';
import '../../domain/entities/profile.dart';
import 'initial_avatar.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    required this.profile,
    this.query = '',
    this.onTap,
    super.key,
  });

  final Profile profile;
  final String query;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final String connectedThrough = profile.connectedThrough ?? '';
    final bool hasConnection = connectedThrough.isNotEmpty;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.lg),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InitialAvatar(name: profile.name),
              const SizedBox(width: AppDimens.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (_genderIcon != null) ...<Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: AppDimens.xs),
                            child: Icon(
                              _genderIcon,
                              size: AppDimens.iconSm,
                              color: _genderColor,
                            ),
                          ),
                          const SizedBox(width: AppDimens.xs),
                        ],
                        Expanded(
                          child: Text.rich(
                            TextSpan(children: _highlightedName),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimens.xs),
                    Text.rich(
                      TextSpan(children: _subtitleSpans),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppDimens.sm),
                    if (hasConnection)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 2,
                              right: AppDimens.xs,
                            ),
                            child: Icon(
                              Icons.link,
                              size: AppDimens.iconSm,
                              color: AppColors.primary,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              connectedThrough,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: AppDimens.fontSm,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: 2,
                              right: AppDimens.xs,
                            ),
                            child: Icon(
                              Icons.link_off,
                              size: AppDimens.iconSm,
                              color: AppColors.disabled,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'No connection yet',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: AppDimens.fontSm,
                                color: AppColors.textSecondary,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              if (onTap != null)
                const Padding(
                  padding: EdgeInsets.only(
                    left: AppDimens.sm,
                    top: AppDimens.xs,
                  ),
                  child: Icon(
                    Icons.chevron_right,
                    size: AppDimens.iconMd,
                    color: AppColors.disabled,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  IconData? get _genderIcon => switch (profile.gender) {
    'M' => Icons.male,
    'F' => Icons.female,
    _ => null,
  };

  Color get _genderColor =>
      profile.gender == 'F' ? AppColors.genderFemale : AppColors.genderMale;

  List<InlineSpan> get _highlightedName {
    const TextStyle base = TextStyle(
      fontSize: AppDimens.fontMd,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    );
    final String name = profile.name ?? 'Unknown name';
    return _highlightOccurrences(name, query, baseTextStyle: base);
  }

  List<InlineSpan> get _subtitleSpans {
    const TextStyle base = TextStyle(
      fontSize: AppDimens.fontSm,
      color: AppColors.textSecondary,
    );
    final List<InlineSpan> spans = <InlineSpan>[];
    final int? age = profile.age;
    final String? city = profile.city;

    if (age != null) {
      spans.add(TextSpan(text: '$age years', style: base));
    }
    if (age != null && city != null && city.isNotEmpty) {
      spans.add(const TextSpan(text: ' · ', style: base));
    }
    if (city != null && city.isNotEmpty) {
      spans.addAll(_highlightOccurrences(city, query, baseTextStyle: base));
    }
    if (spans.isEmpty) {
      spans.add(const TextSpan(text: 'No details', style: base));
    }
    return spans;
  }

  List<InlineSpan> _highlightOccurrences(
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
        spans.add(
          TextSpan(text: text.substring(cursor), style: baseTextStyle),
        );
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
}