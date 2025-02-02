import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 

class RecordedSessionCard extends StatelessWidget {
  final String teacherName;
  final String teacherImage; 
  final String sessionLink;
  final String sessionDate;

  const RecordedSessionCard({
    super.key,
    required this.teacherName,
    required this.teacherImage,
    required this.sessionLink,
    required this.sessionDate,
  });

  // Function to open the session link
  void _launchSessionLink() async {
    final Uri url = Uri.parse(sessionLink);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $sessionLink';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Teacher's Picture
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(teacherImage), 
              ),
              const SizedBox(width: 16), 
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Teacher's Name
                    Text(
                      teacherName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Session Date
                    Text(
                      'تاريخ الجلسة: $sessionDate', 
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),

                    
                    InkWell(
                      onTap: _launchSessionLink, 
                      child: Text(
                        'رابط الجلسة المسجلة', 
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue[700],
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}