// import 'package:flutter/material.dart';
// import 'package:geomark/components/AppColor.dart';

// class LecturersHomepage extends StatelessWidget {
//   const LecturersHomepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back,
//               color: AppColors.appbariconcolor,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           backgroundColor: AppColors.appbarcolor,
//           title: Text(
//             "Lecturer's Home Page",
//             style: TextStyle(
//               color: AppColors.appbarTextcolor,
//               fontWeight: FontWeight.bold,
//               fontSize: 24,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         backgroundColor: AppColors.background,
//         body: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Text(
//                     "Manage your lectures schedules efficiently\nconflict detection and room allocation.",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.textPrimary,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: AppColors.cardBackground,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: const Offset(
//                           0,
//                           3,
//                         ), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   margin: const EdgeInsets.only(top: 30),
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Today's Lectures",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: AppColors.textPrimary,
//                             ),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.schedule),
//                             color: AppColors.iconcolor,
//                             onPressed: () {
//                               // Refresh action
//                             },
//                           ),
//                         ],
//                       ),
//                       Text("4"),
//                       Text("2 more than yesyerday"),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:geomark/components/AppColor.dart';
import 'package:geomark/pages/lectures/schedulePage.dart';
import 'package:geomark/pages/lectures/ScheduledPage.dart';

class LecturersHomepage extends StatelessWidget {
  const LecturersHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.appbarcolor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.appbariconcolor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Lecture Scheduling Dashboard",
            style: TextStyle(
              color: AppColors.appbarTextcolor,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Intro Text
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Manage your lecture schedules efficiently with conflict detection and room booking",
                  style: TextStyle(fontSize: 16, color: AppColors.textPrimary),
                ),
              ),

              /// Dashboard Cards
              _buildDashboardCard(
                title: "Today's Lectures",
                value: "4",
                subtitle: "2 more than yesterday",
                icon: Icons.calendar_today,
                iconColor: Colors.blue,
              ),
              _buildDashboardCard(
                title: "This Week",
                value: "18",
                subtitle: "Scheduled lectures",
                icon: Icons.access_time,
                iconColor: Colors.deepPurple,
              ),
              _buildDashboardCard(
                title: "Room Conflicts",
                value: "2",
                subtitle: "Need resolution",
                icon: Icons.warning_amber_rounded,
                iconColor: Colors.orange,
              ),
              _buildDashboardCard(
                title: "Available Rooms",
                value: "12",
                subtitle: "Right now",
                icon: Icons.meeting_room_outlined,
                iconColor: Colors.green,
              ),

              /// Quick Actions Section
              _buildQuickActionsSection(context),

              /// Recent Activity Section
              _buildRecentActivitySection(),
            ],
          ),
        ),
      ),
    );
  }

  /// Reusable Widget for Dashboard Cards
  Widget _buildDashboardCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Left Side (Text)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),
            ],
          ),

          /// Right Side (Icon)
          Icon(icon, color: iconColor, size: 30),
        ],
      ),
    );
  }

  /// Quick Actions Section
  Widget _buildQuickActionsSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Actions",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Common tasks for lecture scheduling",
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 16),

          /// Buttons
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Schedulepage()),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text("Schedule New Lecture"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondary,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ScheduledPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.calendar_month),
            label: const Text("View All Schedules"),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              side: const BorderSide(color: Colors.black12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Recent Activity Section
  Widget _buildRecentActivitySection() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Activity",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Latest scheduling updates",
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 16),

          /// Activity List
          _buildActivityItem(
            color: Colors.green,
            text: "CS101 scheduled for Room A-101",
            time: "2 minutes ago",
          ),
          _buildActivityItem(
            color: Colors.orange,
            text: "Conflict detected in Room B-205",
            time: "15 minutes ago",
          ),
          _buildActivityItem(
            color: Colors.blue,
            text: "MATH201 rescheduled successfully",
            time: "1 hour ago",
          ),
        ],
      ),
    );
  }

  /// Helper Widget for Recent Activity Items
  Widget _buildActivityItem({
    required Color color,
    required String text,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          CircleAvatar(radius: 5, backgroundColor: color),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 16, color: AppColors.textPrimary),
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
