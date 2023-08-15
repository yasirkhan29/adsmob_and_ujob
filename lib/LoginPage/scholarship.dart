import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ujob/LoginPage/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class scholarShip extends StatefulWidget {
  const scholarShip({super.key});

  @override
  State<scholarShip> createState() => _scholarShipState();
}

class _scholarShipState extends State<scholarShip> {
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Scholarship Search',
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
              child: ListView(
                padding: const EdgeInsets.all(16),
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.deepOrange.shade300, Colors.blueGrey],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: const [0.2, 0.9],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //1 Saudi
            SizedBox(
              height: 190,
              width: 400,
              child: Image.asset(
                'images/hec.jpg',
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
                    'Chinese Government Scholarship Program How to Apply - HEC',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://www.hec.gov.pk')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  '==>With a view to enhance educational cooperation between China and Pakistan, the Chinese Scholarship Council, Govt. of China is offering Pakistani students/ ...',
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
            // 2 USA SH
            SizedBox(
              height: 220,
              width: 400,
              child: Image.asset(
                'images/we.jpg',
                fit: BoxFit.fill,
              ),
            ),

            Container(
              height: 60,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(left: 7),
              child: InkWell(
                  child: const Text(
                    '509+ United States of America (USA) Scholarships for ...',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://www.wemakescholars.com')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  '==>[Updated 3 days ago] United States of America (USA) Scholarships for Pakistani students are below: · Ritchie-Jennings Memorial Scholarship Program,| · Royal ...',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            // 3 Canbarrey
            SizedBox(
              height: 220,
              width: 400,
              child: Image.asset(
                'images/can.jpg',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: 60,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(left: 7),
              child: InkWell(
                  child: const Text(
                    'The University of Canberra - International Scholarships',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://scholarshipcorners.com')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  '==>Get Rewarded For Your Academic Performance. Set Yourself Up For a Global Future. Discover Our Range Of Generous Scholarships For International Students. ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            // 4 Scholarships for Pakistani students in Kingdom of Saudi ...
            SizedBox(
              height: 190,
              width: 400,
              child: Image.asset(
                'images/ful.png',
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
                    'Scholarships for Pakistani students in Kingdom of Saudi ... ',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://scholarshipstree.com')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  '​​​Kingdom of Saudi Arabia has announced fully funded scholarships for Pakistani students to study at the level of Diploma, Bachelors, Masters, and PhD in ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            // 5 rgco
            SizedBox(
              height: 190,
              width: 400,
              child: Image.asset(
                'images/rg.jpg',
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
                    'Apply-Online Fully Funded Government Scholarships',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://www.gistkobo.com')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'Apply Now, Fully Funded Government Scholarships, Fellowships, Grants, for Intl students 23. Find free or lowest price for Master Programs In Europe today! For International Students. Postgraduate Programs. Undergraduate Programs. Masters Programs. Intern Programs.',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            // 6 Dalda
            SizedBox(
              height: 150,
              width: 400,
              child: Image.asset(
                'images/ii.jpg',
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
                    'Dalda Foundation Scholarship- EduVision',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://www.eduvision.edu.pk')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'The Dalda Scholarship program is offering scholarships for needy/poor and deserving students. The Aim and the main Objective of the Dalda Scholarship are to ...',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            // 7 panjab
            SizedBox(
              height: 190,
              width: 400,
              child: Image.asset(
                'images/sch.jpg',
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
                    'Financial Assistance for Needy/Disable Persons | Punjab Bait ...',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://baitulmaal.punjab.gov.pk')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'Financial Assistance for Needy/Disable Persons | Punjab Bait ...',
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
                'images/dis.jpg',
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
                    'Pakistani Students with Disabilities: Asma Tips to entry in U.S ...',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://www.miusa.org')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'Pakistani Students with Disabilities: Asmas Tips to Access U.S. Study ... what its like to participate in a U.S. exchange program as a disabled person.',
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
