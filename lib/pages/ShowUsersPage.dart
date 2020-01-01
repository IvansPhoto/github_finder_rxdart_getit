import 'package:flutter/material.dart';
import 'package:github_finder_rxdart_getit/pages/LoadingScreen.dart';
import 'package:github_finder_rxdart_getit/services.dart';

class ShowUsersPage extends StatelessWidget {
  final usersServiceGetIt = getIt.get<UserService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The Users have found'), elevation: 0, centerTitle: true),
      body: StreamBuilder(
          stream: usersServiceGetIt.streamAllUsers$,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData || usersServiceGetIt.isLoadingValue) {
              return LoadingScreen();
            } else {
              final List<GitHubUsers> gitHubUsers = snapshot.data.users;
              return Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.navigate_before), onPressed: () {}),
                      IconButton(icon: Icon(Icons.navigate_next), onPressed: () {}),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: gitHubUsers.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index > gitHubUsers.length - 1) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton(icon: Icon(Icons.navigate_before), onPressed: () {}),
                                IconButton(icon: Icon(Icons.navigate_next), onPressed: () {}),
                              ],
                            );
                          } else {
                            return Card(
                              elevation: 0,
                              child: Row(
                                children: <Widget>[
                                  Image.network(
                                    gitHubUsers[index].avatarUrl,
                                    height: 100,
                                    width: 100,
                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes : null,
                                        ),
                                      );
                                    },
                                  ),
                                  Container(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Login: ' + gitHubUsers[index].login),
                                      Text('Score: ' + gitHubUsers[index].score.toString()),
                                      FlatButton(
                                        onPressed: () {
                                          usersServiceGetIt.getUserProfile(snapshot.data.users[index].url);
                                          Navigator.pushNamed(context, RouteNames.profile);
                                        },
                                        child: Text('View profile'),
                                        color: Theme.of(context).primaryColor,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                        }),
                  ),
                ],
              );
            }
          }),
    );
  }
}
