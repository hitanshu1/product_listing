import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colours/app_colors.dart';

/// Returns a `ThemeData` object based on the provided `isDark` parameter.
///
/// Parameters:
/// - `isDark`: A boolean value that determines the brightness of the theme.
///
/// Returns:
/// - A `ThemeData` object with the specified brightness, primary color, and various other theme properties.
ThemeData theme(bool isDark) {
 
  final WidgetStateProperty<Color?> _property =
      WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return null;
    }
    if (states.contains(WidgetState.selected)) {
      return AppColors.primaryColor(isDark);
    }
    return null;
  });
  final ThemeData data = isDark
      ? ThemeData.dark(useMaterial3: false)
      : ThemeData.light(useMaterial3: false); 
  return data.copyWith(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor(isDark),
    unselectedWidgetColor: AppColors.inactiveColor(isDark),
    colorScheme: ColorScheme(
      brightness: Brightness.light, 
      primary: AppColors.primaryColor(isDark), onPrimary: AppColors.textColor(isDark),
       secondary:  AppColors.secondaryColor(isDark), onSecondary: AppColors.inactiveColor(isDark), error: AppColors.error(isDark),
        onError:  AppColors.error(isDark), surface: AppColors.backgroundColor(isDark), onSurface: AppColors.secondaryColor(isDark)),
    appBarTheme: AppBarTheme(
      foregroundColor: AppColors.foregroundColor(isDark),
      color: AppColors.backgroundColor(isDark),
      
      centerTitle: false,
      titleTextStyle: TextStyle(
          fontSize: 23.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textColor(isDark)),
    ),
    switchTheme: SwitchThemeData(thumbColor: _property, trackColor: _property),
    radioTheme: RadioThemeData(fillColor: _property),
    checkboxTheme: CheckboxThemeData(fillColor: _property),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textColor(isDark), fontSize: 18.sp),
      bodyMedium:
          TextStyle(color: AppColors.textColor(isDark), fontSize: 16.sp),
      bodySmall: TextStyle(color: AppColors.textColor(isDark), fontSize: 14.sp),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: AppColors.foregroundColor(isDark),
        backgroundColor: AppColors.primaryColor(isDark)),
  );
}
