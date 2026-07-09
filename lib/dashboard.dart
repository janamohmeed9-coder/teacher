import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:fluterrr/view%20profile.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

class dachbord extends StatelessWidget {
  const dachbord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Text(
                'My Course',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
            _buildCourseCard(),

            const SizedBox(height: 16),
            _buildAssignmentsAndCalendarRow(),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text(
                'Course Overview',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
            _buildOverviewSection(),

            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: FluidNavBar(
        icons:[
          FluidNavBarIcon(icon: Icons.dashboard),
          FluidNavBarIcon(icon: Icons.menu),
          FluidNavBarIcon(icon: Icons.book_rounded),
          FluidNavBarIcon(icon: Icons.star_rounded),
          FluidNavBarIcon(icon: Icons.person),
        ],
        onChange:(index){
          if(index==3) {
            Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewStudentScreen()));
          }
        },
        style:FluidNavBarStyle(
          barBackgroundColor:Color(0xFF0F172A),
          iconSelectedForegroundColor:Colors.white,
        ),
      ),
    );
  }
  Widget _buildHeader() {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomHeaderClipper(),
          child: Container(
            height: 220,
            color: const Color(0xFF6A0404),
            padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.segment, color: Colors.white, size: 28),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_none, color: Colors.white, size: 28),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Welcome Back ,MR Ali 👋',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 15),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, height: 1.4),
                    children: [
                      TextSpan(text: "Let's inspire ,\nteach, and "),
                      TextSpan(
                        text: "impact",
                        style: TextStyle(color: Color(0xFF9D97B5)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 90,
          right: 20,
          child:  Image.asset(
            "assets/images/1.jpeg",
            width: 70,
            height: 70,


          ),
        ),
      ],
    );
  }
  Widget _buildCourseCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF091E3A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white24,
                      child: FlutterLogo(size: 22),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Flutter',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Grade 12',
                          style: TextStyle(color: Colors.white60, fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCourseStat('Students', '38'),
                    Container(height: 25, width: 1, color: Colors.white24),
                    _buildCourseStat('Lessons', '7'),
                    Container(height: 25, width: 1, color: Colors.white24),
                    _buildCourseStat('topics', '12'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              height: 80,
              width: 1,
              color: Colors.white10,
            ),
          ),
          Expanded(
            flex: 45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                    'Course Progress',
                    style: TextStyle(color: Colors.white70, fontSize: 13)
                ),
                const SizedBox(height: 5),
                const Text(
                    '68%',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const LinearProgressIndicator(
                    value: 0.68,
                    minHeight: 6,
                    backgroundColor: Colors.white12,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF5D7893)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseStat(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.white60, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
  Widget _buildAssignmentsAndCalendarRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 35,
            child: Container(
              height: 210,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE3EDF7), Color(0xFFADC4DC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.edit_note, size: 40, color: Color(0xFF091E3A)),
                  SizedBox(height: 12),
                  Text(
                    'Number of assignments',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '12',
                    style: TextStyle(color: Color(0xFF091E3A), fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 65,
            child: Container(
              height: 220,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
                ],
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: DateTime(2026, 6, 25),
                calendarFormat: CalendarFormat.month,
                rowHeight: 24,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  leftChevronIcon: Icon(Icons.chevron_left, size: 16),
                  rightChevronIcon: Icon(Icons.chevron_right, size: 16),
                  headerMargin: EdgeInsets.only(bottom: 4),
                  headerPadding: EdgeInsets.zero,
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black54),
                  weekendStyle: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black54),
                ),
                calendarStyle: CalendarStyle(
                  defaultTextStyle: const TextStyle(fontSize: 9),
                  weekendTextStyle: const TextStyle(fontSize: 9),
                  outsideDaysVisible: false,
                  cellMargin: const EdgeInsets.all(2),
                  selectedDecoration: const BoxDecoration(
                    color: Color(0xFF091E3A),
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF091E3A), width: 1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildOverviewSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF09153A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    'Attendance',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),
                  CircularPercentIndicator(
                    radius: 55.0,
                    lineWidth: 12.0,
                    percent: 0.23,
                    center: const Text(
                      "23%",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Colors.white,
                    progressColor:  Color(0xFF5D7093),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'performance Overview',
                    style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildBarChartColumn('sun', 0.75),
                      _buildBarChartColumn('Mon', 0.95),
                      _buildBarChartColumn('Tue', 0.70),
                      _buildBarChartColumn('Wed', 0.50),
                      _buildBarChartColumn('Thu', 0.50),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChartColumn(String day, double heightPercentage) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 12,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            heightFactor: heightPercentage,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF7B91A6),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          day,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ],
    );
  }
}
class CustomHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height - 70);
    var secondEndPoint = Offset(size.width, size.height - 20);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}