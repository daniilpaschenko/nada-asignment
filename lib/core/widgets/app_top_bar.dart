import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../themes/app_colors.dart';
import '../themes/app_dimens.dart';

// Reusable, styled application bar used across every screen
// Renders a primary gradient with rounded bottom corners, an optional back
// button, a title with an optional subtitle and a set of leading/trailing
// actions. Fully adaptive: the content stretches with the available width
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    required this.title,
    this.subtitle,
    this.actions = const <Widget>[],
    this.showBackButton = true,
    this.toolbarHeight = AppDimens.appBarHeight,
    super.key,
  });

  final String title;
  final String? subtitle;
  final List<Widget> actions;
  final bool showBackButton;
  final double toolbarHeight;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.paddingOf(context).top;
    final GoRouter? router = GoRouter.maybeOf(context);
    final bool canGoBack =
        showBackButton && (router?.canPop() ?? Navigator.of(context).canPop());
    final VoidCallback onBack = router != null
        ? router.pop
        : () => Navigator.of(context).maybePop();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        height: toolbarHeight + topPadding,
        padding: EdgeInsets.only(top: topPadding),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              AppColors.appBarGradientStart,
              AppColors.appBarGradientEnd,
            ],
          ),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(AppDimens.radiusXl),
          ),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: AppColors.appBarShadow,
              blurRadius: AppDimens.appBarShadowBlur,
              offset: Offset(0, AppDimens.appBarShadowOffsetY),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(AppDimens.radiusXl),
          ),
          child: Stack(
            children: <Widget>[
              const Positioned(
                right: -AppDimens.xl,
                top: -AppDimens.xxl,
                child: _GlowOrb(size: AppDimens.appBarGlowLarge),
              ),
              const Positioned(
                right: AppDimens.appBarGlowSmall,
                bottom: -AppDimens.xxl,
                child: _GlowOrb(size: AppDimens.appBarGlowSmall, subtle: true),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.sm),
                child: Row(
                  children: <Widget>[
                    if (canGoBack)
                      AppTopBarAction(
                        icon: Icons.arrow_back_rounded,
                        onPressed: onBack,
                      )
                    else
                      const SizedBox(width: AppDimens.sm),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.md,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.onPrimary,
                                fontSize: AppDimens.fontLg,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.2,
                              ),
                            ),
                            if (subtitle != null) ...<Widget>[
                              const SizedBox(height: AppDimens.xs / 2),
                              Text(
                                subtitle!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColors.onPrimaryMuted,
                                  fontSize: AppDimens.fontXs,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    for (final Widget action in actions) ...<Widget>[
                      action,
                      const SizedBox(width: AppDimens.xs),
                    ],
                    const SizedBox(width: AppDimens.xs),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Circular, translucent icon button that matches the app bar styling.
class AppTopBarAction extends StatelessWidget {
  const AppTopBarAction({
    required this.icon,
    required this.onPressed,
    this.tooltip,
    super.key,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final Widget button = SizedBox(
      width: AppDimens.appBarIconButton,
      height: AppDimens.appBarIconButton,
      child: Icon(icon, size: AppDimens.iconMd, color: AppColors.onPrimary),
    );

    return Material(
      color: AppColors.overlaySubtle,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: tooltip == null
            ? button
            : Tooltip(message: tooltip!, child: button),
      ),
    );
  }
}

// Soft decorative circle that adds depth to the gradient background.
class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.size, this.subtle = false});

  final double size;
  final bool subtle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: subtle ? AppColors.appBarGlow : AppColors.overlaySubtle,
      ),
    );
  }
}
