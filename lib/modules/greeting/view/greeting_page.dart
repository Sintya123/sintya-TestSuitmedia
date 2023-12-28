import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testsuitmedia/l10n/l10n.dart';
import 'package:testsuitmedia/modules/home/home.dart';
import 'package:testsuitmedia/modules/users/users.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({Key? key}) : super(key: key);
  static MaterialPageRoute<void> get route {
    return MaterialPageRoute(builder: (context) => const GreetingPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.greetingAppBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              context.l10n.welcome,
              style: const TextStyle(height: 3),
            ),
            BlocBuilder<NameBloc, NameState>(
              builder: (context, state) {
                return Text(
                  state.name,
                  style: Theme.of(context).textTheme.headline6,
                );
              },
            ),
            Expanded(
              child: Center(
                child: BlocBuilder<UsersBloc, UsersState>(
                  builder: (context, state) {
                    if (state.selected != null) {
                      return Text(
                        state.selected!.fullName,
                        style: Theme.of(context).textTheme.headline5,
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(UsersPage.route);
          },
          child: Text(context.l10n.chooseUser),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
