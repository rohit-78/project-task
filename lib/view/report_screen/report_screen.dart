import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_task/view/home_screen/home_screen.dart';
import '../../core/utils/color_constant.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: const Text('Report', style: TextStyle(fontWeight: FontWeight.w500)),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildReportCard(),
            const SizedBox(height: 10),
            _buildDashboardCard(),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Check History', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                Icon(Icons.arrow_forward_ios,color: AppColors.blue,)
              ],
            ),
            const SizedBox(height: 10),
            _buildCheckHistory(),
            const SizedBox(height: 20),
            _buildMedicineList()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {},
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
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.grey.shade400,
                    size: 40,
                  ),
                  Text("Home", style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(width: 40), // Space for FAB
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/chart.png',
                  height: 40,
                  color: Colors.blue,
                ),
                const Text("Report", style: TextStyle(color: Colors.blue, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard() {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Today's Report", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildReportItem('Total', '5'),
                _buildReportItem('Taken', '3'),
                _buildReportItem('Missed', '1'),
                _buildReportItem('Snoozed', '1'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportItem(String title, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue)),
        Text(title, style: const TextStyle(fontSize: 18, color: Colors.grey)),
      ],
    );
  }

  Widget _buildDashboardCard() {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      child: Row(
        children: [
          const Expanded(
            child: ListTile(
              title: Column(
                children: [
                  Text('Check Dashboard', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  SizedBox(height: 10),
                  Text('Here you will find everything related to your active and past medicines.', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ),
          Expanded(child: Container(height: 100, child: Image.asset('assets/images/circlechart.png')))
        ],
      ),
    );
  }

  Widget _buildMedicineList() {
    return SingleChildScrollView(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection("Morning 08:00 am", [
            _buildMedicineCard("Calpol 500mg Tablet", 'assets/images/waterblue.png', "Before Breakfast", "Day 01", "Snoozed", Icons.notifications_none, Colors.orange),
            _buildMedicineCard("Calpol 500mg Tablet", 'assets/images/tablet.png', "Before Breakfast", "Day 27", "Missed", Icons.notifications_none, Colors.red),
          ]),
          _buildSection("Afternoon 02:00 pm", [
            _buildMedicineCard("Calpol 500mg Tablet", 'assets/images/waterblue.png', "After Food", "Day 01", "Snoozed", Icons.notifications_none, Colors.orange),
          ]),
        ],
      ),
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

  Widget _buildCheckHistory() {
    List<String> days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    List<String> dates = ['1', '2', '3', '4', '5', '6', '7'];
    int selectedIndex = 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(days.length, (index) {
        return Column(
          children: [
            Text(
              days[index],
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            CircleAvatar(
              backgroundColor: index == selectedIndex ? Colors.blue : Colors.grey[200],
              child: Text(
                dates[index],
                style: TextStyle(
                  color: index == selectedIndex ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      }),
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

  Widget _buildDateSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return CircleAvatar(
          backgroundColor: index == 0 ? Colors.blue : Colors.grey[300],
          child: Text('${index + 1}', style: TextStyle(color: index == 0 ? Colors.white : Colors.black)),
        );
      }),
    );
  }

  Widget _buildMedicationSection(String title, List<Widget> meds) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Column(children: meds),
      ],
    );
  }

  Widget _buildMedicationCard(String name, String timing, String day, String status, Color statusColor) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const Icon(Icons.opacity, color: Colors.purple),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$timing \n $day'),
        trailing: Icon(Icons.circle, color: statusColor),
      ),
    );
  }
}
