import 'package:flutter/material.dart';

class Latihan extends StatefulWidget {
  const Latihan({super.key});

  @override
  State<Latihan> createState() => _LatihanState();
}

class _LatihanState extends State<Latihan> {
  List<Map<String, dynamic>> dataMobil = [
    {'type': 'Yaris', 'roda': 4, 'pintu': 4},
    {'type': 'Avanza', 'roda': 4, 'pintu': 1},
    {'type': 'Rush', 'roda': 4, 'pintu': 2},
  ];

  List<String> buttons = ['Login', 'Show', 'Hide'];

  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset("assets/images/toyota_logo.png"),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Nama Kendaraan Toyota",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: buttons
                      .map((element) => GestureDetector(
                          onTap: () {
                            if (element == 'Login') {
                              print('GO TO LOGIN');
                            } else {
                              setState(() {
                                isActive = element == 'Show';
                              });
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Text(element),
                            ),
                          )))
                      .toList(),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         print("Tombol 1");
              //         setState(() {
              //           isActive = true;
              //         });
              //       },
              //       child: Container(
              //         width: 100,
              //         height: 100,
              //         decoration: BoxDecoration(
              //             color: Colors.green,
              //             borderRadius: BorderRadius.circular(100)),
              //         child: const Center(
              //           child: Text("Tombol 1"),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 15,
              //     ),
              //     InkWell(
              //       onTap: () {
              //         print("Tombol 2");
              //         setState(() {
              //           isActive = false;
              //         });
              //       },
              //       child: Container(
              //         width: 100,
              //         height: 100,
              //         decoration: BoxDecoration(
              //             color: Colors.green,
              //             borderRadius: BorderRadius.circular(100)),
              //         child: const Center(
              //           child: Text("Tombol 2"),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 15,
              //     ),
              //     GestureDetector(
              //       onTap: () {
              //         print("Tombol 1");
              //       },
              //       child: Container(
              //         width: 100,
              //         height: 100,
              //         decoration: BoxDecoration(
              //             color: Colors.green,
              //             borderRadius: BorderRadius.circular(100)),
              //         child: const Center(
              //           child: Text("Tombol 3"),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              if (isActive == true) ...{
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: dataMobil.length,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemBuilder: (context, index) {
                    /* for(int i = 0; i < dataMobile.length; i++) {
                      print("${dataMobil[i]['type']}");
                    }
                    */
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${dataMobil[index]['type']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Roda : ${dataMobil[index]['roda']}, Pintu : ${dataMobil[index]['pintu']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                )
              },

              const Row(
                children: [
                  Expanded(
                    child: Text("Nama"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(":"),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    "Jhonson",
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
