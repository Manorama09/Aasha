import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dart_twitter_api/twitter_api.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<dynamic> data = <String>[];
  List<String> ids = <String>[];
  bool loading = true;

  final twitterApi = TwitterApi(
    client: TwitterClient(
      consumerKey: 'iWhUBzn9SVGr1EBmEnA0pK5E8',
      consumerSecret: 'gxRZ9LJs8LTAtlhWPNp7bpMAmiO1ZRa90cOpncmI0ZmkuK0MGs',
      token: '1329028984613466113-s7czEe857YXKlP8BblgLw0HHcXB3CB',
      secret: 'Vpny7AcnsdOkoiwDOdIMv6QGEQ8UppYUsfMs4CNQokzbs',
    ),
  );

  @override
  void initState() {
    loading = true;
    tweets().then((res) => {
          setState(() {
            data = res;
            loading = false;
          })
        });
    super.initState();
  }

  Future<List> tweets() async {
    List<String> res = <String>[];
    try {
      final homeTimeline = await twitterApi.timelineService.homeTimeline(
        count: 20,
      );
      for (var tweet in homeTimeline) {
        res.add(tweet.fullText!);
        ids.add(tweet.idStr!);
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error while requesting home timeline: $error');
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //bottomNavigationBar: BottomNavBar(),
        backgroundColor: const Color(0xffF4EEFF),
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: const Color(0xffF4EEFF),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(95, 0, 0, 0),
            child: Text("News",
                style: GoogleFonts.dancingScript(
                    color: const Color(0xff1E2558),
                    fontSize: 35,
                    fontWeight: FontWeight.w700)),
          ),
        ),
        body: !loading
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, i) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Card(
                        elevation: 3.0,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffB180FE).withOpacity(0.45)),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            title: Text(
                                (data[i]).substring(3, (data[i]).indexOf(':')),
                                style: GoogleFonts.workSans(
                                    color: const Color(0xff1E2558),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            subtitle: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: Text((data[i])
                                  .substring((data[i]).indexOf(':') + 2)),
                            ),
                            onTap: () => _launchURL(i, context),
                          ),
                        )),
                  );
                })
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 2.2,
                    vertical: MediaQuery.of(context).size.height / 3.5),
                child: const CircularProgressIndicator()));
  }

  _launchURL(var index, BuildContext context) async {
    print(ids[index]);
    var url = ("https://twitter.com/anyuser/status/" + ids[index]);
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
