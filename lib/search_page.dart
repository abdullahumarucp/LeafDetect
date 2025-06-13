// ignore_for_file: deprecated_member_use

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
      'image': 'assets/appleblackrot.jpg',
      'title': 'Black Rot',
      'description':
          'Black rot, caused by Botryosphaeria obtusa, affects apples, causing "frog-eye" leaf spots and bullseye-like fruit rot. It thrives in warm, wet conditions, overwintering in cankers and mummified fruit. '
              'Control it with: '
              '🌱 Sanitation: Remove infected debris. '
              '✂️ Pruning: Cut affected branches.'
              ' 💉 Fungicides: Apply captan or myclobutanil during bloom.'
              ' 🍎 Resistant Cultivars: Choose Enterprise or Liberty.'
    },
    {
      'image': 'assets/applescab.jpg',
      'title': 'Scab',
      'description':
          '🍎 Apple Scab (Venturia inaequalis) is a common fungal disease affecting apple and crabapple trees. It causes olive-green to black spots on leaves, which may turn yellow and drop early. Fruits develop rough, corky lesions, often leading to cracking or deformation. The fungus thrives in cool, wet spring weather and spreads through spores from fallen leaves. To manage it, remove infected leaves, prune for airflow, and consider resistant varieties like Liberty or Prima. Fungicides can help if applied early. 🌿',
    },
    {
      'image': 'assets/applerust.jpg',
      'title': 'Rust ',
      'description':
          '🍎 Apple Rust is a plant disease caused by a fungus. It shows up as bright orange or yellow spots on apple tree leaves, sometimes with a powdery look underneath. Leaves may turn yellow and fall off early, making the tree weaker. Apples can get small, discolored spots, which make them less nice. The fungus needs another plant, like a juniper or cedar, to spread. To stop it, cut away nearby junipers, trim the tree for better air, and use fungicide sprays in early spring. 🌿',
    },
    {
      'image': 'assets/applebrownspot.jpg',
      'title': 'Brown Spot',
      'description':
          '🍎 Apple Brown Spot (Marssonina coronaria) is a fungal disease affecting apple trees. It causes small, dark brown to black spots on leaves, often with a grayish-white center, appearing in late spring or summer. Spots may merge, causing larger dead areas, and heavily infected leaves turn yellow and drop early, weakening the tree. Fruits may develop small, sunken brown spots, reducing quality. The fungus spreads in wet, humid conditions and overwinters in fallen leaves. To manage it, rake and destroy fallen leaves, prune for better airflow, and apply fungicides like sulfur or captan in early spring. 🌿',
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
            fit: BoxFit.contain, // Changed from BoxFit.cover to BoxFit.contain
          ),
          const SizedBox(height: 8),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,

              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              // Add a subtle shadow to the border for depth
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              // Add a gradient background for visual appeal
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              // Add a subtle box shadow to the entire field
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              // Add a hint for better UX
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
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
      'image': 'assets/guavablight.png',
      'title': 'Blight',
      'description':
          '🍈 Guava Blight is a plant disease often caused by fungi like Phytophthora or Colletotrichum species. It shows up as dark brown or black spots on guava leaves, which may turn yellow and fall off early. The disease can also cause wilting, twig dieback, and small, discolored, or rotten fruit. It spreads in warm, wet conditions and lives in soil or plant debris. To control it, remove and destroy affected leaves and fruit, improve drainage, prune to increase airflow, and use fungicides like copper-based sprays in early stages. 🌱',
    },
    {
      'image': 'assets/guavaalgal.jpg',
      'title': 'Algal',
      'description':
          '🍈 Guava Algal Leaf Spot is a disease caused by the parasitic green alga Cephaleuros virescens. It shows up as raised, velvety, orange, rust-colored, or reddish-brown spots on guava leaves, often 2–8 mm wide. These spots can merge into larger patches, causing leaves to turn yellow and drop early, which weakens the tree and reduces fruit quality. In severe cases, spots may appear on fruit, causing black, irregular distortions. The alga thrives in warm, humid, rainy conditions, especially in tropical areas like Florida or Hawaii, and spreads through water splashes. To manage it, prune low-hanging branches, remove fallen leaves, improve air circulation with proper spacing, use drip irrigation to keep leaves dry, and apply copper-based fungicides if needed. 🌱',
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
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            textAlign: TextAlign.center, // Aligns text to the center
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
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
      'image': 'assets/tomatobacterialspot.jpg',
      'title': 'Bacterial Spot',
      'description':
          '🍅 Tomato Bacterial Spot is a disease caused by bacteria like Xanthomonas species. It shows up as small, water-soaked spots on tomato leaves, turning dark brown or black with a yellow halo. Spots may merge, causing larger dead areas, and leaves can turn yellow and drop early, weakening the plant. Fruits get small, raised, dark spots, making them less appealing. The bacteria spread in warm, wet weather through water splashes, tools, or hands. To manage it, remove and destroy affected leaves, avoid overhead watering, clean tools, rotate crops, and use copper-based sprays early. 🌱',
    },
    {
      'image': 'assets/tomatoearlyblight.jpg',
      'title': 'Early Blight',
      'description':
          '🍅 Tomato Early Blight is a fungal disease caused by Alternaria solani. It shows up as dark brown or black spots with yellowwoman yellow rings (like a bullseye) on tomato leaves, usually starting on older, lower leaves. Spots grow larger, merge, and cause leaves to turn yellow and drop, weakening the plant. Fruits may get dark, sunken spots, reducing quality. The fungus spreads in warm, wet weather and lives in soil or plant debris. To manage it, remove infected leaves, avoid overhead watering, mulch to reduce soil splash, rotate crops, and use fungicides like chlorothalonil early. 🌱',
    },
    {
      'image': 'assets/tomatolateblight.jpg',
      'title': 'Late Blight',
      'description':
          '🍅 Tomato Late Blight is a serious disease caused by the fungus-like Phytophthora infestans. It appears as large, water-soaked, gray-green spots on tomato leaves, often with a white, fuzzy mold on the underside in wet conditions. Spots turn dark brown or black, and leaves die quickly, weakening the plant. Stems may get dark, greasy patches, and fruits develop large, irregular, brown, or green sunken spots, often rotting. It spreads fast in cool, rainy weather through water or air. To control it, remove and destroy affected leaves and fruits, avoid overhead watering, improve air circulation, and use fungicides like chlorothalonil or copper sprays early. 🌱',
    },
    {
      'image': 'assets/tomatospider.jpg',
      'title': 'Spider',
      'description':
          '🍅 Tomato Spider Mites are tiny pests (like Tetranychus urticae or T. evansi) that attack tomato plants. They look like small, moving dots (red, yellow, or green) and live mostly under leaves, creating fine, silky webs. They suck sap from leaves, causing white or yellow speckled spots, yellowing, and drying leaves that may drop early. Fruits can get yellowish speckles, reducing quality. They thrive in hot, dry weather and spread by wind or contact. To control them, spray leaves (especially undersides) with a strong water stream, use neem oil or insecticidal soap every 7–10 days, keep plants well-watered, and remove weeds or debris. You can also add predatory mites or ladybugs to eat them. 🌱',
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
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            textAlign: TextAlign.center, // Aligns text to the center
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
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
      'image': 'assets/cherrypowderymildew.jpg',
      'title': 'Powdery Mildew',
      'description':
          '🍒 Cherry Powdery Mildew is a fungal disease caused by Podosphaera clandestina. It shows up as white or grayish powdery patches on cherry leaves, often on the upper side, but sometimes underneath. Leaves may turn yellow, curl, or drop early, weakening the tree. Young shoots and buds can get covered, slowing growth. Fruits may develop white spots or scars, lowering quality. The fungus loves warm, dry days but can spread in humid conditions. To control it, prune to improve airflow, remove infected parts, avoid overhead watering, and use fungicides like sulfur or myclobutanil early in the season. 🌱',
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
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            textAlign: TextAlign.center, // Aligns text to the center
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
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
      'image': 'assets/lemonbacterialblast.jpg',
      'title': 'Bacterial Blast',
      'description':
          '🍋 Lemon Bacterial Blast is a disease caused by the bacterium Pseudomonas syringae. It appears as small, water-soaked spots on lemon leaves, turning dark brown or black with a grayish-white center. Spots may merge, causing larger dead areas, and leaves can yellow and drop early, weakening the tree. Twigs and young shoots may develop dark lesions, and fruit can get rough, dark spots, reducing quality. The bacteria spread in cool, wet, windy conditions, often through rain or overhead watering. To control it, prune affected parts, avoid overhead watering, improve air circulation, and apply copper-based sprays early in the season. 🌱',
    },
    {
      'image': 'assets/lemonbotrytisrot.jpg',
      'title': 'Botrytis Rot',
      'description':
          '🍋 Lemon Botrytis Rot (also called gray mold) is a fungal disease caused by Botrytis cinerea. It appears as soft, brown, or grayish patches on lemon fruits, often starting at the blossom end or where fruit is damaged. In humid conditions, a fuzzy gray or white mold grows on affected areas. Leaves and twigs can develop brown, wilted spots, and flowers may rot. The fungus thrives in cool, wet, humid weather and spreads through rain, wind, or contact. To control it, remove and destroy affected fruit and plant parts, improve air circulation by pruning, avoid overhead watering, and apply fungicides like captan or thiophanate-methyl early. 🌱',
    },
    {
      'image': 'assets/lemonwinddamage.jpg',
      'title': 'Wind Damage',
      'description':
          '🍋 Lemon Wind Damage happens when strong winds harm lemon trees. It causes leaves to tear, curl, or fall off, and young branches or twigs may break. Fruits can get scratched, bruised, or drop early, lowering quality. Wind can also stress the tree, making it more prone to pests or diseases. It’s common in exposed areas or during storms. To manage it, plant trees in sheltered spots, use windbreaks like fences or hedges, stake young trees for support, prune damaged parts, and water well to help recovery. 🌱',
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
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            textAlign: TextAlign.center, // Aligns text to the center
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
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
      'image': 'assets/grapeblackmeasles.jpg',
      'title': 'Black Measles',
      'description':
          '🍇 Grape Black Measles (also called Esca) is a fungal disease caused by fungi like Phaeoacremonium and Phaeomoniella chlamydospora. It shows up as dark, measles-like spots on grape berries, often turning them black or purple with a bitter taste. Leaves develop yellow or brown spots with a “tiger stripe” pattern, and vines may wilt or die back. Wood inside the vine can show dark streaks. It spreads in warm, wet conditions and through pruning wounds. To manage it, prune affected wood, remove infected berries, improve air circulation, avoid overwatering, and use fungicides like sodium arsenite in severe cases. 🌱',
    },
    {
      'image': 'assets/grapeblackrot.jpg',
      'title': 'Black Rot',
      'description':
          '🍇 Grape Black Rot is a fungal disease caused by Guignardia bidwellii. It appears as small, yellowish spots on grape leaves that turn brown or black with tiny black dots (spores). Leaves may dry up and fall early. On grapes, it causes brown, shriveled berries that turn black and hard, often called “mummy berries.” It spreads in warm, wet weather through rain or dew. To control it, remove and destroy affected leaves and berries, prune for better airflow, avoid overhead watering, and use fungicides like myclobutanil or captan early in the season. 🌱',
    },
    {
      'image': 'assets/grapeblight.jpg',
      'title': 'Downy Mildew',
      'description':
          '🍇 Grape Blight (often referring to Phomopsis cane and leaf spot, caused by Phomopsis viticola) is a fungal disease affecting grapevines. It shows up as small, dark brown to black spots on leaves, often with yellow halos, and can cause leaves to curl or drop early. Canes and stems develop black, cracked lesions, and young shoots may die back. Berries can get small, dark spots or rot, reducing quality. It spreads in wet, cool spring weather through rain or overhead watering. To control it, remove and destroy infected canes and leaves, prune for better airflow, avoid overhead watering, and apply fungicides like captan or myclobutanil early in the season. 🌱',
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
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            textAlign: TextAlign.center, // Aligns text to the center
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
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
      'image': 'assets/jamunbrownblight.jpg',
      'title': 'Brown Blight',
      'description':
          'Jamun Brown Blight is a fungal disease caused by Pestalotiopsis species, affecting jamun (Syzygium cumini) trees. It shows up as small, round, dark brown to black sunken spots on leaves, which may merge into larger dead areas, causing leaves to yellow and drop early. Fruits develop dark, sunken spots, reducing quality and causing 10–20% yield loss. It thrives in warm, humid conditions and spreads through rain or infected plant debris. To control it, remove and destroy affected leaves and fruits, prune for better airflow, avoid overhead watering, and apply fungicides like Score or Topsin M. Moringa extract can also help reduce fungal growth. 🌱',
    },
    {
      'image': 'assets/jamunbacterialspot.jpg',
      'title': 'Bacterial Spot',
      'description':
          'Jamun Bacterial Spot is a disease caused by bacteria like Xanthomonas species. It shows up as tiny, water-soaked spots on jamun leaves that turn dark brown or black with yellow halos. These spots can merge, forming larger dead areas, causing leaves to turn yellow and fall early, which weakens the tree. Fruits may develop dark, sunken lesions, reducing quality and leading to 10–20% yield loss. The bacteria spread in warm, wet weather through rain, overhead watering, or insects like leafhoppers. To control it, remove and destroy infected leaves and fruits, use drip irrigation to keep foliage dry, practice crop rotation for 3–4 years, control insects, and apply copper-based sprays early. 🌱',
    },
    {
      'image': 'assets/jamunsootyMold.jpg',
      'title': 'Sooty Mold',
      'description':
          'Jamun Sooty Mold is a fungal disease caused by fungi like Capnodium species. It appears as a black, powdery coating on jamun leaves, stems, and fruits, often looking like soot. It doesn’t directly harm the plant but grows on sticky honeydew left by insects like aphids, scale, or whiteflies. This mold blocks sunlight, slowing growth and weakening the tree. Fruits may look dirty, reducing quality. It thrives in warm, humid conditions. To control it, manage pest insects with neem oil or insecticidal soap, wash off mold with water, prune for better airflow, and avoid overwatering. 🌱',
    },
    {
      'image': 'assets/jamunpowderymildew.jpg',
      'title': 'Powdery Mildew',
      'description':
          'Jamun Powdery Mildew is caused by a fungus called Oidium. It looks like white or gray powdery spots on jamun leaves, mostly on top but sometimes below. Leaves can turn yellow, curl, or fall off early, making the tree weak. Young shoots may get covered, slowing growth, and fruits can get powdery spots, making them less nice. It grows in warm, dry weather but spreads when it’s humid. To stop it, cut branches to let air flow, remove sick leaves and shoots, don’t water from above, and use fungicide sprays like sulfur early. 🌱',
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
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            textAlign: TextAlign.center, // Aligns text to the center
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
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
      'image': 'assets/corngrayspot.jpg',
      'title': 'Gray Spot',
      'description':
          'Corn Gray Leaf Spot is a fungal disease that affects corn plants, caused by the fungus Cercospora zeae-maydis. It shows up as small, gray to tan rectangular spots on the leaves, which can grow bigger and join together, making it hard for the plant to get enough sunlight. This reduces the plant’s ability to make food through photosynthesis, leading to weaker plants and lower grain yields. The disease spreads more easily in warm, humid weather, especially when old corn leaves are left on the field, as the fungus can live there. To manage it, farmers can rotate crops, remove or plow under old plant material, plant disease-resistant varieties, and use fungicides if needed. Keeping the field clean and choosing healthy seeds helps prevent the disease from spreading. 🌽',
    },
    {
      'image': 'assets/cornrust.jpg',
      'title': 'Rust',
      'description':
          'Corn Rust is a fungal disease that affects corn plants, mainly caused by two types of fungi: Common rust (Puccinia sorghi) and Southern rust (Puccinia polysora). It appears as small, reddish or orange-brown spots (called pustules) on the leaves, which can spread quickly if the weather is warm and humid. These rust spots damage the leaves and reduce the plant’s ability to make food, which can lead to poor growth and lower corn yields. The disease spreads through wind-blown spores and is more common in wet and warm climates. To control corn rust, farmers can plant rust-resistant corn varieties, avoid overcrowding to improve air flow, and apply fungicides when needed. Regular monitoring and good field hygiene also help in preventing the spread of rust. 🌽',
    },
    {
      'image': 'assets/cornblight.jpg',
      'title': 'Blight',
      'description':
          'orn Blight is a fungal disease that affects corn leaves and can reduce plant health and grain yield. There are two main types: Northern Corn Leaf Blight (NCLB) and Southern Corn Leaf Blight (SCLB). NCLB causes long, gray-green or brown cigar-shaped spots on the leaves, while SCLB shows up as smaller tan spots with dark edges. Both types weaken the plant by damaging the leaves, which reduces photosynthesis—the plant’s way of making food. These diseases spread more in warm, wet, and humid weather, especially when infected plant debris is left in the field. To manage corn blight, farmers can plant disease-resistant varieties, rotate crops, clear old plant material, and use fungicides if needed. Keeping the field clean and monitoring regularly helps prevent the disease from spreading. 🌽',
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
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            textAlign: TextAlign.center, // Aligns text to the center
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
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
      'image': 'assets/orangehaunglongbing.png',
      'title': 'Orange Haunglongbing',
      'description':
          'Orange Huanglongbing (also called Citrus Greening Disease) is one of the most serious diseases that affects orange and other citrus trees. It is caused by a bacteria spread by a tiny insect called the Asian citrus psyllid. The disease blocks the flow of nutrients in the plant, causing the leaves to turn yellow and blotchy, and the fruits to stay small, green, misshapen, and bitter. Over time, the tree becomes weak and may stop producing fruit or even die. Huanglongbing spreads quickly and is hard to cure once a tree is infected. To manage it, farmers can remove infected trees, control the psyllid insect using insecticides or natural predators, and plant disease-free seedlings. Regular monitoring and strict control are key to slowing the spread of this deadly citrus disease. 🍊.',
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
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            textAlign: TextAlign.center, // Aligns text to the center
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
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
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            textAlign: TextAlign.center, // Aligns text to the center
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
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
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            textAlign: TextAlign.center, // Aligns text to the center
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
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
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            textAlign: TextAlign.center, // Aligns text to the center
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
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
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            textAlign: TextAlign.center, // Aligns text to the center
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
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
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            textAlign: TextAlign.center, // Aligns text to the center
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
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
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            textAlign: TextAlign.center, // Aligns text to the center
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
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
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              data['title'] ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: TextEditingController(text: data['description'] ?? ''),
            enabled: false,
            maxLines: null,
            textAlign: TextAlign.center, // Aligns text to the center
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.3),
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.description_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.blueAccent.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
              floatingLabelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                  width: 2,
                ),
              ),
              hintText: 'No description available',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
