import 'package:fluterrr/repots.dart';
import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
class ViewStudentScreen extends StatelessWidget {
  const ViewStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = (screenWidth - 32 - 24) / 4;
    double cardHeight = cardWidth * 1.8;
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.segment, color: Color(0xFF1E293B), size: 28),
          onPressed: () {},
        ),
        title: const Text(
          'View Student',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF1E293B)),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              alignment: Alignment.center,
              child:  Image.asset(
                "assets/images/1.jpeg",
                width: 70,
                height: 70,


              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 110.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFF9E2A2B), width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(0xFFFFE0B2),
                          child: Icon(Icons.person, size: 50, color: Colors.red),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Ali Mahmoud Ali Mahamed',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),

                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC8E6C9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Active Student',
                          style: TextStyle(
                            color: Color(0xFF388E3C),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildInfoRow(Icons.school_outlined, 'Grade', 'Grade 13'),
                      const Divider(height: 1),
                      _buildInfoRow(Icons.meeting_room_outlined, 'Class', '3 A'),
                      const Divider(height: 1),
                      _buildInfoRow(Icons.badge_outlined, 'Student ID', '111'),
                      const Divider(height: 1),
                      _buildInfoRow(Icons.email_outlined, 'Email', 'aliweka10ahly@gmail.com'),
                      const Divider(height: 1),
                      _buildInfoRow(Icons.phone_outlined, 'Phone Number', '01554908930'),
                      const Divider(height: 1),
                      _buildInfoRow(Icons.calendar_month_outlined, 'Date of Birth', '21 july, 2009'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatCard(
                      width: cardWidth,
                      height: cardHeight,
                      title: 'Average Grade',
                      value: '92.5%',
                      icon: Icons.trending_up,
                      iconColor: Colors.white,
                      circleColor: const Color(0xFF7A1C1C),
                      footerText: '',
                    ),
                    _buildStatCard(
                      width: cardWidth,
                      height: cardHeight,
                      title: 'Class Ranking',
                      value: '#1',
                      icon: Icons.emoji_events_outlined,
                      iconColor: Colors.tealAccent,
                      circleColor: const Color(0xFF1C3A5E),
                      footerText: '↑ #1 Grade rank',
                      footerColor: Colors.green,
                    ),
                    _buildStatCard(
                      width: cardWidth,
                      height: cardHeight,
                      title: 'Attendance Rate',
                      value: '98%',
                      icon: Icons.calendar_today,
                      iconColor: Colors.white,
                      circleColor: const Color(0xFF7A1C1C),
                      footerText: '↑ 2 days absent',
                      footerColor: Colors.green,
                    ),
                    _buildStatCard(
                      width: cardWidth,
                      height: cardHeight,
                      title: 'Lowest Score',
                      value: '68.3%',
                      icon: Icons.trending_down,
                      iconColor: Colors.white,
                      circleColor: const Color(0xFF1C3A5E),
                      footerText: '↓ Needs attention',
                      footerColor: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: FluidNavBar(
        icons:[
          FluidNavBarIcon(icon: Icons.home),
          FluidNavBarIcon(icon: Icons.access_time),
          FluidNavBarIcon(icon: Icons.menu_book),
          FluidNavBarIcon(icon: Icons.note_add),
        ],
        onChange:(index){
          if(index==2) {
            Navigator.push(context, MaterialPageRoute(builder: (_)=>ReportsScreen()));
          }
        },
        style:FluidNavBarStyle(
          barBackgroundColor:Color(0xFF0F172A),
          iconSelectedForegroundColor:Colors.white,
        ),
      ),
    );
  }
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.5),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.black),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(color: Colors.black, fontSize: 10)),
          const Spacer(),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(color: Color(0xFF1E296B), fontWeight: FontWeight.w500, fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildStatCard({
    required double width,
    required double height,
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
    required Color circleColor,
    required String footerText,
    Color footerColor = Colors.grey,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: circleColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 30),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
          Text(
            footerText.isNotEmpty ? footerText : ' ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

