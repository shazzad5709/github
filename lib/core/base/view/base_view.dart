import 'package:flutter/material.dart';
import 'package:githubdummy/core/base/view_model/base_view_model.dart';
import 'package:githubdummy/core/di/locator.dart';
import 'package:githubdummy/core/themes/theme.dart';
import 'package:githubdummy/widgets/loading_view.dart';
import 'package:provider/provider.dart';

abstract class BaseView<T extends BaseViewModel> extends StatelessWidget {
  late final T viewModel;
  final Widget? child;
  final ThemeData _theme;
  final TextTheme _textTheme;

  BaseView({
    super.key,
    this.child,
  })  : _theme = _initTheme(),
        _textTheme = _initTheme().textTheme {
    viewModel = locator.get<T>();
  }

  static ThemeData _initTheme() {
    Brightness brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    ;
    return brightness == Brightness.dark ? AppTheme.darkTheme : AppTheme.lightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => viewModel,
      child: Consumer<T>(
        builder: _buildSafeArea,
      ),
    );
  }

  Widget _buildSafeArea(BuildContext context, T viewModel, Widget? child) {
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
      appBar: buildAppBar(context),
      body: _buildScaffoldBody(context, viewModel),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  Widget _buildScaffoldBody(BuildContext context, T viewModel) {
    return Stack(
      children: [
        buildScreen(context),
        Visibility(
          visible: viewModel.isLoading || !viewModel.isInitialized,
          child: const Center(child: LoadingView()),
        ),
      ],
    );
  }

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
  PreferredSizeWidget? buildAppBar(BuildContext context);

  @protected
  Widget buildScreen(BuildContext context);

  @protected
  Widget? buildBottomNavigationBar(BuildContext context) => null;

  @protected
  void showError(BuildContext context) {
    showSnackBar(context, viewModel.errorMessage ?? 'An error occurred');
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

  ThemeData get theme => _theme;
  TextTheme get textTheme => _textTheme;
}
