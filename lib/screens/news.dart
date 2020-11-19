import 'package:twitter_api/twitter_api.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  
  @override
  Widget build(BuildContext context) {
    tweets();
    return Container(
      
    );
  }
  
  Future tweets() async {

    String consumerApiKey = "iWhUBzn9SVGr1EBmEnA0pK5E8";
    String consumerApiSecret = "gxRZ9LJs8LTAtlhWPNp7bpMAmiO1ZRa90cOpncmI0ZmkuK0MGs";
    String accessToken = "1329028984613466113-s7czEe857YXKlP8BblgLw0HHcXB3CB";
    String accessTokenSecret = "Vpny7AcnsdOkoiwDOdIMv6QGEQ8UppYUsfMs4CNQokzbs";

    final _twitterOauth = new twitterApi(
      consumerKey: consumerApiKey,
      consumerSecret: consumerApiSecret,
      token: accessToken,
      tokenSecret: accessTokenSecret
    );

    Future twitterRequest = _twitterOauth.getTwitterRequest(
      "GET", 
      // Endpoint
      "statuses/user_timeline.json", 
      // The options for the request
      options: {
        "user_id": "1329028984613466113",
        "screen_name": "AashaBot",
        "count": "20",
        "trim_user": "true",
        "tweet_mode": "extended", // Used to prevent truncating tweets
      },
    );
    var res = await twitterRequest;

    // print(res.statusCode); 
    // print(res.body);

    var tweets = json.decode(res.body);
    print(tweets);
  }
}