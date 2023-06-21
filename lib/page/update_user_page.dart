import 'package:flutter/material.dart';

class UpdateUserPage extends StatelessWidget {
  static String routeName = '/update_user';
  const UpdateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
    );
  }
}
