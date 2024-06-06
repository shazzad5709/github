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
    return !viewModel.isInitialized
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: _buildAppBar(context),
            body: viewModel.isLoading
                ? const Center(
                    child: LoadingView(),
                  )
                : buildScreen(context),
            bottomNavigationBar: buildBottomNavigationBar(context),
          );
  }

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
