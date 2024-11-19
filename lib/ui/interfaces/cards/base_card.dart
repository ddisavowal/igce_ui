// import 'package:flutter/material.dart';
// import 'package:igce_theme/extensions/context_extension.dart';

// abstract class IgceCard extends StatelessWidget {
//   final String title;
//   final void Function()? onTap;

//   const IgceCard({super.key, required this.title, this.onTap});

//   TextStyle? getTextStyle(BuildContext context) {
//     return context.textTheme.defaultText14;
//   }

//   Widget? getLeading(BuildContext context) {
//     return null;
//   }

//   Widget getTrailing(BuildContext context) {
//     return Icon(
//       Icons.arrow_forward_ios_rounded,
//       color: context.colorTheme.defaultColor,
//       size: 17,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final BorderRadius borderRadius = BorderRadius.circular(10);

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//       child: Material(
//         // color: Colors.transparent,
//         color: context.colorTheme.backgroundWidgetColor,
//         borderRadius: borderRadius,

//         // child: Ink(
//         //   decoration: BoxDecoration(
//         //     color: context.colorTheme.backgroundWidgetColor,
//         //     borderRadius: borderRadius,
//         //     boxShadow: [
//         //       BoxShadow(
//         //         color: context.colorTheme.boxShadowColor,
//         //         offset: const Offset(0, 0), // X0 Y0
//         //         blurRadius: 6, // Blur 6
//         //         spreadRadius: 0, // Spread 0
//         //       ),
//         //     ],
//         //   ),
//         child: InkWell(
//           onTap: onTap,
//           borderRadius: borderRadius,
//           // radius: 10,
//           splashColor:
//               context.colorTheme.lightClickColor, // Цвет всплеска при нажатии
//           highlightColor: context.colorTheme.defaultTransparentColor,

//           // .colorTheme.whiteClickColor, // Цвет подсветки при нажатии

//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//             // decoration: BoxDecoration(
//             //   // borderRadius: borderRadius,
//             //   color: context.colorTheme.defaultTransparentColor,
//             //   boxShadow: [
//             //     BoxShadow(
//             //       color: context.colorTheme.boxShadowColor,
//             //       offset: const Offset(0, 0), // X0 Y0
//             //       blurRadius: 6, // Blur 6
//             //       spreadRadius: 0, // Spread 0
//             //     ),
//             //   ],
//             // ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 getLeading(context) == null
//                     ? const SizedBox(height: 0)
//                     : Padding(
//                         padding: const EdgeInsets.only(right: 15),
//                         child: getLeading(context),
//                       ),
//                 Expanded(
//                   child: Text(
//                     title,
//                     style: getTextStyle(context),
//                   ),
//                 ),
//                 getTrailing(context),
//               ],
//             ),
//           ),
//         ),
//         // ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:igce_theme/extensions/context_extension.dart';

abstract class IgceCard extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const IgceCard({super.key, required this.title, this.onTap});

  TextStyle? getTextStyle(BuildContext context) {
    return context.textTheme.defaultText14;
  }

  Widget? getLeading(BuildContext context) {
    return null;
  }

  Widget getTrailing(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios_rounded,
      color: context.colorTheme.defaultColor,
      size: 17,
    );
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(10);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: context.colorTheme.boxShadowColor,
              offset: const Offset(0, 0),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Material(
            color: context.colorTheme.backgroundWidgetColor,
            child: InkWell(
              onTap: onTap,
              splashColor: context.colorTheme.lightClickColor,
              highlightColor: context.colorTheme.defaultTransparentColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getLeading(context) == null
                        ? const SizedBox(height: 0)
                        : Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: getLeading(context),
                          ),
                    Expanded(
                      child: Text(
                        title,
                        style: getTextStyle(context),
                      ),
                    ),
                    getTrailing(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
