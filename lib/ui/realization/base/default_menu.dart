import 'package:flutter/material.dart';
import 'package:igce_theme/extensions/extensions.dart';

class DefaultMenu extends StatelessWidget {
  final List<String> itemsTitle;
  final List<IconData> itemsIcon;
  final List<Function()?> onItemsSelected;
  const DefaultMenu({
    super.key,
    required this.itemsTitle,
    required this.itemsIcon,
    required this.onItemsSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(Icons.menu, color: context.colorTheme.defaultTextColor),
      onSelected: (value) {
        for (int i = 0; i < onItemsSelected.length; i++) {
          if (value == i && onItemsSelected[i] != null) {
            onItemsSelected[i]!();
          }
        }
      },
      itemBuilder: (context) => itemsTitle
          .map((item) => PopupMenuItem(
                value: itemsTitle.indexOf(item),
                child: Row(
                  children: [
                    Icon(itemsIcon[itemsTitle.indexOf(item)]),
                    const SizedBox(width: 15),
                    Text(item),
                  ],
                ),
              ))
          .toList(),
      color: context.colorTheme.backgroundWidgetColor,
      shadowColor: context.colorTheme.boxShadowColor,
      surfaceTintColor: context.colorTheme.defaultTransparentColor,
      constraints: const BoxConstraints(minWidth: 0),
      elevation: 6,

      offset: const Offset(0, -250), // Adjust offset to prevent overlap
      position: PopupMenuPosition.under,
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
