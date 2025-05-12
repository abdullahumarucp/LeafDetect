import 'package:flutter/material.dart';
import 'gradient_background.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Leaf Detect ProCare',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF4CAF50),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Image
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/plant_header.png'), // Ensure this asset is added
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // App Title
                const Text(
                  'Leaf Detect ProCare',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                  ),
                ),
                const SizedBox(height: 8),

                // App Subtitle
                Text(
                  'Your Ultimate Plant Care Companion',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),

                // App Description Card
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'What We Do',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF388E3C),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Leaf Detect ProCare is a revolutionary app designed to help plant enthusiasts and gardeners keep their plants thriving. Using advanced image recognition technology, our app analyzes plant leaves to detect diseases, nutrient deficiencies, and other health issues. Whether you\'re a seasoned gardener or a beginner, our app provides personalized care tips, watering schedules, and expert advice to ensure your plants flourish.',
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Our Mission Section
                const Text(
                  'Our Mission',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'At Leaf Detect ProCare, we believe that everyone can be a plant parent. Our mission is to empower users with the tools and knowledge they need to nurture their plants and create vibrant, green spaces. We aim to make plant care accessible, engaging, and rewarding for all.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 24),

                // Key Features Section
                const Text(
                  'Key Features',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  leading: const Icon(Icons.camera_alt, color: Color(0xFF4CAF50)),
                  title: const Text(
                    'Leaf Analysis',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                    'Instantly diagnose plant health issues by scanning leaves with your camera.',
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.lightbulb_outline, color: Color(0xFF4CAF50)),
                  title: const Text(
                    'Care Tips',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                    'Receive tailored advice on watering, fertilizing, and pruning your plants.',
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.group, color: Color(0xFF4CAF50)),
                  title: const Text(
                    'Community',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                    'Connect with other plant lovers, share tips, and showcase your green space.',
                  ),
                ),
                const SizedBox(height: 24),

                // How It Works Section
                const Text(
                  'How It Works',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '1. **Scan Your Plant**: Use your phone\'s camera to capture an image of your plant\'s leaves.\n'
                  '2. **Get a Diagnosis**: Our AI analyzes the image and identifies any health issues.\n'
                  '3. **Follow Care Tips**: Receive step-by-step guidance to treat and care for your plant.\n'
                  '4. **Track Progress**: Monitor your plant\'s health over time and see it thrive!',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 24),

                // Call to Action Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to home or main feature page
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Explore Now',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Contact Information
                Divider(color: Colors.grey[400]),
                const SizedBox(height: 16),
                const Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Have questions or feedback? Reach out to us at support@leafdetectprocare.com or visit our website at www.leafdetectprocare.com.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}