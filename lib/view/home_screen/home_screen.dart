import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project_task/core/utils/color_constant.dart';
import 'package:project_task/view/add_medicine_screen/add_medicine_screen.dart';
import 'package:project_task/view/profile_screen/profile_screen.dart';

import '../report_screen/report_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  final List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  void _changeDate(int days) {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: days));
    });
  }

  bool _showPopup = true; // Initially true to show popup

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDeviceDisconnectedPopup();
    });
  }

  void _showDeviceDisconnectedPopup() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent manual dismissal
      builder: (context) {
        Future.delayed(const Duration(seconds: 4), () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
            setState(() {
              _showPopup = false;
            });
          }
        });

        return Dialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          insetPadding: EdgeInsets.all(60),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Your Device is not\n connected",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Image.asset(
                'assets/images/popup.png', // Update with your actual image path
                height: 200,
              ),
              const SizedBox(height: 15),
              const Text(
                "Connect your device with",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blue, // Background color for buttons
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)), // Rounded bottom corners
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton.icon(
                        icon: const Icon(Icons.bluetooth, color: Colors.white),
                        label: const Text("Bluetooth", style: TextStyle(color: Colors.white)),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: Colors.white, // Divider between buttons
                    ),
                    Expanded(
                      child: TextButton.icon(
                        icon: const Icon(Icons.wifi, color: Colors.white),
                        label: const Text("Wi-Fi", style: TextStyle(color: Colors.white)),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String currentDay = DateFormat('EEEE, MMM d').format(selectedDate);
    int selectedIndex = selectedDate.weekday - 1;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white54,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Harry!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '5 Medicines Left',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_sharp, color: Colors.blue),
            onPressed: () {
            },
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/man.png'),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...daysOfWeek.sublist(0, selectedIndex).map((day) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        day,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )),
                IconButton(
                  icon: Icon(Icons.chevron_left, color: Colors.blue, size: 30),
                  onPressed: () => _changeDate(-1),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackGround,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    currentDay,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right, color: Colors.blue, size: 30),
                  onPressed: () => _changeDate(1),
                ),
                ...daysOfWeek.sublist(selectedIndex + 1).map((day) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        day,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(height: 20),
          _showPopup == false
              ? _buildMedicineList()
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/emptybox.png',
                        height: 200,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Nothing Is Here, Add a Medicine',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddMedicinesScreen()));
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: AppColors.white,
        notchMargin: 10,
        shadowColor: Colors.black,
        elevation: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.home,
                  color: Colors.blue,
                  size: 40,
                ),
                Text("Home", style: TextStyle(color: Colors.blue, fontSize: 12)),
              ],
            ),
            const SizedBox(width: 40), // Space for FAB
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReportScreen()));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/chart.png',
                    height: 40,
                    color: Colors.grey.shade400,
                  ),
                  Text("Report", style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicineList() {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      children: [
        _buildSection("Morning 08:00 am", [
          _buildMedicineCard("Calpol 500mg Tablet", 'assets/images/wticon.jpg', "Before Breakfast", "Day 01", "Taken", Icons.notifications_none, Colors.green),
          _buildMedicineCard("Calpol 500mg Tablet", 'assets/images/tablet.png', "Before Breakfast", "Day 27", "Missed", Icons.notifications_none, Colors.red),
        ]),
        _buildSection("Afternoon 02:00 pm", [
          _buildMedicineCard("Calpol 500mg Tablet", 'assets/images/waterblue.png', "After Food", "Day 01", "Snoozed", Icons.notifications_none, Colors.orange),
        ]),
        _buildSection("Night 09:00 pm", [
          _buildMedicineCard("Calpol 500mg Tablet", 'assets/images/inject.png', "Before Sleep", "Day 03", "Left", Icons.notifications_none, Colors.grey),
        ]),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> medicines) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(title, style: GoogleFonts.notoSerif(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
        Column(children: medicines),
      ],
    );
  }

  Widget _buildMedicineCard(String name, String image, String time, String day, String status, IconData icon, Color statusColor) {
    return Card(
      color: const Color(0xffedeeef),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Container(
        height: 100,
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            title: Text(name, style: GoogleFonts.notoSerif(fontWeight: FontWeight.w500)),
            subtitle: Row(
              children: [
                Expanded(child: Text("$time")),
                Expanded(child: Text("$day")),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: statusColor),
                Text(status, style: TextStyle(color: statusColor, fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
