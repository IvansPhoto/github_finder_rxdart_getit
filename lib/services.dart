import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart';
import 'package:get_it/get_it.dart';

abstract class RouteNames {
	static const String index = '/';
	static const String menu = '/menu';
	static const String users = '/users';
	static const String profile = '/profile';
	static const String loading = '/loading';
	static const String error = '/error';
}

GetIt getIt = GetIt.instance;

class GitHubUserResponse {
	int totalCount;
	bool incompleteResults;
	List<GitHubUsers> users;

	GitHubUserResponse({this.totalCount, this.incompleteResults, this.users});

	GitHubUserResponse.fromJson(Map<String, dynamic> json) {
		totalCount = json['total_count'];
		incompleteResults = json['incomplete_results'];
		if (json['items'] != null) {
			users = new List<GitHubUsers>();
			json['items'].forEach((v) {
				users.add(new GitHubUsers.fromJson(v));
			});
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total_count'] = this.totalCount;
		data['incomplete_results'] = this.incompleteResults;
		if (this.users != null) {
			data['items'] = this.users.map((v) => v.toJson()).toList();
		}
		return data;
	}
}

class GitHubUsers {
	String login;
	int id;
	String nodeId;
	String avatarUrl;
	String gravatarId;
	String url;
	String htmlUrl;
	String followersUrl;
	String followingUrl;
	String gistsUrl;
	String starredUrl;
	String subscriptionsUrl;
	String organizationsUrl;
	String reposUrl;
	String eventsUrl;
	String receivedEventsUrl;
	String type;
	bool siteAdmin;
	double score;

	GitHubUsers(
			{this.login,
				this.id,
				this.nodeId,
				this.avatarUrl,
				this.gravatarId,
				this.url,
				this.htmlUrl,
				this.followersUrl,
				this.followingUrl,
				this.gistsUrl,
				this.starredUrl,
				this.subscriptionsUrl,
				this.organizationsUrl,
				this.reposUrl,
				this.eventsUrl,
				this.receivedEventsUrl,
				this.type,
				this.siteAdmin,
				this.score});

	GitHubUsers.fromJson(Map<String, dynamic> json) {
		login = json['login'];
		id = json['id'];
		nodeId = json['node_id'];
		avatarUrl = json['avatar_url'];
		gravatarId = json['gravatar_id'];
		url = json['url'];
		htmlUrl = json['html_url'];
		followersUrl = json['followers_url'];
		followingUrl = json['following_url'];
		gistsUrl = json['gists_url'];
		starredUrl = json['starred_url'];
		subscriptionsUrl = json['subscriptions_url'];
		organizationsUrl = json['organizations_url'];
		reposUrl = json['repos_url'];
		eventsUrl = json['events_url'];
		receivedEventsUrl = json['received_events_url'];
		type = json['type'];
		siteAdmin = json['site_admin'];
		score = json['score'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['login'] = this.login;
		data['id'] = this.id;
		data['node_id'] = this.nodeId;
		data['avatar_url'] = this.avatarUrl;
		data['gravatar_id'] = this.gravatarId;
		data['url'] = this.url;
		data['html_url'] = this.htmlUrl;
		data['followers_url'] = this.followersUrl;
		data['following_url'] = this.followingUrl;
		data['gists_url'] = this.gistsUrl;
		data['starred_url'] = this.starredUrl;
		data['subscriptions_url'] = this.subscriptionsUrl;
		data['organizations_url'] = this.organizationsUrl;
		data['repos_url'] = this.reposUrl;
		data['events_url'] = this.eventsUrl;
		data['received_events_url'] = this.receivedEventsUrl;
		data['type'] = this.type;
		data['site_admin'] = this.siteAdmin;
		data['score'] = this.score;
		return data;
	}
}

class UserProfile {
	String login;
	int id;
	String nodeId;
	String avatarUrl;
	String gravatarId;
	String url;
	String htmlUrl;
	String followersUrl;
	String followingUrl;
	String gistsUrl;
	String starredUrl;
	String subscriptionsUrl;
	String organizationsUrl;
	String reposUrl;
	String eventsUrl;
	String receivedEventsUrl;
	String type;
	bool siteAdmin;
	String name;
	String company;
	String blog;
	String location;
	String email;
	bool hireable;
	String bio;
	int publicRepos;
	int publicGists;
	int followers;
	int following;
	String createdAt;
	String updatedAt;

	UserProfile(
			{this.login,
				this.id,
				this.nodeId,
				this.avatarUrl,
				this.gravatarId,
				this.url,
				this.htmlUrl,
				this.followersUrl,
				this.followingUrl,
				this.gistsUrl,
				this.starredUrl,
				this.subscriptionsUrl,
				this.organizationsUrl,
				this.reposUrl,
				this.eventsUrl,
				this.receivedEventsUrl,
				this.type,
				this.siteAdmin,
				this.name,
				this.company,
				this.blog,
				this.location,
				this.email,
				this.hireable,
				this.bio,
				this.publicRepos,
				this.publicGists,
				this.followers,
				this.following,
				this.createdAt,
				this.updatedAt});

