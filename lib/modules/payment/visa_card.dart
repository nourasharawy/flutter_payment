import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymentapp/modules/register/register.dart';
import 'package:paymentapp/shared/components/component.dart';
import 'package:paymentapp/shared/components/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VisaCardScreen extends StatelessWidget {
  final Completer<WebViewController> _controller = Completer<
      WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://accept.paymob.com/api/acceptance/iframes/378838?payment_token=$FinalTokenCard',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onProgress: (int progress) {
          print('WebView is loading (progress : $progress%)');
        },
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            print('blocking navigation to $request}');
            return NavigationDecision.prevent;
          }
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
      floatingActionButton: ExitButton(),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        }

    );
  }

  Widget ExitButton() {
    return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          return FloatingActionButton(
              onPressed:(){
                print("nooo");
             Exit(context);
              },
              child: const Icon(Icons.exit_to_app),);
        });
  }

   Exit(BuildContext context) {
     showDialog(
       context: context,
       builder: (BuildContext context)=> AlertDialog(
           title: Text("Are You sure want to exit the visa card screen ?"),
           actions: [
             TextButton(
                 onPressed: () {
                   Navigator.pop(context);
                   navigateAndFinish(context, RegisterPage());
                 },
                 child: Text("Yes")),
             TextButton(
                 onPressed: () {
                   Navigator.pop(context);
                 },
                 child: Text("No")),
           ],
         ),
     );
   }
}