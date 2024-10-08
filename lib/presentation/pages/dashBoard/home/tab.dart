import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import 'products/list.dart';
import 'searchBar.dart';

/// home tab
class HomeTab extends StatelessWidget {
  /// constructor
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding:  EdgeInsets.all(SizeConfig.spaceBetween),
      child: Column(
        children: [
          const HomeSearchBar(),
          SizeConfig.verticalSpace(),
          const Expanded(child: ProductGridItems()),
        ],
      ),
    );
    
  }
}
