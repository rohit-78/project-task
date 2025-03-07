import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMedicinesScreen extends StatefulWidget {
  @override
  _AddMedicinesScreenState createState() => _AddMedicinesScreenState();
}

class _AddMedicinesScreenState extends State<AddMedicinesScreen> {
  int selectedCompartment = 1;
  int totalCount = 1;
  String selectedFrequency = "Everyday";
  String selectedTimesPerDay = "Three Time";
  List<String> frequencies = ["Everyday", "Alternate Days", "Custom"];
  List<String> timesPerDay = ["One Time", "Two Time", "Three Time"];
  List<Color> colors = [
    Colors.pink.shade100,
    Colors.purple.shade200,
    Colors.red.shade200,
    Colors.green.shade200,
    Colors.orange.shade200,
    Colors.blue.shade200,
    Colors.yellow.shade200,
    Colors.pink.shade100,
    Colors.purple.shade200,
    Colors.red.shade200,
  ];
  int selectedColorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Medicines",style: TextStyle(fontWeight: FontWeight.w500)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search Medicine Name",
                  hintStyle: const TextStyle(fontWeight: FontWeight.normal,fontSize: 18),
                  suffixIcon: const Icon(Icons.mic),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text("Compartment",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: ChoiceChip(
                        label: Text("${index + 1}"),
                        selected: selectedCompartment == (index + 1),
                        onSelected: (selected) {
                          setState(() {
                            selectedCompartment = index + 1;
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),
              const Text("Colour",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(colors.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColorIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: colors[index],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedColorIndex == index
                                ? Colors.blue
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),
              const Text("Type",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
              const SizedBox(height: 16),
              const Text("Quantity",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
              Row(
                children: [
                   Expanded(
                    child: Container(
                      height:40,
                      decoration: BoxDecoration(border: Border.all(width: 0.5),borderRadius: BorderRadius.circular(10)),
                      child: const Center(child: Text('Take 1/2 Pill')),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                      decoration: BoxDecoration(border: Border.all(width: 0.5,color: Colors.blue),borderRadius: BorderRadius.circular(1)),

                      child: IconButton(icon: const Icon(Icons.remove,color: Colors.blue), onPressed: () {})),
                  const SizedBox(width: 8),
                  Container(
                      decoration: BoxDecoration(border: Border.all(width: 0.5),borderRadius: BorderRadius.circular(1),color: Colors.blue),

                      child: IconButton(icon: const Icon(Icons.add,color: Colors.white), onPressed: () {})),
                ],
              ),
              const SizedBox(height: 16),
              const Text("Total Count",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
              Slider(
                value: totalCount.toDouble(),
                min: 1,
                max: 100,
                divisions: 99,
                label: "$totalCount",
                onChanged: (value) {
                  setState(() {
                    totalCount = value.toInt();
                  });
                },
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Set Date",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5), // Border on all sides
                            borderRadius: BorderRadius.circular(14), // Reduced border radius
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Center align text and icon
                              children: [
                                Text("Today",style: TextStyle(fontSize: 18,color: Colors.black),),
                                SizedBox(width: 8), // Space between text and icon
                                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black), // Suffix icon
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5), // Border on all sides
                            borderRadius: BorderRadius.circular(14), // Reduced border radius
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Center align text and icon
                              children: [
                                Text("End Date",style: TextStyle(fontSize: 18,color: Colors.black),),
                                SizedBox(width: 8), // Space between text and icon
                                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black), // Suffix icon
                              ],
                            ),
                          ),
                        ),
                      )


                    ],
                  ),

                ],
              ),
              const SizedBox(height: 16),
              const Text("Frequency of Days",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                value: selectedFrequency,
                items: frequencies.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedFrequency = newValue as String;
                  });
                },
                decoration:  InputDecoration(

                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              const SizedBox(height: 10),
              const Text("How many times a day",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),

              const SizedBox(height: 16),
              DropdownButtonFormField(
                value: selectedTimesPerDay,
                items: timesPerDay.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedTimesPerDay = newValue as String;
                  });
                },
                decoration:  InputDecoration(

                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              const SizedBox(height: 16),
              const Column(
                children: [
                  ListTile(title: Text("Dose 1"), leading: Icon(Icons.access_time)),
                  ListTile(title: Text("Dose 2"), leading: Icon(Icons.access_time)),
                  ListTile(title: Text("Dose 3"), leading: Icon(Icons.access_time)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChoiceChip(
                    label: const Text("Before Food"),
                    selected: true,
                    onSelected: (val) {},
                    selectedColor: Colors.blue, // Color when selected
                    backgroundColor: Colors.grey[300], // Color when unselected
                  ),

                  ChoiceChip(
                    label: const Text("After Food"),
                    selected: false,
                    onSelected: (val) {},
                    selectedColor: Colors.blue,
                    backgroundColor: Colors.grey[300],
                  ),

                  ChoiceChip(
                    label: const Text("Before Sleep"),
                    selected: false,
                    onSelected: (val) {},
                    selectedColor: Colors.blue,
                    backgroundColor: Colors.grey[300],
                  ),

                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Add",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}