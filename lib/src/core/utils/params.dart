import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class Params {
  final String languaje;
  final String category;

  Params({required this.languaje, required this.category});
}

enum CategoryType {
  general,
  business,
  entertainment,
  health,
  science,
  sports,
  technology
}

extension CategoryTypeExtension on CategoryType {
  String get categoryName {
    switch (this) {
      case CategoryType.general:
        return S.current.tGeneral;
      case CategoryType.business:
        return S.current.tBusiness;
      case CategoryType.entertainment:
        return S.current.tEntertainment;
      case CategoryType.health:
        return S.current.tHealth;
      case CategoryType.science:
        return S.current.tScience;
      case CategoryType.sports:
        return S.current.tSports;
      case CategoryType.technology:
        return S.current.tTechnology;
    }
  }

  IconData get categoryIcon {
    switch (this) {
      case CategoryType.general:
        return Icons.info_rounded;
      case CategoryType.business:
        return Icons.business_rounded;
      case CategoryType.entertainment:
        return Icons.tv_rounded;
      case CategoryType.health:
        return Icons.health_and_safety_outlined;
      case CategoryType.science:
        return Icons.science_rounded;
      case CategoryType.sports:
        return Icons.sports_football_rounded;
      case CategoryType.technology:
        return Icons.computer_rounded;
    }
  }
}
