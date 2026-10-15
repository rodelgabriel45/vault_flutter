import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_radii.dart';
import '../constants/app_sizes.dart';
import '../constants/app_spacing.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => _buildTheme(isDark: false);

  static ThemeData get darkTheme => _buildTheme(isDark: true);

  static ThemeData _buildTheme({required bool isDark}) {
    final primary = isDark ? AppColors.primaryDark : AppColors.primaryLight;

    final primaryContainer = isDark
        ? AppColors.primaryContainerDark
        : AppColors.primaryContainerLight;

    final onPrimary = isDark
        ? AppColors.onPrimaryDark
        : AppColors.onPrimaryLight;

    final accent = isDark ? AppColors.accentDark : AppColors.accentLight;

    final background = isDark
        ? AppColors.backgroundDark
        : AppColors.backgroundLight;

    final surface = isDark ? AppColors.surfaceDark : AppColors.surfaceLight;

    final surfaceSubtle = isDark
        ? AppColors.surfaceSubtleDark
        : AppColors.surfaceSubtleLight;

    final surfaceSelected = isDark
        ? AppColors.surfaceSelectedDark
        : AppColors.surfaceSelectedLight;

    final onSurface = isDark
        ? AppColors.onSurfaceDark
        : AppColors.onSurfaceLight;

    final muted = isDark
        ? AppColors.onSurfaceMutedDark
        : AppColors.onSurfaceMutedLight;

    final outline = isDark ? AppColors.outlineDark : AppColors.outlineLight;

    final outlineStrong = isDark
        ? AppColors.outlineStrongDark
        : AppColors.outlineStrongLight;

    final error = isDark ? AppColors.errorDark : AppColors.errorLight;

    final colorScheme = isDark
        ? ColorScheme.dark(
            primary: primary,
            onPrimary: onPrimary,
            primaryContainer: primaryContainer,
            onPrimaryContainer: onSurface,
            secondary: accent,
            onSecondary: background,
            secondaryContainer: surfaceSelected,
            onSecondaryContainer: onSurface,
            surface: surface,
            onSurface: onSurface,
            error: error,
            onError: background,
            outline: outline,
            outlineVariant: outlineStrong,
            surfaceTint: primary,
          )
        : ColorScheme.light(
            primary: primary,
            onPrimary: onPrimary,
            primaryContainer: primaryContainer,
            onPrimaryContainer: AppColors.primaryPressedLight,
            secondary: accent,
            onSecondary: onSurface,
            secondaryContainer: surfaceSelected,
            onSecondaryContainer: onSurface,
            surface: surface,
            onSurface: onSurface,
            error: error,
            onError: onPrimary,
            outline: outline,
            outlineVariant: outlineStrong,
            surfaceTint: primary,
          );

    final textTheme = AppTypography.build(colorScheme, mutedColor: muted);

    final borderRadius = BorderRadius.circular(AppRadii.radiusMd);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      dividerColor: outline,
      textTheme: textTheme,

      // App bar
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
      ),

      // Bottom navigation
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: primaryContainer,
        elevation: 0,
      ),

      // Icons
      iconTheme: IconThemeData(color: onSurface, size: AppSizes.iconSize),

      // Text fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceSubtle,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.textFieldHorizontalPadding,
          vertical: AppSizes.textFieldVerticalPadding,
        ),
        hintStyle: TextStyle(color: muted, fontSize: 14),
        labelStyle: TextStyle(color: muted, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: outlineStrong, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: error, width: 2),
        ),
      ),

      // Primary buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(64, AppSizes.primaryButtonHeight),
          backgroundColor: primary,
          foregroundColor: onPrimary,
          elevation: 0,
          textStyle: AppTypography.labelLarge,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
      ),

      // Secondary buttons
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(64, AppSizes.secondaryButtonHeight),
          foregroundColor: onSurface,
          side: BorderSide(color: outline),
          textStyle: AppTypography.labelLarge,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
      ),

      // Text actions
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          textStyle: AppTypography.labelLarge,
        ),
      ),

      // Tags and chips
      chipTheme: ChipThemeData(
        backgroundColor: surfaceSubtle,
        selectedColor: primaryContainer,
        disabledColor: surfaceSubtle,
        labelStyle: AppTypography.bodySmall.copyWith(color: onSurface),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.space3,
          vertical: AppSpacing.space1,
        ),
        side: BorderSide(color: outline),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.radiusPill),
        ),
      ),

      // Floating action button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: onPrimary,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.radiusLg),
        ),
      ),

      // Minimal dividers
      dividerTheme: DividerThemeData(color: outline, thickness: 1, space: 1),

      // Subtle, floating notifications
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: onSurface,
        contentTextStyle: TextStyle(color: background, fontSize: 14),
      ),
    );
  }
}
