import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';

class CustomDrawerItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final IconData selectedIconData;
  final bool isSelected;
  final Function onTap;

  const CustomDrawerItem({
    Key? key,
    required this.title,
    required this.iconData,
    required this.selectedIconData,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0.0,
      contentPadding: EdgeInsets.zero,
      leading: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Icon(
          isSelected ? selectedIconData : iconData,
          color: isSelected ? Colors.red : kGreyColor,
        ),
      ),
      trailing: isSelected
          ? Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(16),
                ),
                color: Colors.red,
              ),
              width: 8,
              height: 45,
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : kGreyColor,
          fontSize: 16.0,
        ),
      ),
      onTap: () => onTap(),
    );
  }
}
