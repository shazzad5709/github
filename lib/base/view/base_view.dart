import 'package:flutter/material.dart';
import 'package:githubdummy/base/view_model/base_view_model.dart';
import 'package:githubdummy/widgets/app_bar_view.dart';
import 'package:githubdummy/widgets/loading_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
}
