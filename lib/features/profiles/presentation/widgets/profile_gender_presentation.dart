import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../domain/entities/profile.dart';

// UI presentation of the gender value, shared by the list tile and the
// details name header.
extension ProfileGenderPresentation on Profile {
  IconData? get genderIcon => switch (gender) {
    'M' => Icons.male,
    'F' => Icons.female,
    _ => null,
  };

  Color get genderColor =>
      gender == 'F' ? AppColors.genderFemale : AppColors.genderMale;
}
