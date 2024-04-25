import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../style/colors.dart';
import '../style/elevation.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({
    super.key,
  });

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool nameFilter = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          nameFilter = !nameFilter;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: GrayScale.white,
          boxShadow: InnerShadow.dp2,
        ),
        child: SvgPicture.asset(
          nameFilter ? 'assets/icons/ic_text_format.svg' : 'assets/icons/ic_tag.svg',
          width: 16,
          height: 16,
          colorFilter: const ColorFilter.mode(
            Identity.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
