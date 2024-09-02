import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:touch/apis/api_data.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin {
  late TabController _tabController;
  ApiData? _apiData;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 0, vsync: this);
    _loadApiData();
  }

  Future<void> _loadApiData() async {
    final jsonString = await rootBundle
        .loadString('assets/json/frontend-interview.postman.collection.json');
    final jsonData = jsonDecode(jsonString);
    final apiData = ApiData.fromJson(jsonData);
    setState(() {
      _apiData = apiData;
      _tabController.animation?.removeListener(() {});
      _tabController.dispose();
      _tabController =
          TabController(length: _apiData!.items.length, vsync: this);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to Touch Interview",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 1.0,
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _apiData!.items.map((item) => Tab(text: item.name)).toList(),
        ),
      ),
      body: _apiData != null
          ? TabBarView(
              controller: _tabController,
              children: _apiData!.items.map((item) {
                return ListView(
                  children: [
                    ListTile(
                      title: Text(item.name),
                      subtitle:
                          Text(item.request.method + ' ' + item.request.url),
                    ),
                    // Add more widgets to display the item details here
                  ],
                );
              }).toList(),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
