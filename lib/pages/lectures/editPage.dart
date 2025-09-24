import 'package:flutter/material.dart';
import 'package:geomark/components/AppColor.dart';

class Editpage extends StatefulWidget {
  const Editpage({super.key});

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  String? selectedCourse = 'CS101 - Introduction to Programming';
  String? selectedBuilding = 'Engineering Building A';
  String? selectedRoom = 'A-101';
  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 10, minute: 30);

  bool weekly = true;
  bool biWeekly = false;
  bool monthly = false;
  bool customPattern = false;

  Future<void> pickDate() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (date != null) {
      setState(() => selectedDate = date);
    }
  }

  Future<void> pickTime(bool isStart) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: isStart ? startTime : endTime,
    );
    if (time != null) {
      setState(() {
        if (isStart) {
          startTime = time;
        } else {
          endTime = time;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Lectures",
          style: TextStyle(
            color: AppColors.appbarTextcolor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.appbarcolor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: AppColors.appbariconcolor),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Edit Lecture Details",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Course Dropdown
            DropdownButtonFormField<String>(
              initialValue: selectedCourse,
              decoration: const InputDecoration(labelText: "Course"),
              items: const [
                DropdownMenuItem(
                  value: 'CS101 - Introduction to Programming',
                  child: Text('CS101 - Introduction to Programming'),
                ),
                DropdownMenuItem(
                  value: 'CS102 - Data Structures',
                  child: Text('CS102 - Data Structures'),
                ),
              ],
              onChanged: (value) => setState(() => selectedCourse = value),
            ),
            const SizedBox(height: 10),

            // Date Picker
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Date"),
              subtitle: Text(
                "${selectedDate.month}/${selectedDate.day}/${selectedDate.year}",
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: pickDate,
            ),

            // Building Dropdown
            DropdownButtonFormField<String>(
              initialValue: selectedBuilding,
              decoration: const InputDecoration(labelText: "Building"),
              items: const [
                DropdownMenuItem(
                  value: 'Engineering Building A',
                  child: Text('Engineering Building A'),
                ),
                DropdownMenuItem(
                  value: 'Engineering Building B',
                  child: Text('Engineering Building B'),
                ),
              ],
              onChanged: (value) => setState(() => selectedBuilding = value),
            ),
            const SizedBox(height: 10),

            // Room Dropdown
            DropdownButtonFormField<String>(
              initialValue: selectedRoom,
              decoration: const InputDecoration(labelText: "Room"),
              items: const [
                DropdownMenuItem(value: 'A-101', child: Text('A-101')),
                DropdownMenuItem(value: 'B-202', child: Text('B-202')),
              ],
              onChanged: (value) => setState(() => selectedRoom = value),
            ),
            const SizedBox(height: 10),

            // Start Time
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Start Time"),
              subtitle: Text(startTime.format(context)),
              trailing: const Icon(Icons.access_time),
              onTap: () => pickTime(true),
            ),

            // End Time
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("End Time"),
              subtitle: Text(endTime.format(context)),
              trailing: const Icon(Icons.access_time),
              onTap: () => pickTime(false),
            ),

            const SizedBox(height: 10),

            // Repeat Options (Checkboxes)
            const Text("Repeat Options", style: TextStyle(fontSize: 16)),
            CheckboxListTile(
              title: const Text("Weekly"),
              value: weekly,
              onChanged: (val) => setState(() => weekly = val!),
            ),
            CheckboxListTile(
              title: const Text("Bi-weekly"),
              value: biWeekly,
              onChanged: (val) => setState(() => biWeekly = val!),
            ),
            CheckboxListTile(
              title: const Text("Monthly"),
              value: monthly,
              onChanged: (val) => setState(() => monthly = val!),
            ),
            CheckboxListTile(
              title: const Text("Custom Pattern"),
              value: customPattern,
              onChanged: (val) => setState(() => customPattern = val!),
            ),

            const SizedBox(height: 20),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Checking for conflicts..."),
                      ),
                    );
                  },
                  child: const Text("Check for Conflicts"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Schedule Updated!")),
                    );
                  },
                  child: const Text("Update Schedule"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:geomark/components/AppColor.dart';

// class Editpage extends StatefulWidget {
//   final Map<String, dynamic> scheduleData;

//   const Editpage({super.key, required this.scheduleData});

//   @override
//   State<Editpage> createState() => _EditpageState();
// }

// class _EditpageState extends State<Editpage> {
//   late String? selectedCourse;
//   late String? selectedBuilding;
//   late String? selectedRoom;
//   late DateTime selectedDate;
//   late TimeOfDay startTime;
//   late TimeOfDay endTime;

//   bool weekly = true;
//   bool biWeekly = false;
//   bool monthly = false;
//   bool customPattern = false;

//   @override
//   void initState() {
//     super.initState();
//     selectedCourse = widget.scheduleData["course"];
//     selectedBuilding = widget.scheduleData["building"];
//     selectedRoom = widget.scheduleData["room"];
//     selectedDate = DateTime.tryParse(widget.scheduleData["date"]) ?? DateTime.now();
//     startTime = _parseTime(widget.scheduleData["startTime"]);
//     endTime = _parseTime(widget.scheduleData["endTime"]);
//   }

//   TimeOfDay _parseTime(String timeString) {
//     final parts = timeString.split(":");
//     final hour = int.tryParse(parts[0]) ?? 0;
//     final minute = int.tryParse(parts[1]) ?? 0;
//     return TimeOfDay(hour: hour, minute: minute);
//   }

//   Future<void> pickDate() async {
//     final DateTime? date = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2030),
//     );
//     if (date != null) {
//       setState(() => selectedDate = date);
//     }
//   }

//   Future<void> pickTime(bool isStart) async {
//     final TimeOfDay? time = await showTimePicker(
//       context: context,
//       initialTime: isStart ? startTime : endTime,
//     );
//     if (time != null) {
//       setState(() {
//         if (isStart) {
//           startTime = time;
//         } else {
//           endTime = time;
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Edit Lectures",
//           style: TextStyle(
//             color: AppColors.appbarTextcolor,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: AppColors.appbarcolor,
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: Icon(Icons.arrow_back, color: AppColors.appbariconcolor),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Text(
//                 "Edit Lecture Details",
//                 style: const TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Course Dropdown
//             DropdownButtonFormField<String>(
//               value: selectedCourse,
//               decoration: const InputDecoration(labelText: "Course"),
//               items: const [
//                 DropdownMenuItem(
//                   value: 'CS101 - Introduction to Programming',
//                   child: Text('CS101 - Introduction to Programming'),
//                 ),
//                 DropdownMenuItem(
//                   value: 'CS102 - Data Structures',
//                   child: Text('CS102 - Data Structures'),
//                 ),
//               ],
//               onChanged: (value) => setState(() => selectedCourse = value),
//             ),
//             const SizedBox(height: 10),

//             // Date Picker
//             ListTile(
//               contentPadding: EdgeInsets.zero,
//               title: const Text("Date"),
//               subtitle: Text(
//                 "${selectedDate.month}/${selectedDate.day}/${selectedDate.year}",
//               ),
//               trailing: const Icon(Icons.calendar_today),
//               onTap: pickDate,
//             ),

//             // Building Dropdown
//             DropdownButtonFormField<String>(
//               value: selectedBuilding,
//               decoration: const InputDecoration(labelText: "Building"),
//               items: const [
//                 DropdownMenuItem(
//                   value: 'Engineering Building A',
//                   child: Text('Engineering Building A'),
//                 ),
//                 DropdownMenuItem(
//                   value: 'Engineering Building B',
//                   child: Text('Engineering Building B'),
//                 ),
//               ],
//               onChanged: (value) => setState(() => selectedBuilding = value),
//             ),
//             const SizedBox(height: 10),

//             // Room Dropdown
//             DropdownButtonFormField<String>(
//               value: selectedRoom,
//               decoration: const InputDecoration(labelText: "Room"),
//               items: const [
//                 DropdownMenuItem(value: 'A-101', child: Text('A-101')),
//                 DropdownMenuItem(value: 'B-202', child: Text('B-202')),
//               ],
//               onChanged: (value) => setState(() => selectedRoom = value),
//             ),
//             const SizedBox(height: 10),

//             // Start Time
//             ListTile(
//               contentPadding: EdgeInsets.zero,
//               title: const Text("Start Time"),
//               subtitle: Text(startTime.format(context)),
//               trailing: const Icon(Icons.access_time),
//               onTap: () => pickTime(true),
//             ),

//             // End Time
//             ListTile(
//               contentPadding: EdgeInsets.zero,
//               title: const Text("End Time"),
//               subtitle: Text(endTime.format(context)),
//               trailing: const Icon(Icons.access_time),
//               onTap: () => pickTime(false),
//             ),

//             const SizedBox(height: 10),

//             // Repeat Options (Checkboxes)
//             const Text("Repeat Options", style: TextStyle(fontSize: 16)),
//             CheckboxListTile(
//               title: const Text("Weekly"),
//               value: weekly,
//               onChanged: (val) => setState(() => weekly = val!),
//             ),
//             CheckboxListTile(
//               title: const Text("Bi-weekly"),
//               value: biWeekly,
//               onChanged: (val) => setState(() => biWeekly = val!),
//             ),
//             CheckboxListTile(
//               title: const Text("Monthly"),
//               value: monthly,
//               onChanged: (val) => setState(() => monthly = val!),
//             ),
//             CheckboxListTile(
//               title: const Text("Custom Pattern"),
//               value: customPattern,
//               onChanged: (val) => setState(() => customPattern = val!),
//             ),

//             const SizedBox(height: 20),

//             // Buttons Row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 OutlinedButton(
//                   onPressed: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text("Checking for conflicts..."),
//                       ),
//                     );
//                   },
//                   child: const Text("Check for Conflicts"),
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 15,
//                     ),
//                     textStyle: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   onPressed: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Schedule Updated!")),
//                     );
//                   },
//                   child: const Text("Update Schedule"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
