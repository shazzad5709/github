import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubdummy/widgets/alert_dialog_view.dart';
import 'package:githubdummy/widgets/app_bar_view.dart';
import 'package:githubdummy/widgets/check_box_view.dart';
import 'package:githubdummy/widgets/primary_button_view.dart';
import 'package:githubdummy/widgets/radio_view.dart';
import 'package:githubdummy/widgets/search_field_view.dart';
import 'package:githubdummy/widgets/secondary_button_view.dart';
import 'package:githubdummy/widgets/switch_view.dart';
import 'package:githubdummy/widgets/text_button_view.dart';
import 'package:githubdummy/widgets/text_field_view.dart';

enum SingingCharacter { lafayette, jefferson }

class WidgetTestScreen extends StatelessWidget {
  const WidgetTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> valueNotifier = ValueNotifier<bool>(false);
    final TextEditingController controller = TextEditingController();
    final _languages = [
      'English',
      'Spanish',
      'French',
      'German',
      'Chinese',
    ];

    int _selectedLanguageIndex = 0;

    final ValueNotifier<bool> _valueNotifier = ValueNotifier<bool>(false);
    final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

    return Scaffold(
      appBar: const AppBarView(
        title: 'Test',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                height: 32,
              ),
              PrimaryButtonView(
                text: 'Sign In with github'.toUpperCase(),
                onPressed: () {},
              ),
              const SizedBox(
                width: double.infinity,
                height: 16,
              ),
              SecondaryButtonView(
                text: 'Sign out from github'.toUpperCase(),
                onPressed: () {},
              ),
              const SizedBox(
                width: double.infinity,
                height: 16,
              ),
              SearchFieldView(
                hintText: 'Search',
              ),
              const SizedBox(
                width: double.infinity,
                height: 16,
              ),
              ValueListenableBuilder(
                valueListenable: valueNotifier,
                builder: (BuildContext context, bool value, Widget? child) {
                  return CheckboxView(
                    value: valueNotifier.value,
                    onChanged: (value) {
                      valueNotifier.value = value;
                    },
                    label: 'Hello',
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: valueNotifier,
                builder: (BuildContext context, bool value, Widget? child) {
                  return SwitchView(
                    value: valueNotifier.value,
                    onChanged: (value) {
                      valueNotifier.value = value;
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButtonView(
                      text: 'Star',
                      icon: CupertinoIcons.star,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              TextButtonView(
                text: 'Snacc',
                onPressed: () {},
              ),
              TextFieldView(
                labelText: 'Label',
                controller: controller,
              ),
              AlertDialogView(
                title: 'Alert',
                content: 'This is an alert dialog',
                onAcceptPressed: () {},
                onCancelPressed: () {},
              ),
              ValueListenableBuilder<int>(
                valueListenable: _selectedIndex,
                builder: (context, selectedIndex, _) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: _languages.length,
                    itemBuilder: (context, index) {
                      return RadioListTileView(
                        label: _languages[index],
                        value: (index == selectedIndex),
                        groupValue: true,
                        onChanged: (value) {
                          if (value) {
                            _selectedIndex.value = index;
                            print('Selected language: ${_languages[selectedIndex]}');
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
