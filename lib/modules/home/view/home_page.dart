import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testsuitmedia/l10n/l10n.dart';
import 'package:testsuitmedia/modules/greeting/greeting.dart';
import 'package:testsuitmedia/modules/home/home.dart';
import 'package:testsuitmedia/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _palindromeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _palindromeController.dispose();
    super.dispose();
  }

  void _onCheckPressed() {
    final value = _palindromeController.text;
    if (value.isEmpty) {
      _showDialog('Palindrome field is required.');
    } else {
      final isPalindrome = Utils.isPalindrome(value);
      _showDialog(isPalindrome ? 'isPalindrome' : 'not palindrome');
      _palindromeController.clear();
    }
  }

  void _showDialog(String message) {
    showDialog<void>(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(message),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/btn_add_photo.png',
                  width: 115,
                  height: 115,
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: context.l10n.name,
                  ),
                  autocorrect: false,
                  onChanged: (value) {
                    context.read<NameBloc>().add(NameChanged(value));
                  },
                ),
                const SizedBox(height: 22),
                TextField(
                  controller: _palindromeController,
                  decoration: InputDecoration(
                    hintText: context.l10n.palindrome,
                  ),
                  autocorrect: false,
                ),
                const SizedBox(height: 45),
                TextButton(
                  onPressed: _onCheckPressed,
                  child: Text(context.l10n.check.toUpperCase()),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    final state = context.read<NameBloc>().state;
                    if (state.isValid) {
                      Navigator.of(context).push(GreetingPage.route);
                    } else {
                      _showDialog('Name field is required.');
                    }
                  },
                  child: Text(context.l10n.next.toUpperCase()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
