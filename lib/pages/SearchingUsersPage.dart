import 'package:flutter/material.dart';
import 'package:github_finder_rxdart_getit/widgets.dart';
import 'package:github_finder_rxdart_getit/services.dart';

class SearchingUsersPage extends StatelessWidget {
//  final _userService = getIt.get<UserService>();
	final _searchParameters = getIt.get<SearchParameters>();
	final _formKey = GlobalKey<FormState>();
	final _userNameKey = TextEditingController();
	final _perPageKey = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			drawer: MainDrawer(),
			appBar: AppBar(title: Text('Index Page'), elevation: 0, centerTitle: true),
			body: Center(
				child: Form(
						key: _formKey,
						autovalidate: true, //How this relates to initialValue?
						child: Padding(
							padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
							child: Column(
								mainAxisSize: MainAxisSize.max,
								crossAxisAlignment: CrossAxisAlignment.stretch,
								children: <Widget>[
									TextFormField(
										keyboardType: TextInputType.text,
										controller: _userNameKey,
										decoration: const InputDecoration(hintText: 'Input a user name'),
										validator: (value) {
											return value.isEmpty ? 'Enter a user name here.' : null;
										},
									),
									TextFormField(
										keyboardType: TextInputType.number,
										controller: _perPageKey,
										decoration: const InputDecoration(hintText: 'Result per  page'),
//                    initialValue: '15',
										validator: (value) => value.isEmpty ? 'Enter a user name here.' : null,
										onSaved: (String value) {
											print(value);
										},
									),
									FlatButton(
										color: Theme.of(context).primaryColor,
										disabledColor: Colors.grey[600],
										disabledTextColor: Colors.grey[400],
										onPressed: () {
											if (_formKey.currentState.validate()) {
												_searchParameters.setString = _userNameKey.text; //Set search string to object.
												_searchParameters.searchUsers(searchParameters: _searchParameters, initSearch: true);
//												_userService.searchUsers(searchString: _userNameKey.text);
//												Navigator.pushNamed(context, RouteNames.users);
											}
										},
										child: Text('Submit'),
									),
								],
							),
						)),
			),
		);
	}
}
