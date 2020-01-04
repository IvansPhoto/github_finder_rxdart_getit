import 'package:flutter/material.dart';
//import 'package:github_finder_rxdart_getit/pages/LoadingScreen.dart';
import 'package:github_finder_rxdart_getit/services.dart';
import 'package:github_finder_rxdart_getit/widgets.dart';

class UserProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    UserProfile theUserProfile = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(elevation: 0, title: Text('The user profile'), centerTitle: true),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              ImageUrlIndicator(url: theUserProfile.avatarUrl, height: MediaQuery.of(context).size.width, width: MediaQuery.of(context).size.width),
              Text(theUserProfile.login),
              Text(theUserProfile.name),
              Text(theUserProfile.email),
              Text(theUserProfile.company),
              Text(theUserProfile.bio),
            ],
          )),
    );
  }

//  final usersServiceGetIt = getIt.get<UserService>();

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(elevation: 0, title: Text('The user profile'), centerTitle: true),
//      body: Padding(
//        padding: const EdgeInsets.all(15.0),
//        child: StreamBuilder(
//          stream: usersServiceGetIt.streamUserProfile$,
//          builder: (BuildContext context, AsyncSnapshot snapshot) {
//            if (!snapshot.hasData || usersServiceGetIt.isLoadingValue) {
//              return Center(child: LoadingScreen());
//            } else {
//              final UserProfile theUserProfile = snapshot.data;
//              return ListView(
//                children: <Widget>[
//                  ImageUrlIndicator(
//                    url: theUserProfile.avatarUrl,
//                    width: MediaQuery.of(context).size.width,
//                    height: MediaQuery.of(context).size.width,
//                  ),
//                  Text(theUserProfile.login),
//                  Text(theUserProfile.name),
//                  Text(theUserProfile.email),
//                  Text(theUserProfile.company),
//                  Text(theUserProfile.bio),
//                ],
//              );
//            }
//          },
//        ),
//      ),
//    );
//  }
}
