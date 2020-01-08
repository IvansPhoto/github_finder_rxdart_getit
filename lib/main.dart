import 'package:flutter/material.dart';
import 'package:github_finder_rxdart_getit/pages/ErrorScreen.dart';
import 'package:github_finder_rxdart_getit/pages/LoadingScreen.dart';
import 'package:github_finder_rxdart_getit/pages/SearchingUsersPage.dart';
import 'package:github_finder_rxdart_getit/pages/SearchUsersResultPage.dart';
import 'package:github_finder_rxdart_getit/pages/UserProfilePage.dart';
import 'services.dart';

void main() {
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
			iconTheme: IconThemeData(color: Colors.red[900]),
			brightness: Brightness.light,
			primaryColor: Colors.red[900],
			primarySwatch: Colors.blue,
			disabledColor: Colors.indigo[500],
			accentColor: Colors.cyan[700],
			backgroundColor: Colors.red,
			buttonTheme: ButtonThemeData(
				focusColor: Colors.indigo[200],
				highlightColor: Colors.indigoAccent,
				splashColor: Colors.red[500],
				buttonColor: Colors.red[900],
				disabledColor: Colors.grey[300],
				hoverColor: Colors.redAccent,
				textTheme: ButtonTextTheme.primary,
				colorScheme: ColorScheme(
						primary: Colors.red[900],
						primaryVariant: Colors.orange,
						secondary: Colors.orange[900],
						secondaryVariant: Colors.cyanAccent,
						surface: Colors.pinkAccent,
						background: Colors.purple[900],
						error: Colors.purpleAccent,
						onPrimary: Colors.amber[900],
						onSecondary: Colors.amber[200],
						onSurface: Colors.deepPurple[900],
						onBackground: Colors.purple,
						onError: Colors.brown[500],
						brightness: Brightness.light),
			),
			textTheme: TextTheme(
				title: TextStyle(fontSize: 20, color: Colors.orange),
				button: TextStyle(fontSize: 20, color: Colors.orange),
				body1: TextStyle(fontSize: 20, color: Colors.grey[800]),
				display1: TextStyle(fontSize: 35, color: Colors.red[500]),
			),
		),
		darkTheme: ThemeData(
			brightness: Brightness.dark,
			primaryColor: Colors.red[500],
			disabledColor: Colors.grey[200],
			buttonColor: Colors.red[900],
			accentColor: Colors.deepOrangeAccent,
			buttonTheme: ButtonThemeData(
				focusColor: Colors.indigo[200],
				highlightColor: Colors.indigoAccent,
				splashColor: Colors.red[500],
				buttonColor: Colors.red[900],
				disabledColor: Colors.grey[300],
				hoverColor: Colors.redAccent,
				textTheme: ButtonTextTheme.primary,
				colorScheme: ColorScheme(
						primary: Colors.red[900],
						primaryVariant: Colors.orange,
						secondary: Colors.orange[900],
						secondaryVariant: Colors.cyanAccent,
						surface: Colors.pinkAccent,
						background: Colors.purple[900],
						error: Colors.purpleAccent,
						onPrimary: Colors.amber[900],
						onSecondary: Colors.amber[200],
						onSurface: Colors.deepPurple[900],
						onBackground: Colors.purple,
						onError: Colors.brown[500],
						brightness: Brightness.light),
			),
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
