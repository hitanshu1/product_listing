import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Widgets/Widgets.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/models/product.dart';


/// common product card
class ProductCard extends StatelessWidget {
  /// product
  final ProductModel product;

  /// on tap
  final VoidCallback? onTap;


  /// constructor
  const ProductCard(
      {super.key,
      required this.product,
      this.onTap,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Cardd(
        child: Stack(
          children: [
            ViewAppImage(
              radius: SizeConfig.borderRadius,
              imageUrl: product.images?.first,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                    padding: EdgeInsets.all(10.sp),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colorz.black.withOpacity(.8),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Txt(
                          product.title,
                          color: Colorz.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        SizeConfig.verticalSpaceSmall(),
                        Txt(
                          product.price,
                          toCurrency: true,
                          color: Colorz.white,
                          fontSize: 15.sp,
                        ),
                      ],
                    )),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
