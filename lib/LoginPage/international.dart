import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ujob/LoginPage/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class Allworker extends StatefulWidget {
  const Allworker({super.key});

  @override
  State<Allworker> createState() => _AllworkerState();
}

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

class _AllworkerState extends State<Allworker> {
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
            'International Job Search',
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
                'images/kk.jpeg',
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
                    'Jobs in Saudi Arabia - PakistanJobs.pk',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('http://saudiarabia.pakistanjobs.pk')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  '==> Latest Vacancies in Pakistan. View all Jobs by Title. Chicken Van Salesman · Civil Engineer · Qc Civil Engineer · Surveyor · Safety Officer.',
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
            // 2 sadu
            SizedBox(
              height: 220,
              width: 400,
              child: Image.asset(
                'images/uae.jpg',
                fit: BoxFit.contain,
              ),
            ),

            Container(
              height: 60,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(left: 7),
              child: InkWell(
                  child: const Text(
                    '525 Jobs in Saudi Arabia - Vacancies & Salaries',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://www.edarabia.com')),
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
            // 3 Cp
            SizedBox(
              height: 220,
              width: 400,
              child: Image.asset(
                'images/cp.jpg',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: 60,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(left: 7),
              child: InkWell(
                  child: const Text(
                    'Jobs | China-Pakistan Economic Corridor (CPEC) Authority ...',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://cpec.gov.pk')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  '==> Career Opportunities at China Pakistan Economic Corridor Support Project under Ministry of Planning, Development and Special Initiatives .. ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            // 4 china hotel
            SizedBox(
              height: 190,
              width: 400,
              child: Image.asset(
                'images/jooble.jpg',
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
                    'Urgent! China and local  hotel jobs in Pakistan ',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://pk.jooble.org')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'China hotel jobs in Pakistan · General Manager / Hotel Manager · Android Developer · Senior Php Developer · Senior Manager Finance · Mindshare | Social Listener.',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            // 5 Usa
            SizedBox(
              height: 190,
              width: 400,
              child: Image.asset(
                'images/us.jpg',
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
                    'DoS Current Vacancies - U.S. Embassy & Consulates in ...',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://pk.usembassy.gov/')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'To view a current list of all available positions at the U.S. Mission in Pakistan and to apply online, please visit this page: Electronic Recruitment',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            // 6 canda
            SizedBox(
              height: 150,
              width: 400,
              child: Image.asset(
                'images/ca.png',
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
                    'Start Your Application - Apply for Job Funding',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://eco.ca')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'If youre a recent STEM grad, or employer in this sector, we have a program for you. ECO Canada offers funding for new positions in the natural resources sector Career Services Industry Certifications Enviro Training National Job Board Training & Workshops.',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 1,
            ),
            // 7 Turkey
            SizedBox(
              height: 150,
              width: 400,
              child: Image.asset(
                'images/tot.png',
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
                    'Jobs in Turkey in March 2023 | Turkey Jobs & Vacancies',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://www.totaljobs.com')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  '100 jobs in Turkey on totaljobs. Find and apply today for the latest jobs in Turkey. Well get you noticed.',
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
                'images/lee.jpg',
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
                    'Russian jobs with salaries in Pakistan - update',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () => launch('https://jobs.laimoon.com')),
            ),

            const SizedBox(
              height: 1,
            ),
            Container(
                height: 130,
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'Job opportunities for Russian in Pakistan. Russian jobs openings and salary information in Pakistan.Search and apply for the latest Russian jobs in Pakistan. Verified employers. Full-time, temporary, and part-time jobs. Competitive salary.',
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
