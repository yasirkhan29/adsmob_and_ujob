import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ujob/Admob/AdmobHelper.dart';
import 'package:ujob/Admob/second_page.dart';

class ads_Page extends StatefulWidget {
  const ads_Page({super.key});

  @override
  State<ads_Page> createState() => _ads_PageState();
}

class _ads_PageState extends State<ads_Page> {
  AdmobHelper admobHelper = new AdmobHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: 100,
            width: 300,
            color: Colors.blue,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black)),
            child: AdWidget(
              ad: AdmobHelper.getBannerAd()..load(),
              key: UniqueKey(),
            ),
            height: 50,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 100,
            width: 300,
            color: Colors.blue,
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                admobHelper.createInterad();
                admobHelper.showInterad();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => secondPage()));
              },
              child: Text("Button"))
        ],
      ),
      bottomNavigationBar: Container(
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
        child: AdWidget(
          ad: AdmobHelper.getBannerAd()..load(),
          key: UniqueKey(),
        ),
        height: 50,
      ),
    );
  }
}
