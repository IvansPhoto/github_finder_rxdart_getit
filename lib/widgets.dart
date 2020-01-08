import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  ImageUrlIndicator({this.url, this.height, this.width});

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: _searchParameters.getPage != 1
              ? () {
                  _searchParameters.decreasePage();
                  _searchParameters.searchUsers(searchParameters: _searchParameters, context: context);
                }
              : null,
        ),
        FlatButton(
          onPressed: () {
//						showModalBottomSheet(
//								context: context,
//								builder: (builder) {
//									return Container(
//										height: 50,
//										child: SetPage(),
//									);
//								});

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SetPage();
                  },
                  fullscreenDialog: true,
                ));
          },
          child: Text('${_searchParameters.getPage} / ${_searchParameters.currentGHUResponse.totalCount ~/ _searchParameters.perPage}'),
        ),
        IconButton(
          icon: Icon(Icons.navigate_next),
          onPressed: (_searchParameters.currentGHUResponse.totalCount / _searchParameters.perPage) != _searchParameters.getPage
              ? () {
                  _searchParameters.increasePage();
                  _searchParameters.searchUsers(searchParameters: _searchParameters, context: context);
                }
              : null,
        ),
      ],
    );
  }
}

class SetPage extends StatelessWidget {
  final _searchParameters = getIt.get<SearchParameters>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _setPageKey = TextEditingController(text: _searchParameters.getPage.toString());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
            autovalidate: true,
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Set the page number (current is ${_setPageKey.text}).'),
                TextFormField(
	                textAlign: TextAlign.center,
	                cursorColor: Colors.red[900],
                  controller: _setPageKey,
                  keyboardType: TextInputType.number,
                  onSaved: (data) => (_searchParameters.setPage = int.parse(data)),
                  validator: (data) => data.isEmpty ? 'Page Num.!' : null,
                ),
                FlatButton(
                  onPressed: () {
                    _searchParameters.setPage = int.parse(_setPageKey.text);
                    _searchParameters.searchUsers(context: context, searchParameters: _searchParameters);
                    Navigator.pop(context);
                  },
                  child: Text('Set'),
                )
              ],
            )),
      ),
    );
  }
}
