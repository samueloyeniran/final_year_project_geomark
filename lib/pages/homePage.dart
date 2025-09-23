//
import 'package:flutter/material.dart';
import 'package:geomark/components/MyButton.dart';
import 'package:geomark/pages/Attendance_history.dart';
import 'package:geomark/pages/mobile_Scanner.dart';
import 'package:intl/intl.dart'; // Add this for date & time formatting
import 'package:geomark/components/AppColor.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  Stream<DateTime> getTime() async* {
    while (true) {
      yield DateTime.now();
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("GEOMARK", style: TextStyle(color: Colors.white)),
          ),
          backgroundColor: AppColors.appbarcolor,
        ),
        body: Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi Samuel, ready for class?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications, size: 30),
                      color: AppColors.primaryDark,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Date + Time row
                StreamBuilder<DateTime>(
                  stream: getTime(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final time = snapshot.data!;
                      final formattedDate = DateFormat(
                        'EEEE, MMMM d, yyyy • hh:mm a',
                      ).format(time);

                      return Text(
                        formattedDate,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textSecondary,
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today's Schedule",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                leading: Icon(Icons.class_),
                                title: Text("Class ${index + 1}"),
                                subtitle: Text("Details of class ${index + 1}"),
                              ),
                            );
                          },
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                        ),
                      ),
                      SizedBox(height: 10),
                      Mybutton(
                        text: "View Full Schedule",
                        onPressed: () {},
                        icon: Icons.schedule,
                      ),
                      SizedBox(height: 15),
                      Mybutton(
                        text: "Attendance History",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AttendanceHistory(),
                            ),
                          );
                        },
                        icon: Icons.history,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),

                Mybutton(
                  text: "Scan QR Code",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MobileScannerPage(),
                      ),
                    );
                  },
                  icon: Icons.qr_code,
                  //backgroundColor: AppColors.primaryDark,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
