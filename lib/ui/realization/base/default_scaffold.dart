import 'package:igce_theme/igce_theme.dart';

// class DefaultScaffold extends IgceScaffold {
//   const DefaultScaffold({
//     super.key,
//     required Widget body,
//     String? title,
//     PreferredSizeWidget? appBar,
//     Widget? floatingActionButton,
//     FloatingActionButtonLocation? floatingActionButtonLocation,
//   }) : super(
//             body: body,
//             title: title,
//             appBar: appBar,
//             floatingActionButton: floatingActionButton,
//             floatingActionButtonLocation: floatingActionButtonLocation);
// }

class DefaultScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Future<void> Function()? onReload;
  const DefaultScaffold({
    super.key,
    this.title = '',
    required this.body,
    this.appBar,
    this.actions,
    this.bottom,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          AppBar(
            title: Text(
              title,
              style: context.textTheme.defaultText18,
            ),
            // leading: IconButton(
            //     onPressed: () => Navigator.of(context).pop(),
            //     icon: Icon(Icons.arrow_back_ios_new_outlined,
            //         color: context.theme.colorScheme.onSecondary)),
            // foregroundColor: context.colorTheme.defaultTextColor,
            actions: actions,
            bottom: bottom,
          ),
      backgroundColor: context.colorTheme.backgroundAppColor,
      body: GestureDetector(
          onHorizontalDragUpdate: (details) {
            if (details.primaryDelta! > 10) {
              Navigator.of(context).pop();
            }
          },
          child: onReload != null
              ? LayoutBuilder(
                  builder: (context, constraints) {
                    return RefreshIndicator(
                      color: context.theme.primaryColor,
                      onRefresh: onReload!,
                      child: CustomScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: true,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: body,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : body),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation ??
          FloatingActionButtonLocation.centerFloat,
    );
  }
}
