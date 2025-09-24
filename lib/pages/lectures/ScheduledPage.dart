import 'package:flutter/material.dart';
import 'package:geomark/components/AppColor.dart';
import 'package:geomark/pages/lectures/AttendancePage.dart';
import 'package:geomark/pages/lectures/editPage.dart';

class ScheduledPage extends StatefulWidget {
  const ScheduledPage({super.key});

  @override
  State<ScheduledPage> createState() => _ScheduledPageState();
}

class _ScheduledPageState extends State<ScheduledPage> {
  String? selectedStatus;
  String? selectedBuilding;

  final List<String> statusOptions = ["All Status", "Scheduled", "Conflict"];
  final List<String> buildingOptions = [
    "All Buildings",
    "Building A",
    "Building B",
  ];

  // schedule data (dynamic for delete/edit)
  List<Map<String, dynamic>> schedules = [
    {
      "course": "CS101 - Introduction to Programming",
      "date": "2024-01-15",
      "time": "09:00 - 10:30",
      "location": "Engineering Building A, A-101",
      "students": "45 students",
      "lecturer": "Dr. Smith",
      "status": "Scheduled",
      "statusColor": Colors.green,
      "repeat": "weekly",
      "conflict": false,
    },
    {
      "course": "MATH201 - Calculus II",
      "date": "2024-01-15",
      "time": "10:00 - 11:30",
      "location": "Engineering Building B, B-205",
      "students": "38 students",
      "lecturer": "Dr. Johnson",
      "status": "Conflict",
      "statusColor": Colors.red,
      "repeat": "weekly",
      "conflict": true,
    },
    {
      "course": "ENG101 - Technical Writing",
      "date": "2024-01-15",
      "time": "16:00 - 17:30",
      "location": "Main Academic Building, M-101",
      "students": "28 students",
      "lecturer": "Prof. Davis",
      "status": "Cancelled",
      "statusColor": Colors.grey,
      "repeat": "weekly",
      "conflict": false,
    },
    {
      "course": "ENG101 - Technical Writing",
      "date": "2024-01-15",
      "time": "16:00 - 17:30",
      "location": "Main Academic Building, M-101",
      "students": "28 students",
      "lecturer": "Prof. Davis",
      "status": "Cancelled",
      "statusColor": Colors.grey,
      "repeat": "weekly",
      "conflict": false,
    },
    {
      "course": "ENG101 - Technical Writing",
      "date": "2024-01-15",
      "time": "16:00 - 17:30",
      "location": "Main Academic Building, M-101",
      "students": "28 students",
      "lecturer": "Prof. Davis",
      "status": "Cancelled",
      "statusColor": Colors.grey,
      "repeat": "weekly",
      "conflict": false,
    },
    {
      "course": "ENG101 - Technical Writing",
      "date": "2024-01-15",
      "time": "16:00 - 17:30",
      "location": "Main Academic Building, M-101",
      "students": "28 students",
      "lecturer": "Prof. Davis",
      "status": "Cancelled",
      "statusColor": Colors.grey,
      "repeat": "weekly",
      "conflict": false,
    },
    {
      "course": "ENG101 - Technical Writing",
      "date": "2024-01-15",
      "time": "16:00 - 17:30",
      "location": "Main Academic Building, M-101",
      "students": "28 students",
      "lecturer": "Prof. Davis",
      "status": "Cancelled",
      "statusColor": Colors.grey,
      "repeat": "weekly",
      "conflict": false,
    },
    {
      "course": "ENG101 - Technical Writing",
      "date": "2024-01-15",
      "time": "16:00 - 17:30",
      "location": "Main Academic Building, M-101",
      "students": "28 students",
      "lecturer": "Prof. Davis",
      "status": "Cancelled",
      "statusColor": Colors.grey,
      "repeat": "weekly",
      "conflict": false,
    },
    {
      "course": "ENG101 - Technical Writing",
      "date": "2024-01-15",
      "time": "16:00 - 17:30",
      "location": "Main Academic Building, M-101",
      "students": "28 students",
      "lecturer": "Prof. Davis",
      "status": "Cancelled",
      "statusColor": Colors.grey,
      "repeat": "weekly",
      "conflict": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    int totalSchedules = schedules.length;
    int conflicts = schedules
        .where((s) => s["conflict"] == true)
        .toList()
        .length;
    int thisWeek = schedules.length - 1; // dummy logic for demo

    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.appbariconcolor),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Schedule Lectures",
            style: TextStyle(color: AppColors.appbarTextcolor),
          ),
          backgroundColor: AppColors.appbarcolor,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Lecture Schedules",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "View and manage all your scheduled lectures here.",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Conflict Banner
              if (conflicts > 0)
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.yellow[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.yellow[700]!),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.warning, color: Colors.orange),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "You have $conflicts schedule conflict(s) that need resolution.",
                          style: TextStyle(color: Colors.orange[900]),
                        ),
                      ),
                    ],
                  ),
                ),

              // Search and Filter Section
              TextField(
                decoration: InputDecoration(
                  hintText: "Search courses, lecturers, or rooms...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedStatus,
                      hint: const Text("All Status"),
                      items: statusOptions
                          .map(
                            (status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() => selectedStatus = value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedBuilding,
                      hint: const Text("All Buildings"),
                      items: buildingOptions
                          .map(
                            (building) => DropdownMenuItem(
                              value: building,
                              child: Text(building),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() => selectedBuilding = value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Schedule Containers
              ...schedules.asMap().entries.map((entry) {
                int index = entry.key;
                var schedule = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _buildScheduleContainer(schedule, index),
                );
              }).toList(),

              const SizedBox(height: 20),

              // Stats Section
              _buildStatContainer(
                "Total Schedules",
                "$totalSchedules",
                "Active lectures",
                Colors.blueAccent,
              ),
              const SizedBox(height: 12),
              _buildStatContainer(
                "This Week",
                "$thisWeek",
                "Scheduled lectures",
                Colors.green,
              ),
              const SizedBox(height: 12),
              _buildStatContainer(
                "Conflicts",
                "$conflicts",
                "Need resolution",
                Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleContainer(Map<String, dynamic> schedule, int index) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  schedule["course"],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: schedule["statusColor"].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  schedule["status"],
                  style: TextStyle(
                    color: schedule["statusColor"],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Edit ${schedule["course"]}")),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Editpage()),
                  );
                  print("Navigated to Editpage");
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    schedules.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${schedule["course"]} deleted")),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16),
              const SizedBox(width: 6),
              Text(schedule["date"]),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16),
              const SizedBox(width: 6),
              Text(schedule["time"]),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16),
              const SizedBox(width: 6),
              Text(schedule["location"]),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.group, size: 16),
              const SizedBox(width: 6),
              Text(schedule["students"]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Text("Lecturer: ${schedule["lecturer"]}"),
                  Text("Repeats: ${schedule["repeat"]}"),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Attendancepage()),
                  );
                },
                child: Text("View Attendance"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ],
          ),

          if (schedule["conflict"]) ...[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Conflict detected: Room B-205 is double-booked at this time",
                    style: TextStyle(color: Colors.red[700], fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text("Resolve Conflict"),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatContainer(
    String title,
    String value,
    String subtitle,
    Color color,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
