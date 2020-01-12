import 'package:flutter/material.dart';
import 'package:github_finder_rxdart_getit/services.dart';
import 'package:github_finder_rxdart_getit/widgets.dart';

class UserProfilePage extends StatelessWidget {
	Widget _rowProperties(BuildContext context, String propertyName, String dataProperty) {
		return Column(
			children: <Widget>[
				Row(
					children: <Widget>[
						Text(propertyName, style: Theme.of(context).textTheme.display1),
						Text(dataProperty),
					],
				),
				Container(height: 1, color: Colors.grey, margin: EdgeInsets.symmetric(vertical: 3.5)),
			],
		);
	}
	Widget _listViewHorizontal(BuildContext context, String propertyName, String dataProperty) {
		return Column(
			mainAxisSize: MainAxisSize.min,
			children: <Widget>[
			  Container(
				  height: 25,
			    child: ListView(
			    	scrollDirection: Axis.horizontal,
			    	children: <Widget>[
			    		Text(propertyName, style: Theme.of(context).textTheme.display1),
			    		Text(dataProperty),
			    	],
			    ),
			  ),
				Container(height: 1, color: Colors.grey, margin: EdgeInsets.symmetric(vertical: 3.5)),
			],
		);
	}



	@override
	Widget build(BuildContext context) {
		UserProfile theUserProfile = ModalRoute.of(context).settings.arguments;
		return Scaffold(
			appBar: AppBar(elevation: 0, title: Text('The profile of ${theUserProfile.login}'), centerTitle: true),
			body: Padding(
					padding: const EdgeInsets.all(15.0),
					child: SingleChildScrollView(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.center,
							mainAxisSize: MainAxisSize.min,
							children: <Widget>[
								Hero(
									tag: theUserProfile.avatarUrl,
									child: ImageUrlIndicator(url: theUserProfile.avatarUrl),
								),
								Container(height: 6),
								_rowProperties(context, 'Login: ', theUserProfile.login),
								_rowProperties(context, 'Name: ', theUserProfile.name),
								_rowProperties(context, 'Followers: ', theUserProfile.followers.toString()),
								_rowProperties(context, 'Following: ', theUserProfile.following.toString()),
								_rowProperties(context, 'Email: ', theUserProfile.email),
								_rowProperties(context, 'Company: ', theUserProfile.company),
								_rowProperties(context, 'Hireable: ', theUserProfile.hireable.toString()),

								_listViewHorizontal(context, 'Page: ', theUserProfile.htmlUrl),
								Container(
									height: 25,
									child: ListView(
										scrollDirection: Axis.horizontal,
										children: <Widget>[
											Text('Blog: ', style: Theme.of(context).textTheme.display1),
											Text(theUserProfile.blog),
										],
									),
								),
								Container(height: 1, color: Colors.grey, margin: EdgeInsets.symmetric(vertical: 3.5)),
								Container(
									height: 25,
									child: ListView(
										scrollDirection: Axis.horizontal,
										children: <Widget>[
											Text('Biography: ', style: Theme.of(context).textTheme.display1),
											Text(theUserProfile.bio),
										],
									),
								),
//                Text('Biography: ', style: Theme.of(context).textTheme.display1),
//                Text(theUserProfile.bio),
							],
						),
					)),
		);
	}
}
