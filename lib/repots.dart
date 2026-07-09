import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'assig.dart';
import 'notv.dart';

class ReportsScreen extends StatelessWidget {
  ReportsScreen({super.key});

  final List<Map<String, dynamic>> reports = [
    {
      "id": "RPT-001",
      "type": "Attendance",
      "entity": "Grade 2B",
      "period": "08-31 - 09-28",
      "generated": "09-20",
      "color": Colors.green,
      "link": "View",
    },
    {
      "id": "RPT-002",
      "type": "Attendance",
      "entity": "Grade 3A",
      "period": "08-01 - 09-07",
      "generated": "09-07",
      "color": Colors.green,
      "link": "View",
    },
    {
      "id": "RPT-003",
      "type": "Exam Results",
      "entity": "Grade 11",
      "period": "06-30 - 06-05",
      "generated": "06-05",
      "color": Colors.orange,
      "link": "View",
    },
    {
      "id": "RPT-004",
      "type": "Attendance",
      "entity": "Grade 3A",
      "period": "06-01 - 06-07",
      "generated": "06-07",
      "color": Colors.green,
      "link": "View",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: const Icon(Icons.segment, color: Colors.black),
          title: const Text(
            "Reports",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NotificationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
          Expanded(
          child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            children: [
            Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color(0xffF4EFEF),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(18),
              ),
            ),
            child: const Text(
              "All Reports",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 810,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            "ID",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Type",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Entity",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: Text(
                            "Period",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          child: Text(
                            "Generated",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            "Link",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Divider(height: 1),

                  SizedBox(
                    height: 520,
                    child: ListView.builder(
                      itemCount: reports.length,
                      itemBuilder: (context, index) {
                        final item = reports[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 120,
                                child: Text(item["id"]),
                              ),

                              SizedBox(
                                width: 120,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: item["color"],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      item["type"],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: 120,
                                child: Text(item["entity"]),
                              ),

                              SizedBox(
                                width: 120,
                                child: Text(item["period"]),
                              ),

                              SizedBox(
                                width: 120,
                                child: Text(item["generated"]),
                              ),

                              TextButton(
                                onPressed: () async {
                                  final Uri uri = Uri.parse(
                                    "https://drive.google.com/drive/folders/1LMFZDOrpTj8lLPchw3PgqEX8qYWSUMCW?usp=drive_link",
                                  );

                                  if (!await launchUrl(
                                    uri,
                                    mode: LaunchMode.externalApplication,
                                  )) {
                                    throw Exception('Could not launch $uri');
                                  }
                                },
                                child: const Text("Drive"),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
            ],
          ),
          ),
          ),
            ],
          ),
        ),
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(icon: Icons.dashboard),
          FluidNavBarIcon(icon: Icons.menu),
          FluidNavBarIcon(icon: Icons.book_rounded),
          FluidNavBarIcon(icon: Icons.star_rounded),
          FluidNavBarIcon(icon: Icons.person),
        ],
        onChange: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AssignmentScreen(),
              ),
            );
          }
        },
        style: const FluidNavBarStyle(
          barBackgroundColor: Color(0xFF0F172A),
          iconSelectedForegroundColor: Colors.white,
        ),
      ),
    );
  }
}