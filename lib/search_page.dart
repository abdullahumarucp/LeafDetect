import 'package:flutter/material.dart';
import 'main.dart';
import 'custom_appbar.dart';
import 'bottom_bar.dart';
import 'history_page.dart';
import 'gradient_background.dart';
import 'custom_end_drawer.dart';

class SearchPage extends StatefulWidget {
  final int currentIndex;

  const SearchPage({super.key, required this.currentIndex});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late int currentIndex;

  final List<PlantData> plantDataList = [
    PlantData(
      imagePath: 'assets/Apple.png',
      label: 'Apple Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AppleDiseaseDetails(),
          ),
        );
      },
    ),
    PlantData(
      imagePath: 'assets/Guava.png',
      label: 'Guava Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GuavaDiseaseDetails(),
          ),
        );
      },
    ),
    PlantData(
      imagePath: 'assets/Tomato.png',
      label: 'Tomato Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TomatoDiseaseDetails(),
          ),
        );
      },
    ),
    PlantData(
      imagePath: 'assets/Cherry.png',
      label: 'Cherry Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CherryDiseaseDetails(),
          ),
        );
      },
    ),
        PlantData(
      imagePath: 'assets/Lemon.png',
      label: 'Lemon Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LemonDiseaseDetails(),
          ),
        );
      },
    ),
        PlantData(
      imagePath: 'assets/Grapes.png',
      label: 'Grapes Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GrapesDiseaseDetails(),
          ),
        );
      },
    ),
        PlantData(
      imagePath: 'assets/Jamun.png',
      label: 'Jamun Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const JamunDiseaseDetails(),
          ),
        );
      },
    ),
        PlantData(
      imagePath: 'assets/Corn.png',
      label: 'Corn Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CornDiseaseDetails(),
          ),
        );
      },
    ),
        PlantData(
      imagePath: 'assets/Orange.png',
      label: 'Orange Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OrangeDiseaseDetails(),
          ),
        );
      },
    ),
        PlantData(
      imagePath: 'assets/Peach.png',
      label: 'Peach Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PeachDiseaseDetails(),
          ),
        );
      },
    ),
        PlantData(
      imagePath: 'assets/Pomegranate.png',
      label: 'Pomegranate Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PomegranateDiseaseDetails(),
          ),
        );
      },
    ),
            PlantData(
      imagePath: 'assets/Potato.png',
      label: 'Potato Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PotatoDiseaseDetails(),
          ),
        );
      },
    ),
            PlantData(
      imagePath: 'assets/Rice.png',
      label: 'Rice Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RiceDiseaseDetails(),
          ),
        );
      },
    ),
            PlantData(
      imagePath: 'assets/Rose.png',
      label: 'Rose Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RoseDiseaseDetails(),
          ),
        );
      },
    ),
            PlantData(
      imagePath: 'assets/Strawberry.png',
      label: 'Strawberry Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StrawberryDiseaseDetails(),
          ),
        );
      },
    ),
                PlantData(
      imagePath: 'assets/Sugarcane.png',
      label: 'Sugarcane Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SugarcaneDiseaseDetails(),
          ),
        );
      },
    ),
    // Add more items as needed...
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  void onTabTapped(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });

      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Firstpage(),
          ),
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HistoryPage(currentIndex: index),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      appBar: CustomAppBar(),
      endDrawer: CustomEndDrawer(),
      body: GradientBackground(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: plantDataList.length,
          itemBuilder: (context, index) {
            return ImageButtonWithTextBox(
              plantData: plantDataList[index],
            );
          },
        ),
      ),
      bottomNavigationBar: Bottompart(
        currentIndex: currentIndex,
        onTap: onTabTapped,
      ),
    );
  }
}

class PlantData {
  final String imagePath;
  final String label;
  final Function(BuildContext context) onTap; // Accept a function with context

  PlantData({
    required this.imagePath,
    required this.label,
    required this.onTap,
  });
}

class ImageButtonWithTextBox extends StatelessWidget {
  final PlantData plantData;

