import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

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
    },
    {
      "id": "RPT-002",
      "type": "Attendance",
      "entity": "Grade 3A",
      "period": "08-01 - 09-07",
      "generated": "09-07",
      "color": Colors.green,
    },
    {
      "id": "RPT-003",
      "type": "Exam Results",
      "entity": "Grade 11",
      "period": "06-30 - 06-05",
      "generated": "06-05",
      "color": Colors.amber,
    },
    {
      "id": "RPT-004",
      "type": "Attendance",
      "entity": "Grade 3A",
      "period": "06-01 - 06-07",
      "generated": "06-07",
      "color": Colors.green,
    },
    {
      "id": "RPT-004",
      "type": "Attendance",
      "entity": "Grade 3A",
      "period": "06-01 - 06-07",
      "generated": "06-07",
      "color": Colors.green,
    },
    {
      "id": "RPT-004",
      "type": "Attendance",
      "entity": "Grade 3A",
      "period": "06-01 - 06-07",
      "generated": "06-07",
      "color": Colors.green,
    },
    {
      "id": "RPT-004",
      "type": "Attendance",
      "entity": "Grade 3A",
      "period": "06-01 - 06-07",
      "generated": "06-07",
      "color": Colors.green,
    },
    {
      "id": "RPT-004",
      "type": "Attendance",
      "entity": "Grade 3A",
      "period": "06-01 - 06-07",
      "generated": "06-07",
      "color": Colors.green,
    },
    {
      "id": "RPT-004",
      "type": "Attendance",
      "entity": "Grade 3A",
      "period": "06-01 - 06-07",
      "generated": "06-07",
      "color": Colors.green,
    },
    {
      "id": "RPT-004",
      "type": "Attendance",
      "entity": "Grade 3A",
      "period": "06-01 - 06-07",
      "generated": "06-07",
      "color": Colors.green,
    },
    {
      "id": "RPT-004",
      "type": "Attendance",
      "entity": "Grade 3A",
      "period": "06-01 - 06-07",
      "generated": "06-07",
      "color": Colors.green,
    },
    {
      "id": "RPT-004",
      "type": "Attendance",
      "entity": "Grade 3A",
      "period": "06-01 - 06-07",
      "generated": "06-07",
      "color": Colors.green,
    },
    {
      "id": "RPT-004",
      "type": "Attendance",
      "entity": "Grade 3A",
      "period": "06-01 - 06-07",
      "generated": "06-07",
      "color": Colors.green,
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
                  builder: (context) => const NotificationScreen(),
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
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xffF4EFEF),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(18),
                        ),
                      ),
                      child: const Text("All Reports", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Text("ID")),
                          Expanded(child: Text("Type")),
                          Expanded(child: Text("Entity")),
                          Expanded(child: Text("Period")),
                          Expanded(child: Text("Generated")),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: reports.length,
                        itemBuilder: (context, index) {
                          final item = reports[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [

                                Expanded(child: Text(item["id"])),

                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: item["color"],
                                      borderRadius:
                                      BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      item["type"],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(child: Text(item["entity"])),

                                Expanded(child: Text(item["period"])),

                                Expanded(child: Text(item["generated"])),

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
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(icon: Icons.dashboard),
          FluidNavBarIcon(icon: Icons.menu),
          FluidNavBarIcon(icon: Icons.book_rounded),
          FluidNavBarIcon(icon: Icons.star_rounded),
          FluidNavBarIcon(icon: Icons.person),
        ],
        onChange:(index){
          if(index==2) {
            Navigator.push(context, MaterialPageRoute(builder: (_)=>AssignmentScreen()));
          }
        },
        style: FluidNavBarStyle(
          barBackgroundColor: Color(0xFF0F172A),
          iconSelectedForegroundColor: Colors.white,
        ),
      ),
    );
  }
}