import 'package:flutter/material.dart';
import 'package:github_finder_rxdart_getit/pages/ErrorScreen.dart';
import 'package:github_finder_rxdart_getit/pages/LoadingScreen.dart';
import 'package:github_finder_rxdart_getit/pages/SearchingUsersPage.dart';
import 'package:github_finder_rxdart_getit/pages/SearchUsersResultPage.dart';
import 'package:github_finder_rxdart_getit/pages/UserProfilePage.dart';
import 'services.dart';

void main() {
	getIt.registerLazySingleton<UserService>(() => UserService());
	getIt.registerLazySingleton<SearchParameters>(() => SearchParameters());
	runApp(MaterialApp(
		initialRoute: RouteNames.index,
		routes: {
			RouteNames.index: (BuildContext context) => SearchingUsersPage(),
			RouteNames.users: (BuildContext context) => SearchUsersResultPage(),
			RouteNames.profile: (BuildContext context) => UserProfilePage(),
			RouteNames.loading: (BuildContext context) => LoadingScreen(),
			RouteNames.error: (BuildContext context) => ErrorScreen(),
		},
		theme: ThemeData(
			brightness: Brightness.light,
			primaryColor: Colors.red[900],
			accentColor: Colors.deepOrangeAccent,
			textTheme: TextTheme(
				title: TextStyle(fontSize: 20, color: Colors.orange),
				button: TextStyle(fontSize: 30, color: Colors.orange),
				body1: TextStyle(fontSize: 20, color: Colors.red[50]),
				display1: TextStyle(fontSize: 35, color: Colors.red[50]),
			),
		),
		darkTheme: ThemeData(
			brightness: Brightness.dark,
			primaryColor: Colors.red[900],
			accentColor: Colors.deepOrangeAccent,
			primaryTextTheme: TextTheme(),
			textTheme: TextTheme(
				title: TextStyle(fontSize: 20, color: Colors.orange),
				button: TextStyle(fontSize: 20, color: Colors.orange),
				body1: TextStyle(fontSize: 20, color: Colors.grey[50]),
				display1: TextStyle(fontSize: 25, color: Colors.red[500]),
			),
		),
		title: "The App",
	));
}
