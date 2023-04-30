import 'package:cracker/constants/constants.dart';
import 'package:cracker/models/user.dart';
import 'package:cracker/ui/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      Navigator.of(context).pop(HOME_PAGE);
    }
  }
}