	UserProfile.fromJson(Map<String, dynamic> json) {
		login = json['login'];
		id = json['id'];
		nodeId = json['node_id'];
		avatarUrl = json['avatar_url'];
		gravatarId = json['gravatar_id'];
		url = json['url'];
		htmlUrl = json['html_url'];
		followersUrl = json['followers_url'];
		followingUrl = json['following_url'];
		gistsUrl = json['gists_url'];
		starredUrl = json['starred_url'];
		subscriptionsUrl = json['subscriptions_url'];
		organizationsUrl = json['organizations_url'];
		reposUrl = json['repos_url'];
		eventsUrl = json['events_url'];
		receivedEventsUrl = json['received_events_url'];
		type = json['type'];
		siteAdmin = json['site_admin'];
		name = json['name'] == null || json['name'] == '' ? 'Name is not definied' : json['name'];
		company = json['company'] == null || json['company'] == '' ? 'Company is not definied' : json['company'];
		blog = json['blog'] == null || json['blog'] == '' ? 'Blog is not definied' : json['blog'];
		location = json['location'] == null || json['location'] == '' ? 'Location is not definied' : json['location'];
		email = json['email'] == null || json['email'] == '' ? 'Email is not definied' : json['email'];
		hireable = json['hireable'];
		bio = json['bio'] == null || json['bio'] == '' ? 'Bio is not definied' : json['bio'];
		publicRepos = json['public_repos'];
		publicGists = json['public_gists'];
		followers = json['followers'];
		following = json['following'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['login'] = this.login;
		data['id'] = this.id;
		data['node_id'] = this.nodeId;
		data['avatar_url'] = this.avatarUrl;
		data['gravatar_id'] = this.gravatarId;
		data['url'] = this.url;
		data['html_url'] = this.htmlUrl;
		data['followers_url'] = this.followersUrl;
		data['following_url'] = this.followingUrl;
		data['gists_url'] = this.gistsUrl;
		data['starred_url'] = this.starredUrl;
		data['subscriptions_url'] = this.subscriptionsUrl;
		data['organizations_url'] = this.organizationsUrl;
		data['repos_url'] = this.reposUrl;
		data['events_url'] = this.eventsUrl;
		data['received_events_url'] = this.receivedEventsUrl;
		data['type'] = this.type;
		data['site_admin'] = this.siteAdmin;
		data['name'] = this.name;
		data['company'] = this.company;
		data['blog'] = this.blog;
		data['location'] = this.location;
		data['email'] = this.email;
		data['hireable'] = this.hireable;
		data['bio'] = this.bio;
		data['public_repos'] = this.publicRepos;
		data['public_gists'] = this.publicGists;
		data['followers'] = this.followers;
		data['following'] = this.following;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		return data;
	}
}

class SearchParameters {
	String searchString;
	int page;
	int perPage;
	SearchParameters({this.searchString, this.page = 1, this.perPage = 5});

	set setString(String newSearchString) => searchString = newSearchString;
	set setPage(int newPage) => page = newPage;
	set setPerPage(int newPerPage) => perPage = newPerPage;

	void increasePage() => page++;
	void decreasePage() => page--;

	String get getSearchString => searchString;
	int get getPage => page;
	int get getPerPage => perPage;

	final _searchPageParams = BehaviorSubject<SearchParameters>();
	Stream get streamSearchParams$ => _searchPageParams.stream;
	SearchParameters get currentSearchParams => _searchPageParams.value;
	set setSearchParams(SearchParameters currentSearchParams) => _searchPageParams.add(currentSearchParams);

	final _gitHubUserResponse = BehaviorSubject<GitHubUserResponse>();
	Stream get streamGHUResponse$ => _gitHubUserResponse.stream;
	GitHubUserResponse get currentGHUResponse => _gitHubUserResponse.value;
	set setGHUResponse(GitHubUserResponse gitHubUserResponse) => _gitHubUserResponse.add(gitHubUserResponse);


	void searchUsers({@required BuildContext context, SearchParameters searchParameters}) async {
		setGHUResponse = null; //Set to null to make 'snapshot.hasData = false' in the page of search result.
		try {
			Response response =
			await get('https://api.github.com/search/users?q=${searchParameters.getSearchString}&per_page=${searchParameters.getPerPage}&page=${searchParameters.getPage}');
			GitHubUserResponse gitHubUserResponse = GitHubUserResponse.fromJson(jsonDecode(response.body));
			setGHUResponse = gitHubUserResponse;
		} catch (error) {
			print(error);
			Navigator.pushNamed(context, RouteNames.error, arguments: error); //Check error type.
		}
	}

	static void getUserProfile({BuildContext context, String url}) async {
		Navigator.pushNamed(context, RouteNames.loading); //Loading screen
		try {
			Response response = await get(url);
			UserProfile userProfile = UserProfile.fromJson(jsonDecode(response.body));
			Navigator.pushReplacementNamed(context, RouteNames.profile, arguments: userProfile);
		} catch (error) {
			print(error);
			Navigator.pushNamed(context, RouteNames.error, arguments: error); ////Check error type.
		}
	}
}
