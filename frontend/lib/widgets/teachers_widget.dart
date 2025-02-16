import 'package:flutter/material.dart';

class TeacherCard extends StatelessWidget {
  final String name;
  final String imagePath;

  const TeacherCard({super.key, required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, 
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), 
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.indigo.shade100], 
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.0), 
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[
              CircleAvatar(
                radius: 50, // Larger avatar
                backgroundImage: AssetImage(imagePath),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white, 
                      width: 3.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo, 
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                children: <Widget>[
                  _buildActionButton(
                    icon: Icons.call,
                    label: 'Call Now',
                    color: Colors.teal, 
                    onPressed: () {
                      // Implement Call Now functionality
                    },
                  ),
                  _buildActionButton(
                    icon: Icons.chat,
                    label: 'Chat Now',
                    color: Colors.indigo, 
                    onPressed: () {
                      // Implement Chat Now functionality
                    },
                  ),
                  _buildActionButton(
                    icon: Icons.calendar_today,
                    label: 'Reserve',
                    color: Colors.purple, 
                    onPressed: () {
                      // Implement Reserve a Session functionality
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        IconButton(
          icon: Icon(icon, size: 30, color: color), 
          onPressed: onPressed,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}