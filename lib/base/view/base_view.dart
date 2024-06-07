import 'package:flutter/material.dart';
import 'package:githubdummy/base/view_model/base_view_model.dart';
import 'package:githubdummy/widgets/app_bar_view.dart';
import 'package:githubdummy/widgets/loading_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../config/themes/theme.dart';

abstract class BaseView<T extends BaseViewModel> extends StatelessWidget {
  final T viewModel;
  final Widget? child;

  const BaseView({
    super.key,
    required this.viewModel,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => viewModel,
      child: Consumer<T>(
        builder: _buildScreen,
      ),
    );
  }

  Widget _buildScreen(BuildContext context, T viewModel, Widget? child) {
    if (viewModel.errorMessage != null) {
      return _buildError(context, viewModel.errorMessage!);
    }

    if (!viewModel.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return _buildSafeArea(context, viewModel);
  }

  Widget _buildSafeArea(BuildContext context, T viewModel) {
    return SafeArea(
      left: safeAreaLeft(),
      top: safeAreaTop(),
      right: safeAreaRight(),
      bottom: safeAreaBottom(),
      minimum: safeAreaMinimumPadding(),
      maintainBottomViewPadding: maintainBottomViewPadding(),
      child: wrapScaffoldWithSafeArea()
          ? _buildScaffold(context, viewModel)
          : _buildScaffoldBody(context, viewModel),
    );
  }

  Widget _buildScaffold(BuildContext context, T viewModel) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildScaffoldBody(context, viewModel),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  Widget _buildScaffoldBody(BuildContext context, T viewModel) {
    return viewModel.isLoading
        ? const Center(
            child: LoadingView(),
          )
        : buildScreen(context);
  }

  Widget _buildError(BuildContext context, String errorMessage) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getErrorTitle()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(errorMessage, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                viewModel.errorMessage!;
                viewModel.init();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  @protected
  String getErrorTitle() => 'Error';

  @protected
  bool safeAreaLeft() => true;

  @protected
  bool safeAreaTop() => true;

  @protected
  bool safeAreaRight() => true;

  @protected
  bool safeAreaBottom() => true;

  @protected
  EdgeInsets safeAreaMinimumPadding() => EdgeInsets.zero;

  @protected
  bool maintainBottomViewPadding() => false;

  @protected
  bool wrapScaffoldWithSafeArea() => true;

  @protected
  String appBarTitle() => '';

  @protected
  IconData? appBarLeadingIcon() => null;

  @protected
  void appBarLeadingOnPressed(BuildContext context) => context.pop();

  @protected
  List<Widget>? appBarActions(BuildContext context) => null;

  @protected
  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    return AppBarView(
      title: appBarTitle(),
      leading: appBarLeadingIcon(),
      onPressed: () => appBarLeadingOnPressed(context),
      actions: appBarActions(context),
    );
  }

  @protected
  Widget buildScreen(BuildContext context);

  @protected
  Widget? buildBottomNavigationBar(BuildContext context) => null;

  @protected
  Widget buildDismissKeyboard(BuildContext context, Widget child) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }

  @protected
  void showSnackBar(BuildContext context, String message,
      {Duration duration = const Duration(seconds: 2)}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
      ),
    );
  }

  /// THEME
  @protected
  ThemeData getTheme(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark ? AppTheme.darkTheme : AppTheme.lightTheme;
  }

  @protected
  TextTheme getTextTheme(BuildContext context) => getTheme(context).textTheme;

  @protected
  ColorScheme getColorScheme(BuildContext context) => getTheme(context).colorScheme;

  @protected
  IconThemeData getIconTheme(BuildContext context) => getTheme(context).iconTheme;

  @protected
  AppBarTheme getAppBarTheme(BuildContext context) => getTheme(context).appBarTheme;

  @protected
  ButtonThemeData getButtonTheme(BuildContext context) => getTheme(context).buttonTheme;

  @protected
  CheckboxThemeData getCheckboxTheme(BuildContext context) => getTheme(context).checkboxTheme;

  @protected
  InputDecorationTheme getInputDecorationTheme(BuildContext context) =>
      getTheme(context).inputDecorationTheme;

  @protected
  ElevatedButtonThemeData getElevatedButtonTheme(BuildContext context) =>
      getTheme(context).elevatedButtonTheme;

  @protected
  OutlinedButtonThemeData getOutlinedButtonTheme(BuildContext context) =>
      getTheme(context).outlinedButtonTheme;

  @protected
  TextButtonThemeData getTextButtonTheme(BuildContext context) => getTheme(context).textButtonTheme;

  @protected
  DividerThemeData getDividerTheme(BuildContext context) => getTheme(context).dividerTheme;

  @protected
  IconButtonThemeData getIconButtonTheme(BuildContext context) => getTheme(context).iconButtonTheme;

  @protected
  RadioThemeData getRadioTheme(BuildContext context) => getTheme(context).radioTheme;

  @protected
  SwitchThemeData getSwitchTheme(BuildContext context) => getTheme(context).switchTheme;

  @protected
  FloatingActionButtonThemeData getFloatingActionButtonTheme(BuildContext context) =>
      getTheme(context).floatingActionButtonTheme;

  @protected
  NavigationBarThemeData getNavigationBarTheme(BuildContext context) =>
      getTheme(context).navigationBarTheme;

  @protected
  SearchBarThemeData getSearchBarTheme(BuildContext context) => getTheme(context).searchBarTheme;
}
