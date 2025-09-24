import 'package:flutter/material.dart';
import 'package:geomark/components/AppColor.dart';

//  Attendance Model
class AttendanceRecord {
  final String course;
  final String status; // Present, Absent, Late
  final DateTime date;
  final String session; // Morning, Afternoon

  AttendanceRecord({
    required this.course,
    required this.status,
    required this.date,
    required this.session,
  });
}

class AttendanceHistory extends StatelessWidget {
  const AttendanceHistory({super.key});

  // Dummy Data
  List<AttendanceRecord> get attendanceRecords => [
    AttendanceRecord(
      course: "Mathematics",
      status: "Present",
      date: DateTime(2024, 1, 15),
      session: "Morning",
    ),
    AttendanceRecord(
      course: "Physics",
      status: "Present",
      date: DateTime(2024, 1, 15),
      session: "Afternoon",
    ),
    AttendanceRecord(
      course: "Chemistry",
      status: "Late",
      date: DateTime(2024, 1, 16),
      session: "Morning",
    ),
    AttendanceRecord(
      course: "Mathematics",
      status: "Present",
      date: DateTime(2024, 1, 16),
      session: "Morning",
    ),
    AttendanceRecord(
      course: "Physics",
      status: "Absent",
      date: DateTime(2024, 1, 17),
      session: "Afternoon",
    ),
    AttendanceRecord(
      course: "English",
      status: "Present",
      date: DateTime(2024, 1, 17),
      session: "Morning",
    ),
    AttendanceRecord(
      course: "Chemistry",
      status: "Present",
      date: DateTime(2024, 1, 18),
      session: "Morning",
    ),
    AttendanceRecord(
      course: "Mathematics",
      status: "Present",
      date: DateTime(2024, 1, 18),
      session: "Morning",
    ),
    AttendanceRecord(
      course: "English",
      status: "Late",
      date: DateTime(2024, 1, 19),
      session: "Morning",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    String? selectedCourse;
    String? selectedMonth;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.appbarcolor,
          centerTitle: true,
          title: const Text(
            'ATTENDANCE HISTORY',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔲 Filter Box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.calendar_today, size: 20),
                        SizedBox(width: 8),
                        Text(
                          "Filters",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    //  Course Dropdown
                    const Text(
                      "Course",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    DropdownButtonFormField<String>(
                      initialValue: selectedCourse,
                      hint: const Text("All Courses"),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12,
                        ),
                      ),
                      items:
                          [
                                "CSC 319",
                                "CSC 419",
                                "CSC 212",
                                "CSC 111",
                                "CSC 101",
                                "CSC 201",
                                "CSC 301",
                                "CSC 401",
                                "CSC 421",
                                "CSC 222",
                                "CSC 322",
                                "CSC 422",
                                "CSC 223",
                                "CSC 323",
                                "CSC 423",
                              ]
                              .map(
                                (course) => DropdownMenuItem(
                                  value: course,
                                  child: Text(course),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        selectedCourse = value;
                      },
                    ),

                    const SizedBox(height: 16),

                    //  Month Dropdown
                    const Text(
                      "Month",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    DropdownButtonFormField<String>(
                      initialValue: selectedMonth,
                      hint: const Text("All Months"),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12,
                        ),
                      ),
                      items:
                          [
                                "January",
                                "February",
                                "March",
                                "April",
                                "May",
                                "June",
                                "July",
                                "August",
                                "September",
                                "October",
                                "November",
                                "December",
                              ]
                              .map(
                                (month) => DropdownMenuItem(
                                  value: month,
                                  child: Text(month),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        selectedMonth = value;
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Attendance Records Header
              const Text(
                "Attendance Records",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Attendance List
              Expanded(
                child: ListView.builder(
                  itemCount: attendanceRecords.length,
                  itemBuilder: (context, index) {
                    final record = attendanceRecords[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🔹 Course + Status Chip
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                record.course,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              _buildStatusChip(record.status),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // 🔹 Date + Session
                          Row(
                            children: [
                              const Icon(Icons.calendar_today, size: 16),
                              const SizedBox(width: 6),
                              Text(
                                _formatDate(record.date),
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(width: 16),
                              const Icon(Icons.access_time, size: 16),
                              const SizedBox(width: 6),
                              Text(
                                record.session,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper: Format Date
  String _formatDate(DateTime date) {
    return "${_getWeekday(date.weekday)}, ${_getMonth(date.month)} ${date.day}, ${date.year}";
  }

  String _getWeekday(int weekday) {
    const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return days[weekday - 1];
  }

  String _getMonth(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[month - 1];
  }

  //  Helper: Status Chip
  Widget _buildStatusChip(String status) {
    Color color;
    switch (status) {
      case "Present":
        color = Colors.green;
        break;
      case "Absent":
        color = Colors.red;
        break;
      case "Late":
        color = Colors.orange;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
