import 'package:flutter/material.dart';
import 'package:github_finder_rxdart_getit/pages/LoadingScreen.dart';
import 'package:github_finder_rxdart_getit/services.dart';
import 'package:github_finder_rxdart_getit/widgets.dart';

class SearchUsersResultPage extends StatelessWidget {
  final _searchParameters = getIt.get<SearchParameters>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The Users have found'), elevation: 0, centerTitle: true),
      body: StreamBuilder(
          stream: _searchParameters.streamGHUResponse$,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return LoadingScreen();
            } else {
              final List<GitHubUsers> gitHubUsers = snapshot.data.users;
              return Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.navigate_before), onPressed: () {
                        _searchParameters.decreasePage();
                        _searchParameters.searchUsers(searchParameters: _searchParameters, context: context);
                      }),
                      IconButton(icon: Icon(Icons.navigate_next), onPressed: () {
                        _searchParameters.increasePage();
                        _searchParameters.searchUsers(searchParameters: _searchParameters, context: context);
                      }),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: gitHubUsers.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index > gitHubUsers.length - 1) {
                            return searchingButton(context);
                          } else {
                            return Card(
                              elevation: 0,
                              child: Row(
                                children: <Widget>[
                                  ImageUrlIndicator(url: gitHubUsers[index].avatarUrl),
                                  Container(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Login: ' + gitHubUsers[index].login),
                                      Text('Score: ' + gitHubUsers[index].score.toString()),
                                      FlatButton(
                                        onPressed: () {
                                          SearchParameters.getUserProfile(context: context, url: gitHubUsers[index].url);
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


