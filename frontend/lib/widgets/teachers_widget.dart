import 'package:flutter/material.dart';

class TeacherCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final double rating; 
  final String bio; 

  const TeacherCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.bio,
    this.rating = 0.0, 
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8, 
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), 
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: <Widget>[
          
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                
                Container(
                  width: 70,
                  height:70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.shade300, 
                      width: 2.0,
                    ),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Name and Rating
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.right, 
                      ),
                      const SizedBox(height: 8),
                    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start, 
                        children: List.generate(5, (index) {
                          if (index < rating && index + 1 > rating) {
                            // Half star
                            return Icon(
                              Icons.star_half,
                              color: Colors.amber, 
                              size: 20,
                            );
                          } else if (index < rating) {
                            // Full star
                            return Icon(
                              Icons.star,
                              color: Colors.amber, 
                              size: 20,
                            );
                          } else {
                            // Empty star
                            return Icon(
                              Icons.star_border,
                              color: Colors.amber, 
                              size: 20,
                            );
                          }
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Bio Section
            Text(
              bio,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700, 
                height: 1.5, 
              ),
              textAlign: TextAlign.right, 
              textDirection: TextDirection.rtl, 
            ),
            const SizedBox(height: 20),
            // Divider
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            const SizedBox(height: 10),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textDirection: TextDirection.rtl, 
              children: [
                _buildActionButton(
                  icon: Icons.call,
                  label: 'اتصل الآن', 
                  color: Colors.indigo.shade700,
                  onPressed: () {
                    // Implement Call functionality
                  },
                ),
                _buildActionButton(
                  icon: Icons.chat,
                  label: 'محادثة', 
                  color: Colors.indigo.shade700,
                  onPressed: () {
                    // Implement Chat functionality
                  },
                ),
                _buildActionButton(
                  icon: Icons.calendar_today,
                  label: 'حجز',
                  color: Colors.indigo.shade700,
                  onPressed: () {
                    // Implement Reserve functionality
                  },
                ),
              ],
            ),
          ],
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
      children: [
        IconButton(
          icon: Icon(icon, size: 26, color: color),
          onPressed: onPressed,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.bold,
          ),
          textDirection: TextDirection.rtl, 
        ),
      ],
    );
  }
}