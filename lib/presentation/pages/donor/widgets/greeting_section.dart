import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/responsive_utils.dart';

/// Responsive greeting section that adapts to screen width
/// Changes layout from row to column on narrow screens
class ResponsiveGreetingSection extends StatelessWidget {
  final String userName;
  final String avatarUrl;

  const ResponsiveGreetingSection({
    super.key,
    required this.userName,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 400;
        final avatarSize = ResponsiveUtils.getResponsiveValue(
          context: context,
          mobile: 56.0,
          tablet: 72.0,
          desktop: 80.0,
        );

        if (isNarrow) {
          // Vertical layout for narrow screens
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAvatar(avatarSize),
              const SizedBox(height: 12),
              _buildGreetingText(context, TextAlign.center),
            ],
          );
        }

        // Horizontal layout for wider screens
        return Row(
          children: [
            _buildAvatar(avatarSize),
            SizedBox(
              width: ResponsiveUtils.getResponsiveValue(
                context: context,
                mobile: 16.0,
                tablet: 24.0,
                desktop: 32.0,
              ),
            ),
            Expanded(child: _buildGreetingText(context, TextAlign.start)),
          ],
        );
      },
    );
  }

  Widget _buildAvatar(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: 2),
        image: DecorationImage(
          image: NetworkImage(avatarUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildGreetingText(BuildContext context, TextAlign align) {
    final fontScale = ResponsiveUtils.getFontScale(context);

    return Column(
      crossAxisAlignment: align == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          '${AppStrings.greeting}, $userName!',
          textAlign: align,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize:
                (Theme.of(context).textTheme.headlineMedium?.fontSize ?? 24) *
                fontScale,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          AppStrings.greetingSubtitle,
          textAlign: align,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
