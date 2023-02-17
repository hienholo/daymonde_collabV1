import 'package:daymonde_collaboration/const/userData.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
 
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var element in users) {
      if (element.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(element.name);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var element in users) {
      if (element.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(element.name);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            onTap: () {
              query = matchQuery[index];
            },
            title: Text(result),
          );
        });
  }
}
