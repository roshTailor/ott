import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Site extends StatefulWidget {
  const Site({Key? key}) : super(key: key);

  @override
  State<Site> createState() => _SiteState();
}

class _SiteState extends State<Site> {
  late InAppWebViewController inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    String? website = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(website),
          ),
          onWebViewCreated: (val) {
            setState(() {
              inAppWebViewController = val;
            });
          },
        ),
      ),
    );
  }
}
