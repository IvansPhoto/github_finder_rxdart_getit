import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_finder_rxdart_getit/widgets.dart';
import 'package:github_finder_rxdart_getit/services.dart';

class SearchingUsersPage extends StatelessWidget {
  final _userNameService = getIt.get<UserService>();
  final _userNameKey = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('Index Page'), elevation: 0, centerTitle: true),
      body: Center(
        child: Form(
            autovalidate: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
              child: Column(
	            mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                      controller: _userNameKey,
                      decoration: const InputDecoration(hintText: 'Input a user name'),
                      validator: (value) {
                        return value.isEmpty ? 'Enter a user name here.' : null;
                      }),
                  FlatButton(
                      color: Theme.of(context).primaryColor,
                      disabledColor: Colors.grey[600],
                      disabledTextColor: Colors.grey[400],
                      onPressed: () {
                        if (_userNameKey.text != '') {
                          _userNameService.searchUsers(_userNameKey.text);
                          Navigator.pushNamed(context, RouteNames.users);
                        }
                      },
                      child: Text('Submit')),
                ],
              ),
            )),
      ),
    );
  }
}
