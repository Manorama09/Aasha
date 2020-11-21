import 'package:twitter_api/twitter_api.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List data;

  @override
  void initState() {
    this.tweets();
  }

  @override
  Widget build(BuildContext context) {
    tweets();
    return Scaffold(
      backgroundColor: const Color(0xffF4EEFF),
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: const Color(0xffF4EEFF),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(90,0,0,0),
          child: Text("News",
              style: GoogleFonts.dancingScript(
                  color: const Color(0xff1E2558),
                  fontSize: 35,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      body: new ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, i) {
            return Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration:
                      BoxDecoration(color:const Color(0xffB180FE).withOpacity(0.5)),
                  child: new ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    title: new Text(data[i]["id_str"]),
                    subtitle: new Text(data[i]["full_text"]),
                    onTap: () => _launchURL(i, context),
                  ),
                ));
          }),
    );
  }

  Future tweets() async {
    String consumerApiKey = "iWhUBzn9SVGr1EBmEnA0pK5E8";
    String consumerApiSecret =
        "gxRZ9LJs8LTAtlhWPNp7bpMAmiO1ZRa90cOpncmI0ZmkuK0MGs";
    String accessToken = "1329028984613466113-s7czEe857YXKlP8BblgLw0HHcXB3CB";
    String accessTokenSecret = "Vpny7AcnsdOkoiwDOdIMv6QGEQ8UppYUsfMs4CNQokzbs";

    final _twitterOauth = new twitterApi(
        consumerKey: consumerApiKey,
        consumerSecret: consumerApiSecret,
        token: accessToken,
        tokenSecret: accessTokenSecret);

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
    setState(() {
      data = json.decode(res.body);
      //print(data);
    });
  }

  _launchURL(var index, BuildContext context) async {
    var url = (data[index]["entities"]["urls"]["expanded_url"]).toString();
    print(url);
    print(data[index]["id_str"]);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
