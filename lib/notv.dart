import 'package:fluterrr/api_client.dart';
import 'package:fluterrr/repots.dart';
import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'assig.dart';
import 'dart:convert';

import 'dashboard.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}
class _NotificationScreenState extends State<NotificationScreen> {

  final TextEditingController searchController = TextEditingController();

  String search = "";

  List notifications = [];
  bool isLoading = true;
  Future<void> getNotifications() async {
    print("getNotifications called");

    final response = await ApiClient.get('/notifications/1');

    print("Status: ${response.statusCode}");
    print("Body: ${response.body}");

    if (response.statusCode == 200) {
      setState(() {
        notifications = jsonDecode(response.body);
        isLoading = false;
      });

      print(notifications);
    } else {
      print("Error: ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    print("initState called");
    getNotifications();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            child: const Icon(Icons.segment),
                          ),

                          const SizedBox(width: 15),

                          const Text(
                            "Notifications",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      Container(
                        width: 45,
                        height: 45,
                        child: const Icon(
                          Icons.notifications_none,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(18),
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          search = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search notifications",
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),



                  const Text(
                    "Today",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),
                      if (search.isEmpty ||
                          "teacher attendance submitted".contains(search) ||
                          "academic".contains(search))
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          width: 58,
                          height: 58,
                          decoration: const BoxDecoration(
                            color: Color(0xffFFF6D8),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.notifications_none,
                            color: Color(0xffE8B400),
                            size: 30,
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Text(
                                "Field Trip",
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 4),

                              const Text(
                                "Medium Priority",
                                style: TextStyle(
                                  color: Color(0xffE8B400),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              const Text(
                                "A school-wide field trip for all grades has been scheduled.",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),

                              const SizedBox(height: 15),

                              Row(
                                children: [

                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFFF2B0),
                                      borderRadius:
                                      BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      "Activity",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff876600),
                                      ),
                                    ),
                                  ),

                                  const Spacer(),

                                  const Icon(
                                    Icons.access_time,
                                    size: 18,
                                    color: Colors.grey,
                                  ),

                                  const SizedBox(width: 5),

                                  const Text(
                                    "11:40 PM",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              Row(
                                children: [

                                  const Icon(
                                    Icons.calendar_today,
                                    size: 18,
                                    color: Colors.grey,
                                  ),

                                  const SizedBox(width: 5),

                                  const Text(
                                    "May 18, 2025",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),

                                  const Spacer(),

                                  const Text(
                                    "For Students",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),

                        const Icon(
                          Icons.chevron_right,
                          size: 30,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          width: 58,
                          height: 58,
                          decoration: const BoxDecoration(
                            color: Color(0xffFFF6D8),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.notifications_none,
                            color: Color(0xffE8B400),
                            size: 30,
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Text(
                                "Teacher Attendance\nSubmitted",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 5),

                              const Text(
                                "Medium Priority",
                                style: TextStyle(
                                  color: Color(0xffE8B400),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              const Text(
                                "Mr. Ali submitted attendance for Grade 10-A.",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),

                              const SizedBox(height: 15),

                              Row(
                                children: [

                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFFF2B0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      "Academic",
                                      style: TextStyle(
                                        color: Color(0xff876600),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  const Spacer(),

                                  const Icon(
                                    Icons.access_time,
                                    size: 18,
                                    color: Colors.grey,
                                  ),

                                  const SizedBox(width: 5),

                                  const Text(
                                    "11:40 PM",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              Row(
                                children: [

                                   Icon(
                                    Icons.calendar_today,
                                    size: 18,
                                    color: Colors.grey,
                                  ),

                                   SizedBox(width: 5),

                                   Text(
                                    "May 18, 2025",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),

                                   Spacer(),

                                   Text(
                                    "For Students &\nParents",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),

                        const Icon(
                          Icons.chevron_right,
                          size: 30,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                      const Text(
                    "Yesterday",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 58,
                          height: 58,
                          decoration: const BoxDecoration(
                            color: Color(0xffFFF6D8),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.notifications_none,
                            color: Color(0xffE8B400),
                            size: 30,
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Text(
                                "Field Trip",
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 5),

                              const Text(
                                "Medium Priority",
                                style: TextStyle(
                                  color: Color(0xffE8B400),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              const Text(
                                "A school-wide field trip for all grades has been scheduled.",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),

                              const SizedBox(height: 15),

                              Row(
                                children: [

                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFFF2B0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      "Activity",
                                      style: TextStyle(
                                        color: Color(0xff876600),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  const Spacer(),

                                  const Icon(Icons.access_time,size:18,color:Colors.grey),
                                  const SizedBox(width:5),

                                  const Text(
                                    "11:40 PM",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height:10),

                              Row(
                                children: [

                                  const Icon(Icons.calendar_today,size:18,color:Colors.grey),
                                  const SizedBox(width:5),

                                  const Text(
                                    "May 18, 2025",
                                    style: TextStyle(color: Colors.grey),
                                  ),

                                  const Spacer(),

                                  const Text(
                                    "For Students",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const Icon(Icons.chevron_right,size:30),
                      ],
                    ),
                  ),

                  const SizedBox(height:20),

                  const SizedBox(height:30),

                  const Text(
                    "This Week",
                    style: TextStyle(
                      fontSize:24,
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 58,
                              height: 58,
                              decoration: const BoxDecoration(
                                color: Color(0xffFFF6D8),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.notifications_none,
                                color: Color(0xffE8B400),
                                size: 30,
                              ),
                            ),

                            const SizedBox(width: 15),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const Text(
                                    "Field Trip",
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  const Text(
                                    "Medium Priority",
                                    style: TextStyle(
                                      color: Color(0xffE8B400),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  const Text(
                                    "A school-wide field trip for all grades has been scheduled.",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),

                                  const SizedBox(height: 15),

                                  Row(
                                    children: [

                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFFF2B0),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: const Text(
                                          "Activity",
                                          style: TextStyle(
                                            color: Color(0xff876600),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                      const Spacer(),

                                      const Icon(Icons.access_time,size:18,color:Colors.grey),
                                      const SizedBox(width:5),

                                      const Text(
                                        "11:40 PM",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height:10),

                                  Row(
                                    children: [

                                      const Icon(Icons.calendar_today,size:18,color:Colors.grey),
                                      const SizedBox(width:5),

                                      const Text(
                                        "May 18, 2025",
                                        style: TextStyle(color: Colors.grey),
                                      ),

                                      const Spacer(),

                                      const Text(
                                        "For Students",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const Icon(Icons.chevron_right,size:30),
                          ],
                        ),
                      ),


                      const SizedBox(height:20),
                    ],
                  ),
                ),
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
            if(index==4) {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>dachbord()));
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