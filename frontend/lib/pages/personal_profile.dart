import 'package:flutter/material.dart';

class PersonalProfile extends StatelessWidget {
  final String name;
  final String imagePath;
  final double rating;
  final String bio;

  const PersonalProfile({
    super.key,
    required this.name,
    required this.imagePath,
    required this.bio,
    this.rating = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF16226F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(height: 16),
            
            // Name
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF16226F),
              ),
            ),
            const SizedBox(height: 8),
            
            // Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                int reversedIndex = 4 - index;
                if (reversedIndex < rating && reversedIndex + 1 > rating) {
                  return const Icon(
                    Icons.star_half,
                    color: Colors.amber,
                  );
                } else if (reversedIndex < rating) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                } else {
                  return const Icon(
                    Icons.star_border,
                    color: Colors.amber,
                  );
                }
              }),
            ),
            const SizedBox(height: 12),
            
            // Bio
            Text(
              bio,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
