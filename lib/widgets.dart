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

class ImageUrlIndicator extends StatelessWidget {
  final String url;
  final double height;
  final double width;

  ImageUrlIndicator({this.url, this.height = 100, this.width = 100});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: height,
      width: width,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes : null,
          ),
        );
      },
    );
  }
}

class SearchingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _searchParameters = getIt.get<SearchParameters>();
    print(_searchParameters.getPage);
    print(_searchParameters.currentGHUResponse.totalCount);
    print(_searchParameters.perPage);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.navigate_before),
          disabledColor: Colors.grey[250],
          color: Colors.red[800],
          onPressed: _searchParameters.getPage != 1 ? () {
            _searchParameters.decreasePage();
            _searchParameters.searchUsers(searchParameters: _searchParameters, context: context);
          } : null,
        ),
        Text('${_searchParameters.getPage} / ${_searchParameters.currentGHUResponse.totalCount ~/ _searchParameters.perPage}'),
        IconButton(
          icon: Icon(Icons.navigate_next),
          disabledColor: Colors.grey[250],
          color: Colors.red[800],
          onPressed: (_searchParameters.currentGHUResponse.totalCount / _searchParameters.perPage) != _searchParameters.getPage ? () {
            _searchParameters.increasePage();
            _searchParameters.searchUsers(searchParameters: _searchParameters, context: context);
          } : null,
        ),
      ],
    );
  }
}
