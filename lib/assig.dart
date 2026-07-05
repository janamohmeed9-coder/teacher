import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({super.key});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {

  final TextEditingController searchController = TextEditingController();

  String selectedValue = "All Assignment";

  List<Map<String, dynamic>> allAssignments = [
    {
      "name": "Assignment 1",
      "assignDate": "June 2",
      "deadline": "June 3",
      "grade": "Grade 11",
      "status": "Published",
    },
    {
      "name": "Assignment 2",
      "assignDate": "June 3",
      "deadline": "June 5",
      "grade": "Grade 10",
      "status": "Published",
    },
    {
      "name": "Assignment 3",
      "assignDate": "June 6",
      "deadline": "June 7",
      "grade": "Grade 11",
      "status": "Draft",
    },
    {
      "name": "Assignment 4",
      "assignDate": "June 8",
      "deadline": "June 10",
      "grade": "Grade 10",
      "status": "Pending",
    },
  ];

  List<Map<String, dynamic>> filteredAssignments = [];
  @override
  void initState() {
    super.initState();
    filteredAssignments = List.from(allAssignments);
  }
  void deleteItem(int index) {
    setState(() {
      filteredAssignments.removeAt(index);
    });
  }

  void search(String value) {
    setState(() {
      filteredAssignments = allAssignments
          .where((item) =>
          item["name"].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void filterByDropdown(String value) {
    setState(() {
      selectedValue = value;

      if (value == "All Assignment") {
        filteredAssignments = List.from(allAssignments);
      } else {
        filteredAssignments =
            allAssignments.where((item) => item["status"] == value).toList();
      }
    });
  }

  Color statusColor(String status) {
    switch (status) {
      case "Published":
        return Colors.green.shade100;
      case "Draft":
        return Colors.grey.shade300;
      default:
        return Colors.blue.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: Padding(
        padding: const EdgeInsets.all(25),

        child: Column(
          children: [
            Row(

              children: [

                Expanded(
                  flex: 3,
                  child: Container(
                    height: 55,

                    padding: const EdgeInsets.symmetric(horizontal: 15),

                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(

                        value: selectedValue,

                        dropdownColor: Colors.grey.shade700,

                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),

                        items: const [

                          DropdownMenuItem(
                            value: "All Assignment",
                            child: Text("All Assignment"),
                          ),

                        ],

                        onChanged: (value) {
                          filterByDropdown(value!);
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(

                  child: SizedBox(

                    height: 55,

                    child: TextField(
                      onChanged: search,
                      controller: searchController,

                      decoration: InputDecoration(

                        hintText: "Search Students...",

                        prefixIcon: const Icon(Icons.search),

                        filled: true,

                        fillColor: Colors.white,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),

                      ),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 35),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "All Assignment",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(

              child: Container(

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.circular(12),

                ),

                child: SingleChildScrollView(

                  scrollDirection: Axis.horizontal,

                  child: DataTable(

                    headingRowColor: MaterialStateProperty.all(
                      Colors.grey.shade200,
                    ),

                    columns: const [

                      DataColumn(label: Text("Name")),

                      DataColumn(label: Text("Assign Date")),

                      DataColumn(label: Text("Deadline")),

                      DataColumn(label: Text("Grade")),

                      DataColumn(label: Text("Status")),

                      DataColumn(label: Text("Action")),

                    ],

                    rows: filteredAssignments.asMap().entries.map((entry) {
                      int index = entry.key;
                      var item = entry.value;

                      return DataRow(

                        cells: [

                          DataCell(Text(item["name"])),

                          DataCell(Text(item["assignDate"])),

                          DataCell(Text(item["deadline"])),

                          DataCell(Text(item["grade"])),

                          DataCell(

                            Container(

                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 6,
                              ),

                              decoration: BoxDecoration(

                                color: statusColor(item["status"]),

                                borderRadius: BorderRadius.circular(20),

                              ),

                              child: Text(item["status"]),
                            ),
                          ),

                          DataCell(

                            Row(

                              children: [

                                IconButton(

                                  onPressed: () {
                                    deleteItem(index);
                                  },

                                  icon: const Icon(Icons.delete_outline),
                                ),

                                IconButton(

                                  onPressed: () {
                                    final item = filteredAssignments[index];

                                    searchController.text = item["name"];

                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        title: const Text("Edit"),
                                        content: TextField(controller: searchController),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                item["name"] = searchController.text;
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Save"),
                                          )
                                        ],
                                      ),
                                    );
                                  },

                                  icon: const Icon(Icons.edit),
                                ),

                                const SizedBox(width: 10),

                                OutlinedButton(

                                  onPressed: () {},

                                  child: const Text(
                                    "Send To Students",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );

                    }).toList(),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Align(

              alignment: Alignment.bottomRight,

              child: SizedBox(

                width: 220,

                height: 55,

                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.white,

                    foregroundColor: Colors.black,

                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(10),

                    ),
                  ),

                  onPressed: () {},

                  child: const Text(

                    "Create Assignment",

                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
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
          if(index==0) {
            Navigator.pop(context);
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