import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ujob/LoginPage/login_screen.dart';
import 'package:ujob/LoginPage/scholarship.dart';
import 'package:ujob/LoginPage/international.dart';
import 'package:ujob/LoginPage/usermodel.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;
  const HomePage(
      {Key? key, required this.userModel, required this.firebaseUser})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Allworker _allworker = const Allworker();
  int _page = 0;
  final Widget _showPage = const Allworker();

  Widget _pageChooser(int LoginPage) {
    switch (LoginPage) {
      case 0:
        return const Allworker();
        break;
    }
    return widget;
  }

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  BannerAd bannerad = new BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(onAdLoaded: (ad) {
        print("Ad Loaded");
      }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
        print("Ad Failed");
        ad.dispose();
      }, onAdOpened: (Ad ad) {
        print("Ad Loaded");
      }),
      request: AdRequest());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepOrange.shade300, Colors.blueGrey],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.2, 0.9],
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          items: [
            const Icon(Icons.list, size: 30),
            Icon((_page == 0) ? Icons.search : Icons.search),
          ],
          color: Colors.deepOrange.shade400,
          buttonBackgroundColor: Colors.deepOrange.shade300,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'uJob Search',
            style: TextStyle(fontFamily: 'medium', fontSize: 40),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: const Icon(Icons.logout))
          ],
          centerTitle: true,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepOrange.shade300, Colors.blueAccent],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: const [0.2, 0.9],
              ),
            ),
          ),
        ),
        //Body of Home page
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 80,
              //Row categoris
              child: ListView(
                padding: const EdgeInsets.all(16),
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                      gradient: LinearGradient(
                        colors: [Colors.deepOrange.shade300, Colors.blueGrey],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: const [0.2, 0.9],
                      ),
                    ),
                    width: 200,
                    child: CupertinoButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Allworker()));
                      },
                      child: const Text(
                        "International Job Search",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0)),
                      gradient: LinearGradient(
                        colors: [Colors.deepOrange.shade300, Colors.blueGrey],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: const [0.2, 0.9],
                      ),
                    ),
                    width: 200,
                    child: CupertinoButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const scholarShip()));
                      },
                      child: const Text(
                        "scholarship",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            //1 Pakistan bank jobs
            SizedBox(
              height: 190,
              width: 400,
              child: Image.asset(
                'images/Lat.jpg',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(left: 7),
              child: InkWell(
                  child: const Text(
                    'Pakistan Jobs Bank Latest Update Complete your dreams here',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://www.pakistanjobsbank.com')),
            ),

            const SizedBox(
              height: 1,
            ),

            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  '==>  Search for Online jobs from pakistan, We hope that Pakistan Jobs Bank will help you find your dream job quickly and easily........',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            Container(
              child: AdWidget(
                ad: bannerad..load(),
                key: UniqueKey(),
              ),
              height: 50,
            ),
            const SizedBox(
              height: 1,
            ),
            // 2 jobz
            SizedBox(
              height: 220,
              width: 400,
              child: Image.asset(
                'images/jobz.jpg',
                fit: BoxFit.contain,
              ),
            ),

            Container(
              height: 60,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(left: 7),
              child: InkWell(
                  child: const Text(
                    'Latest Pakistan Jobs Jobz.pk (Daily Updates)',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://www.jobz.pk')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  '==> Jobs pk is Pakistan top job search website where job seekers can get access to latest job........',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            // 3 Alerte
            SizedBox(
              height: 220,
              width: 400,
              child: Image.asset(
                'images/alert.png',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: 60,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(left: 7),
              child: InkWell(
                  child: const Text(
                    'Apply Online for New Govt Jobs of Pakistan',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://www.jobsalert.pk')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  '==> All the latest Jobs in Pakistan Karachi, Lahore, Islamabad, & other cities published in newspapers latest ads and well-known companies Jobs every day........ ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            // 4 VU Learing
            SizedBox(
              height: 190,
              width: 400,
              child: Image.asset(
                'images/vu.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(left: 7),
              child: InkWell(
                  child: const Text(
                    'VULearning Jobs in Pakistan Latest for Govt & Private ...',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://www.vulearning.com')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'VULearning.com, Here you will find vulearning Jobs in Pakistan 2023 Latest for Government & Private Sector provided on www.vulearning.com.........',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            // 5 kpk jops
            SizedBox(
              height: 190,
              width: 400,
              child: Image.asset(
                'images/pol.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(left: 7),
              child: InkWell(
                  child: const Text(
                    'jobs - Government of Khyber Pakhtunkhwa',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://kp.gov.pk')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'Find the open role that fits you. Search. team ... Role. Junior Category Manager (m/w/d). Team. Commercial. Location. Düsseldorf',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            // 6 join pak Army
            SizedBox(
              height: 190,
              width: 400,
              child: Image.asset(
                'images/pak.jpg',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(left: 7),
              child: InkWell(
                  child: const Text(
                    'Join Pak Army 2023 at www.joinpakarmy.gov.pk • Jobss.pk',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://jobss.pk')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'Join Pak Army as Soldier, Cook, Junior Clerk, or Sanitary Worker Online Registration | www.joinpakarmy.gov.pk ; Employment Type: Permanent.',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            // 7 indeed
            SizedBox(
              height: 190,
              width: 400,
              child: Image.asset(
                'images/indeed.jpg',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(left: 7),
              child: InkWell(
                  child: const Text(
                    'Indeed: Job Search you can search millions of jobs',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://pk.indeed.com')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'Join Pak Army as Soldier, Cook, Junior Clerk, or Sanitary Worker Online Registration | www.joinpakarmy.gov.pk ; Employment Type: Permanent.',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            // 8 Hospital
            SizedBox(
              height: 190,
              width: 400,
              child: Image.asset(
                'images/rooz.jpg',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(left: 7),
              child: InkWell(
                  child: const Text(
                    'Healthcare / Hospital / Medical Jobs in Pakistan ... - Rozee.pk',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://www.rozee.pk')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'AR Executive - Medical Billing · Advisor Regulatory Affairs · Advisor Strategic Planning · Manager - Facility Management · Sales / Marketing Officer · Sales ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
          ],
        )),
      ),
    );
  }
}
