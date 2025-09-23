// import 'package:flutter/material.dart';
// import 'package:geomark/components/AppColor.dart';
// import 'package:geomark/pages/lectures/Lecturers_homePage.dart';

// class Schedulepage extends StatelessWidget {
//   const Schedulepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             "Schedule Classes",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: AppColors.appbarTextcolor,
//             ),
//           ),

//           leading: IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LecturersHomepage()),
//               );
//             },
//             icon: Icon(Icons.arrow_back, color: AppColors.appbariconcolor),
//           ),
//           backgroundColor: AppColors.appbarcolor,
//         ),
//         body: Container(
//           padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 "schedule a lecture",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.textPrimary,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:geomark/components/AppColor.dart';
import 'package:geomark/pages/lectures/Lecturers_homePage.dart';

class Schedulepage extends StatefulWidget {
  const Schedulepage({super.key});

  @override
  State<Schedulepage> createState() => _SchedulepageState();
}

class _SchedulepageState extends State<Schedulepage> {
  String? selectedCourse;
  String? selectedBuilding;
  String? selectedRoom;
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  // Repeat options
  bool weekly = false;
  bool biWeekly = false;
  bool monthly = false;
  bool customPattern = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.appbarcolor,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LecturersHomepage(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.appbariconcolor,
            ),
          ),
          title: Text(
            "Schedule Lecture",
            style: TextStyle(color: AppColors.appbarTextcolor),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TITLE
              Text(
                "Schedule a lecture",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 20),

              /// COURSE DROPDOWN
              _buildDropdown(
                label: "Course",
                value: selectedCourse,
                items: ["CS101", "MATH201", "PHY301"],
                onChanged: (val) => setState(() => selectedCourse = val),
              ),

              /// DATE PICKER
              _buildDatePicker(),

              /// BUILDING DROPDOWN
              _buildDropdown(
                label: "Building",
                value: selectedBuilding,
                items: ["Science Block", "Engineering Block", "Main Hall"],
                onChanged: (val) => setState(() => selectedBuilding = val),
              ),

              /// ROOM DROPDOWN
              _buildDropdown(
                label: "Room",
                value: selectedRoom,
                items: ["A-101", "B-205", "C-301"],
                onChanged: (val) => setState(() => selectedRoom = val),
              ),

              /// START TIME PICKER
              _buildTimePicker(
                label: "Start Time",
                selectedTime: startTime,
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) setState(() => startTime = time);
                },
              ),

              /// END TIME PICKER
              _buildTimePicker(
                label: "End Time",
                selectedTime: endTime,
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) setState(() => endTime = time);
                },
              ),

              const SizedBox(height: 10),

              /// REPEAT OPTIONS
              Text(
                "Repeat Options",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Row(
                children: [
                  _buildCheckbox(
                    "Weekly",
                    weekly,
                    (val) => setState(() => weekly = val!),
                  ),
                  _buildCheckbox(
                    "Bi-weekly",
                    biWeekly,
                    (val) => setState(() => biWeekly = val!),
                  ),
                ],
              ),
              Row(
                children: [
                  _buildCheckbox(
                    "Monthly",
                    monthly,
                    (val) => setState(() => monthly = val!),
                  ),
                  _buildCheckbox(
                    "Custom Pattern",
                    customPattern,
                    (val) => setState(() => customPattern = val!),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// BUTTONS
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Check for Conflicts"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Save Schedule"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// SCHEDULE PREVIEW
              _buildSchedulePreview(),
            ],
          ),
        ),
      ),
    );
  }

  /// Dropdown Builder
  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: AppColors.textPrimary)),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: value,
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  /// Date Picker Widget
  Widget _buildDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Date", style: TextStyle(color: AppColors.textPrimary)),
        const SizedBox(height: 5),
        InkWell(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2023),
              lastDate: DateTime(2030),
            );
            if (picked != null) setState(() => selectedDate = picked);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              selectedDate == null
                  ? "Select date"
                  : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
              style: TextStyle(color: AppColors.textPrimary),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  /// Time Picker Widget
  Widget _buildTimePicker({
    required String label,
    required TimeOfDay? selectedTime,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: AppColors.textPrimary)),
        const SizedBox(height: 5),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              selectedTime == null
                  ? "Select time"
                  : selectedTime.format(context),
              style: TextStyle(color: AppColors.textPrimary),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  /// Checkbox Widget
  Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
    return Expanded(
      child: CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(label, style: TextStyle(fontSize: 14)),
        value: value,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  /// Schedule Preview Card
  Widget _buildSchedulePreview() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Schedule Preview",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          _buildPreviewRow("Course:", selectedCourse),
          _buildPreviewRow("Location:", selectedBuilding),
          _buildPreviewRow(
            "Time:",
            startTime != null && endTime != null
                ? "${startTime!.format(context)} - ${endTime!.format(context)}"
                : null,
          ),
          _buildPreviewRow(
            "Date:",
            selectedDate != null
                ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildPreviewRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: AppColors.textPrimary)),
          Text(
            value ?? "Not selected",
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
