import 'package:flutter/material.dart';
import 'package:github_finder_rxdart_getit/services.dart';

class MainDrawer extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Drawer(
			elevation: 0,
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					AppBar(
						automaticallyImplyLeading: false,
						elevation: 0,
						centerTitle: true,
						title: Text('Title in the menu'),
					),
					FlatButton.icon(
						onPressed: () {
							Navigator.pushReplacementNamed(context, RouteNames.index);
						},
						icon: Icon(Icons.supervised_user_circle, size: 30),
						label: Text('Find user'),
					),
					FlatButton.icon(
						onPressed: () {
							Navigator.pushReplacementNamed(context, RouteNames.users);
						},
						icon: Icon(Icons.star, size: 30),
						label: Text('Selected users'),
					),
				],
			),
		);
	}
}

class MainAppBar extends AppBar {
	final String newTitle;

	MainAppBar({this.newTitle}) : super();

	@override
	PreferredSizeWidget build(BuildContext context) {
		return AppBar(elevation: 0, centerTitle: true, title: Text(newTitle));
	}
}
