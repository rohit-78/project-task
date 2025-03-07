import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final List<Map<String, String>> caretakers = [
    {"name": "Dipa Luna", "image": 'assets/images/man.png'}, // Placeholder image
    {"name": "Roz Sod..", "image": "assets/images/man.png"},
    {"name": "Sunny Tu..", "image": "assets/images/man.png"},
    {"name": "Sunny Tu..", "image": "assets/images/man.png"},
    {"name": "Sunny Tu..", "image": "assets/images/man.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("",style: TextStyle(fontWeight: FontWeight.w500)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height, // Full Screen
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              const Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/man.png"),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Take Care!",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Text(
                        "Richa Bose",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 20),

              // Settings Section
              buildSettingsSection(),

              // Device Section
              buildDeviceSection(),

              // Caretakers Section
          Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...caretakers.map((caretaker) => buildCaretakerItem(caretaker)).toList(),
              ],
          ),
              SizedBox(height: 20),
              // Doctor Section

              // Additional Options

              // Log Out Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Log Out"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSettingsSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Settings", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Notification"),
          subtitle: Text("Check your medicine notification"),
        ),
        ListTile(
          leading: Icon(Icons.volume_up),
          title: Text("Sound"),
          subtitle: Text("Ring, Silent, Vibrate"),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Manage Your Account"),
          subtitle: Text("Password, Email ID, Phone Number"),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Notification"),
          subtitle: Text("Check your medicine notification"),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Notification"),
          subtitle: Text("Check your medicine notification"),
        ),
      ],
    );
  }

  Widget buildDeviceSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Device", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Column(
            children: [

              ListTile(
                leading: Icon(Icons.bluetooth),
                title: Text("Connect"),
                subtitle: Text("Bluetooth, Wi-Fi"),
              ),
              ListTile(
                leading: Icon(Icons.volume_up),
                title: Text("Sound Option"),
                subtitle: Text("Ring, Silent, Vibrate"),
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget buildCaretakerItem(Map<String, String> caretaker) {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Prevent column from taking full height
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: caretaker["image"] != null
                ? AssetImage(caretaker["image"]!)
                : null,
            backgroundColor: Colors.grey.shade300,
            child: caretaker["image"] == null
                ? Icon(Icons.person, color: Colors.grey, size: 30)
                : null,
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 60, // To ensure text remains inside the UI
            child: Text(
              caretaker["name"]!,
              style: TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }




  Widget buildDoctorSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Icon(Icons.add, size: 40),
          const Text("Add Your Doctor"),
          TextButton(
            onPressed: () {},
            child: const Text("Or use invite link"),
          ),
        ],
      ),
    );
  }

  Widget buildAdditionalOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(onPressed: () {}, child: const Text("Privacy Policy")),
        TextButton(onPressed: () {}, child: const Text("Terms of Use")),
        TextButton(onPressed: () {}, child: const Text("Rate Us")),
        TextButton(onPressed: () {}, child: const Text("Share")),
      ],
    );
  }
}
