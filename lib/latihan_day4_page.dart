import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LatihanDay4Page extends StatefulWidget {
  const LatihanDay4Page({super.key});

  @override
  State<LatihanDay4Page> createState() => _Day4PageState();
}

class _Day4PageState extends State<LatihanDay4Page> {
  String name = "Mario";

  List<String> dataHoby = ["Makan", "Game", "Nonton"];

  final Uri _url = Uri.parse('https://facebook.com');

  String valueDropdown = "Indonesia";
  String selectedCountry = "Indonesia";

  List<DropdownMenuItem<String>> dataDropdown = [
    DropdownMenuItem(
      value: 'Indonesia',
      child: Text('Indonesia'),
    ),
    DropdownMenuItem(
      value: 'Malaysia',
      child: Text('Malaysia'),
    ),
    DropdownMenuItem(
      value: 'India',
      child: Text('India'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan Day 4"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: const Text(
                  "INTRODUCE MY SELF",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  "https://thumb.viva.id/vivabanyuwangi/665x374/2024/09/25/66f3e8ea8ba7a-anime-one-piece-monkey-d-luffy_banyuwangi.jpg",
                  width: double.infinity,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.warning),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _rowBiodata("Nama", "$name"),
              const SizedBox(
                height: 5,
              ),
              _rowBiodata("Alamat", "Bekasi"),
              const SizedBox(
                height: 5,
              ),
              _rowBiodata("Umur", "17"),
              const SizedBox(
                height: 5,
              ),
              _rowBiodata("Divisi", "Mobile Developer"),
              const SizedBox(
                height: 5,
              ),
              _rowBiodata("Harapan Tentang Training",
                  "Semoga final project berjalan lancar"),

              // CommonRow(title: "Test", value: "Tesssst").showRow()
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Hobbies",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: dataHoby.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text("${dataHoby[index]}"),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Social Media ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        _launchUrl("https://facebook.com");
                      },
                      icon: Icon(Icons.facebook)),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        _launchUrl("https://instagram.com");
                      },
                      icon: const FaIcon(FontAwesomeIcons.instagram)),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchUrl("https://wa.me/6283815613839");
                    },
                    child: const FaIcon(FontAwesomeIcons.whatsapp),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => Latihan(title: "Latihan"),
                      //     ));
                      Navigator.pushNamed(context, '/latihan');
                    },
                    child: const FaIcon(FontAwesomeIcons.chevronRight),
                  )
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              RadioListTile<String>(
                title: Text('Indonesia'),
                value: 'Indonesia',
                groupValue: selectedCountry,
                onChanged: (String? value) {
                  setState(() {
                    selectedCountry = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('Malaysia'),
                value: 'Malaysia',
                groupValue: selectedCountry,
                onChanged: (String? value) {
                  setState(() {
                    selectedCountry = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('India'),
                value: 'India',
                groupValue: selectedCountry,
                onChanged: (String? value) {
                  setState(() {
                    selectedCountry = value!;
                  });
                },
              ),

              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.orange,
                  ),
                  Positioned(top: 10, right: 10, child: Icon(Icons.share)),
                  Container(
                    width: 200,
                    height: 300,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text("Testing"),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 100,
              ),

              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Dont have account? hkjdhflksnkckihakds',
                    style: TextStyle(color: Colors.grey, fontSize: 24)),
                TextSpan(
                    text: ' Sign Up',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Privacy Policy');
                      }),
              ]))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _rowBiodata(String title, String value) {
    return Row(
      children: [
        Expanded(
          child: Text("$title"),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(":"),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text("$value"),
        )
      ],
    );
  }
}
