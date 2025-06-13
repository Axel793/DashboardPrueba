import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Power BI',
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const DashboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(
          'https://app.powerbi.com/view?r=eyJrIjoiODNmMTc3ZjEtY2EwMC00ZmU3LWIxMDUtNmRkZTIwNmMyMzVlIiwidCI6ImU5NDgwZWI4LTdjZWUtNDJjMi04YzM1LTVkMTIyZWNjNWZkOSIsImMiOjR9'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard Power BI')),
      body: SafeArea(
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
