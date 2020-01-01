import 'package:flutter/material.dart';
import 'package:github_finder_rxdart_getit/pages/LoadingScreen.dart';
import 'package:github_finder_rxdart_getit/services.dart';

class UserProfilePage extends StatelessWidget {
  final usersServiceGetIt = getIt.get<UserService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: Text('The user profile'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: StreamBuilder(
          stream: usersServiceGetIt.streamUserProfile$,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData || usersServiceGetIt.isLoadingValue) {
              return Center(child: LoadingScreen());
            } else {
              final UserProfile theUserProfile = snapshot.data;
              return ListView(
                children: <Widget>[
                  Image.network(
                    theUserProfile.avatarUrl,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes : null,
                        ),
                      );
                    },
                  ),
                  Text(theUserProfile.login),
                  Text(theUserProfile.name),
                  Text(theUserProfile.email),
                  Text(theUserProfile.company),
                  Text(theUserProfile.bio),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
