import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 2;
  String search = '';
  late InAppWebViewController inAppWebViewController;
  late PullToRefreshController pullToRefreshController;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
      onRefresh: () async {
        if (Platform.isAndroid) {
          await inAppWebViewController.reload();
        } else if (Platform.isIOS) {
          Uri? url = await inAppWebViewController.getUrl();
          inAppWebViewController.loadUrl(
            urlRequest: URLRequest(url: url),
          );
        }
      },
      options: PullToRefreshOptions(color: Colors.blue),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTT Platforms"),
        backgroundColor: const Color(0xff020040),
      ),
      body: SafeArea(
        top: true,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://img.freepik.com/free-vector/abstract-colorful-technology-dotted-wave-background_1035-17450.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1 / 1.6,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            itemCount: Variable.website.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'site', arguments:
                  Variable.website[i]['site']);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Image.network(Variable.website[i]['img'],fit: BoxFit.fill,),
                    ),
                    Text(Variable.website[i]['name'],
                      style: const TextStyle(fontWeight:
                      FontWeight.w500, color: Colors.white),),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );}
}