  const ImageButtonWithTextBox({
    super.key,
    required this.plantData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => plantData.onTap(context), // Handle the onTap event
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            // Image Button
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color.fromARGB(255, 185, 227, 175),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(128, 128, 128, 0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  plantData.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16), // Space between image and text box
            // Text Box
            Expanded(
              child: Text(
                plantData.label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 46, 114, 48),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<PlantData> plantDataList = [
    PlantData(
      imagePath: 'assets/Apple.png',
      label: 'Apple Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AppleDiseaseDetails(),
          ),
        );
      },
    ),
    PlantData(
      imagePath: 'assets/Guava.png',
      label: 'Guava Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GuavaDiseaseDetails(),
          ),
        );
      },
    ),
    PlantData(
      imagePath: 'assets/Tomato.png',
      label: 'Tomato Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TomatoDiseaseDetails(),
          ),
        );
      },
    ),
    PlantData(
      imagePath: 'assets/Cherry.png',
      label: 'Cherry Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CherryDiseaseDetails(),
          ),
        );
      },
    ),
        PlantData(
      imagePath: 'assets/Lemon.png',
      label: 'GLemon Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LemonDiseaseDetails(),
          ),
        );
      },
    ),
        PlantData(
      imagePath: 'assets/Grapes.png',
      label: 'Grapes Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GrapesDiseaseDetails(),
          ),
        );
      },
    ),
        PlantData(
      imagePath: 'assets/Jamun.png',
      label: 'Jamun Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const JamunDiseaseDetails(),
          ),
        );
      },
    ),
        PlantData(
      imagePath: 'assets/Corn.png',
      label: 'Corn Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CornDiseaseDetails(),
          ),
        );
      },
    ),
        PlantData(
      imagePath: 'assets/Orange.png',
      label: 'Orange Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OrangeDiseaseDetails(),
          ),
        );
      },
    ),
        PlantData(
      imagePath: 'assets/Peach.png',
      label: 'Peach Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PeachDiseaseDetails(),
          ),
        );
      },
    ),
        PlantData(
      imagePath: 'assets/Pomegranate.png',
      label: 'Pomegranate Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PomegranateDiseaseDetails(),
          ),
        );
      },
    ),
            PlantData(
      imagePath: 'assets/Potato.png',
      label: 'Potato Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PotatoDiseaseDetails(),
          ),
        );
      },
    ),
            PlantData(
      imagePath: 'assets/Rice.png',
      label: 'Rice Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RiceDiseaseDetails(),
          ),
        );
      },
    ),
            PlantData(
      imagePath: 'assets/Rose.png',
      label: 'Rose Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RoseDiseaseDetails(),
          ),
        );
      },
    ),
            PlantData(
      imagePath: 'assets/Strawberry.png',
      label: 'Strawberry Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StrawberryDiseaseDetails(),
          ),
        );
      },
    ),
                PlantData(
      imagePath: 'assets/Sugarcane.png',
      label: 'Sugarcane Disease',
      onTap: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SugarcaneDiseaseDetails(),
          ),
        );
      },
    ),
  // Add more items as needed...
];

class AppleDiseaseDetails extends StatelessWidget {
  const AppleDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> appleData = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apple Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: appleData
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}

class GuavaDiseaseDetails extends StatelessWidget {
  const GuavaDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> guavadata = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guava Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: guavadata
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}

class TomatoDiseaseDetails extends StatelessWidget {
  const TomatoDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> tomatoData = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tomato Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: tomatoData
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}

class CherryDiseaseDetails extends StatelessWidget {
  const CherryDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> cherryData = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cherry Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cherryData
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}

class LemonDiseaseDetails extends StatelessWidget {
  const LemonDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> lemonData = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lemon Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: lemonData
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}

class GrapesDiseaseDetails extends StatelessWidget {
  const GrapesDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> grapesData = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grapes Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: grapesData
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}



class JamunDiseaseDetails extends StatelessWidget {
  const JamunDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> jamunData = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jamun Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: jamunData
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}



class CornDiseaseDetails extends StatelessWidget {
  const CornDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> cornData = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Corn Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cornData
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}




class OrangeDiseaseDetails extends StatelessWidget {
  const OrangeDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> orangeData = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orange Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: orangeData
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}



class PeachDiseaseDetails extends StatelessWidget {
  const PeachDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> peachData = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peach Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: peachData
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}




class PomegranateDiseaseDetails extends StatelessWidget {
  const PomegranateDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> pomegranateData = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomegranate Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pomegranateData
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}



class PotatoDiseaseDetails extends StatelessWidget {
  const PotatoDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> potatoData = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Potato Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: potatoData
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}



class RiceDiseaseDetails extends StatelessWidget {
  const RiceDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> riceData = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rice Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: riceData
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}


class RoseDiseaseDetails extends StatelessWidget {
  const RoseDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> roseData = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rose Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: roseData
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}

class StrawberryDiseaseDetails extends StatelessWidget {
  const StrawberryDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> strawberryData = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strawberry Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: strawberryData
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}


class SugarcaneDiseaseDetails extends StatelessWidget {
  const SugarcaneDiseaseDetails({super.key});

  // Cucumber disease data
  final List<Map<String, String>> sugarcaneData = const [
    {
      'image': 'assets/cucumber1.png',
      'title': 'Healthy Cucumber',
      'description': 'A healthy cucumber plant with vibrant green leaves.',
    },
    {
      'image': 'assets/cucumber2.png',
      'title': 'Powdery Mildew',
      'description':
          'White powdery spots on leaves caused by fungal infection.',
    },
    {
      'image': 'assets/cucumber3.png',
      'title': 'Downy Mildew',
      'description': 'Yellow angular spots on upper leaf surfaces.',
    },
    {
      'image': 'assets/cucumber4.png',
      'title': 'Bacterial Wilt',
      'description': 'Rapid wilting caused by Erwinia tracheiphila bacteria.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sugarcane Disease Details'),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      ),
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: sugarcaneData
                  .map((data) => _buildDiseaseContainer(context, data))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiseaseContainer(
      BuildContext context, Map<String, String> data) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 0, 0),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data['image'] ?? '',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            data['title'] ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            decoration: const InputDecoration(
              disabledBorder: OutlineInputBorder(),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}