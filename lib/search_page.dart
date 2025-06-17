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
            builder: (context) => const Firstpage(
              cameras: [],
            ),
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

  final List<Map<String, String>> appleData = const [
    {
      'image': 'assets/appleblackrot.jpg',
      'title': 'Black Rot',
      'description': 'A fungal disease that attacks apples and branches:'
          '\n\n🍎 FRUIT SYMPTOMS:'
          '\n• Rotten brown spots that turn black'
          '\n• Concentric rings like bullseyes'
          '\n• Fruit shrivels into hard "mummies"'
          '\n\n🍃 LEAF SYMPTOMS:'
          '\n• Purple spots with brown centers'
          '\n• Holes develop as spots fall out'
          '\n• Leaves turn yellow and drop early'
          '\n\n🌿 BRANCH SYMPTOMS:'
          '\n• Sunken red cankers on twigs'
          '\n• Bark cracks and peels off'
          '\n• Young shoots may die back'
          '\n\n🌧️ HOW IT SPREADS:'
          '\n• Fungus lives in mummified fruit'
          '\n• Spreads by rain splash and wind'
          '\n• Enters through wounds or cracks'
          '\n• Worst in warm, wet weather'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Remove all mummified fruit from tree and ground'
          '\n• Prune infected branches 6 inches below cankers'
          '\n• Spray fungicides during wet periods'
          '\n• Avoid wounding fruit during handling'
          '\n• Space trees for good air flow'
          '\n• Clean tools with bleach solution'
          '\n• Choose resistant varieties like Liberty'
          '\n\n⚠️ WARNING: Can destroy 80% of your apples!',
    },
    {
      'image': 'assets/applescab.jpg',
      'title': 'Scab',
      'description': 'The most common fungal disease of apple trees:'
          '\n\n🍃 LEAF SYMPTOMS:'
          '\n• Olive-green spots on leaves'
          '\n• Spots turn dark brown/black'
          '\n• Leaves curl and fall early'
          '\n\n🍎 FRUIT SYMPTOMS:'
          '\n• Dark, scabby lesions'
          '\n• Cracked, corky skin'
          '\n• Misshapen apples'
          '\n• Poor fruit quality'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Cool, wet spring weather'
          '\n• Rain splashes spores to new growth'
          '\n• Lives in fallen leaves over winter'
          '\n• Humid conditions help growth'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Plant resistant varieties (Liberty, Enterprise)'
          '\n• Rake and destroy fallen leaves every autumn'
          '\n• Prune trees for better air circulation'
          '\n• Apply fungicides at bud break and petal fall'
          '\n• Use sulfur or lime sulfur sprays'
          '\n• Avoid overhead watering'
          '\n• Thin fruit clusters for better airflow'
          '\n\n⚠️ WARNING: Can reduce harvest by 70% and make fruits unsellable!',
    },
    {
      'image': 'assets/applerust.jpg',
      'title': 'Rust ',
      'description':
          'A fungal disease that jumps between apple trees and junipers:'
              '\n\n🍃 LEAF SYMPTOMS:'
              '\n• Bright orange/yellow spots'
              '\n• Spots develop black dots in center'
              '\n• Leaves yellow and drop early'
              '\n\n🍎 FRUIT SYMPTOMS:'
              '\n• Distorted, undersized apples'
              '\n• Yellow-orange spots near calyx'
              '\n• Premature fruit drop'
              '\n\n🌲 UNIQUE FEATURE:'
              '\n• Requires juniper/cedar trees nearby'
              '\n• Forms orange jelly-like horns on junipers in spring'
              '\n\n🌧️ WHEN IT SPREADS:'
              '\n• Cool, wet spring weather'
              '\n• During apple bloom period'
              '\n• Rain spreads spores from junipers to apples'
              '\n\n✅ HOW TO CONTROL IT:'
              '\n• Plant resistant varieties (Liberty, William\'s Pride)'
              '\n• Remove juniper/cedar trees within 200 yards'
              '\n• Apply fungicides at pink bud stage'
              '\n• Use myclobutanil or sulfur sprays'
              '\n• Prune apple trees for better airflow'
              '\n• Rake and destroy fallen leaves'
              '\n\n⚠️ WARNING: Can cause 50% defoliation and fruit loss!',
    },
    {
      'image': 'assets/applebrownspot.jpg',
      'title': 'Brown Spot',
      'description': 'A fungal disease causing leaf spots and fruit damage:'
          '\n\n🍃 LEAF SYMPTOMS:'
          '\n• Small brown spots with purple edges'
          '\n• Spots merge into large brown patches'
          '\n• Yellow halos around spots'
          '\n• Leaves turn yellow and drop early'
          '\n\n🍎 FRUIT SYMPTOMS:'
          '\n• Small brown specks on skin'
          '\n• Spots enlarge into sunken lesions'
          '\n• Skin becomes rough and corky'
          '\n• Premature fruit drop'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Warm (20-25°C), humid conditions'
          '\n• Prolonged leaf wetness periods'
          '\n• Rain splashes spores from infected leaves'
          '\n• Poor air circulation in orchards'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Plant resistant varieties (Goldrush, Enterprise)'
          '\n• Prune trees for open canopy airflow'
          '\n• Apply copper fungicides at bud break'
          '\n• Use captan sprays during wet seasons'
          '\n• Remove fallen leaves and fruit debris'
          '\n• Avoid overhead irrigation'
          '\n• Thin fruit clusters for better drying'
          '\n\n⚠️ WARNING: Can cause 30-60% leaf loss and fruit downgrading!',
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

  final List<Map<String, String>> guavadata = const [
    {
      'image': 'assets/guavablight.png',
      'title': 'Blight',
      'description': 'A destructive disease causing rapid wilting and death:'
          '\n\n🍃 LEAF SYMPTOMS:'
          '\n• Sudden wilting and drooping'
          '\n• Brown edges progressing inward'
          '\n• Leaves cling to branches after dying'
          '\n\n🌳 BRANCH SYMPTOMS:'
          '\n• Dark streaks under bark'
          '\n• Twig dieback from tips downward'
          '\n• Cankers with oozing sap'
          '\n\n🍈 FRUIT SYMPTOMS:'
          '\n• Small, underdeveloped fruits'
          '\n• Brown rot starting at stem end'
          '\n• Premature fruit drop'
          '\n\n🔥 HOW IT SPREADS:'
          '\n• Enters through root injuries'
          '\n• Spreads via contaminated soil'
          '\n• Waterlogged conditions accelerate'
          '\n• Pruning tools transmit disease'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Plant resistant varieties (Allahabad Safeda)'
          '\n• Improve soil drainage with raised beds'
          '\n• Solarize soil before planting'
          '\n• Drench roots with copper oxychloride'
          '\n• Remove and burn infected trees'
          '\n• Sterilize tools with flame/bleach'
          '\n• Avoid wounding tree roots'
          '\n\n⚠️ WARNING: Can kill mature trees in 3-6 months!',
    },
    {
      'image': 'assets/guavaalgal.jpg',
      'title': 'Algal',
      'description':
          'An algal infection causing crusty spots on leaves and fruits:'
              '\n\n🍃 LEAF SYMPTOMS:'
              '\n• Velvety orange, rust-colored spots'
              '\n• Raised fuzzy patches (1-10mm diameter)'
              '\n• Spots merge to form large crusty areas'
              '\n• Yellowing and premature leaf drop'
              '\n\n🍈 FRUIT SYMPTOMS:'
              '\n• Dark green to brown rough spots'
              '\n• Cracked, scabby fruit surface'
              '\n• Stunted fruit development'
              '\n\n🌧️ WHEN IT SPREADS:'
              '\n• High humidity (>80%) and warm temperatures'
              '\n• Prolonged wet periods and poor air circulation'
              '\n• Overcrowded orchards with dense canopies'
              '\n• Spreads through rain splash and wind'
              '\n\n✅ HOW TO CONTROL IT:'
              '\n• Improve air flow with pruning (open center shape)'
              '\n• Apply copper-based fungicides during rainy season'
              '\n• Spray potassium bicarbonate solution monthly'
              '\n• Remove heavily infected leaves and branches'
              '\n• Avoid overhead irrigation'
              '\n• Maintain proper tree spacing'
              '\n• Apply zinc and manganese foliar sprays'
              '\n\n⚠️ NOTE: More cosmetic than fatal, but reduces market value!',
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

  final List<Map<String, String>> tomatoData = const [
    {
      'image': 'assets/tomatobacterialspot.jpg',
      'title': 'Bacterial Spot',
      'description':
          'A bacterial disease caused by *Xanthomonas* species, affecting leaves, stems, and fruits:\n\n'
              '🍃 LEAF SYMPTOMS:'
              '\n• Small, dark, water-soaked spots (1–3 mm)'
              '\n• Spots turn brown with yellow halos'
              '\n• Leaves may curl, yellow, and drop early'
              '\n• Reduces photosynthesis and plant health'
              '\n\n🌿 STEM & FRUIT SYMPTOMS:'
              '\n• Dark streaks or cankers on stems and petioles'
              '\n• Fruits show small, raised, brown-black spots'
              '\n• Spots become scabby and crack open'
              '\n• Affects fruit quality and marketability'
              '\n\n🌧️ WHEN IT SPREADS:'
              '\n• Warm, wet, and humid conditions (25–30°C)'
              '\n• Spreads via rain splash, wind, and contaminated tools'
              '\n• Infected seeds and plant debris are major sources'
              '\n\n✅ HOW TO CONTROL IT:'
              '\n• Use certified disease-free seeds and resistant varieties'
              '\n• Apply copper-based bactericides during wet periods'
              '\n• Practice crop rotation (avoid planting tomatoes/peppers in same field)'
              '\n• Remove and destroy infected plants and debris'
              '\n• Avoid working in wet fields to prevent spread'
              '\n• Improve airflow with proper spacing and pruning'
              '\n• Control insect vectors (like thrips) that aid bacteria spread'
              '\n\n⚠️ NOTE: Early detection and regular monitoring are key to reducing crop loss!'
    },
    {
      'image': 'assets/tomatoearlyblight.jpg',
      'title': 'Early Blight',
      'description': 'A common fungal disease caused by *Alternaria solani*, affecting leaves, stems, and fruits:\n\n'
          '🍃 LEAF SYMPTOMS:'
          '\n• Dark brown spots with concentric rings (target-like appearance)'
          '\n• Yellowing around the spots'
          '\n• Lower leaves affected first, then spreads upward'
          '\n• Leads to early leaf drop and weak plant growth'
          '\n\n🌿 STEM & FRUIT SYMPTOMS:'
          '\n• Dark sunken lesions at stem base of seedlings (collar rot)'
          '\n• Black or leathery spots on green or ripe fruits, often near the stem end'
          '\n• Fruits may rot and fall off'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Warm, humid weather (24–29°C) with wet leaves'
          '\n• Rain, overhead watering, and wind help spread spores'
          '\n• Survives in infected crop debris and soil'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Use disease-free seeds and resistant varieties'
          '\n• Practice crop rotation (3 years gap from tomatoes or potatoes)'
          '\n• Remove and destroy infected plant debris'
          '\n• Apply fungicides like mancozeb or chlorothalonil during early signs'
          '\n• Mulch to prevent soil splash'
          '\n• Water at soil level; avoid wetting the leaves'
          '\n• Maintain proper spacing for good air flow'
          '\n\n⚠️ NOTE: If not managed early, it can severely reduce fruit yield and quality!'
    },
    {
      'image': 'assets/tomatolateblight.jpg',
      'title': 'Late Blight',
      'description': 'A fast-spreading disease caused by *Phytophthora infestans*, affecting leaves, stems, and fruits:\n\n'
          '🍃 LEAF SYMPTOMS:'
          '\n• Large, irregular, water-soaked gray-green spots'
          '\n• Spots turn brown with white fuzzy mold underneath (in humid conditions)'
          '\n• Leaves wilt, collapse, and die rapidly'
          '\n\n🌿 STEM & FRUIT SYMPTOMS:'
          '\n• Dark brown to black lesions on stems and branches'
          '\n• Green fruits develop large, greasy-looking brown patches'
          '\n• Infected fruits become mushy and rot quickly'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Cool (15–20°C), wet, and humid weather'
          '\n• Favors rain, fog, and heavy dew'
          '\n• Spread by wind, rain splash, and infected plant material'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Use certified disease-free seeds and transplants'
          '\n• Apply protective fungicides (e.g., mancozeb, chlorothalonil, or metalaxyl) early in the season'
          '\n• Remove and destroy infected plants immediately'
          '\n• Avoid overhead irrigation and water early in the day'
          '\n• Practice crop rotation (avoid tomato/potato repeats)'
          '\n• Provide good air circulation by proper spacing and pruning'
          '\n\n⚠️ NOTE: Highly destructive – can wipe out entire crops in a few days if not controlled early!'
    },
    {
      'image': 'assets/tomatospider.jpg',
      'title': 'Spider',
      'description':
          'Tiny sap-sucking pests (like *Tetranychus urticae*) that damage leaves and weaken plants:\n\n'
              '🍃 LEAF SYMPTOMS:'
              '\n• Yellow or white speckled spots (stippling) on leaves'
              '\n• Fine webbing on underside of leaves'
              '\n• Leaves become dry, curled, and bronze-colored'
              '\n• Severe cases cause full leaf drop and plant stress'
              '\n\n🕷️ PEST FEATURES:'
              '\n• Very small (0.5 mm), red or yellow mites'
              '\n• Multiply rapidly in hot, dry conditions'
              '\n• Mostly found on undersides of leaves'
              '\n\n🌞 WHEN IT SPREADS:'
              '\n• Hot and dry weather (above 28°C)'
              '\n• Overuse of chemical sprays can kill natural predators'
              '\n• Wind can carry mites between plants'
              '\n\n✅ HOW TO CONTROL IT:'
              '\n• Spray water on undersides of leaves to remove mites'
              '\n• Use neem oil or insecticidal soap early on'
              '\n• Release natural predators like ladybugs or predatory mites'
              '\n• Avoid over-fertilizing with nitrogen (which encourages mite outbreaks)'
              '\n• Rotate crops and remove infested plant material'
              '\n• Keep plants well-watered to reduce stress'
              '\n\n⚠️ NOTE: Spider mites can go unnoticed until damage is severe – check leaves regularly!'
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

  final List<Map<String, String>> cherryData = const [
    {
      'image': 'assets/cherrypowderymildew.jpg',
      'title': 'Powdery Mildew',
      'description': 'A fungal disease caused by *Podosphaera clandestina*, affecting cherry leaves, shoots, and fruits:\n\n'
          '🍃 LEAF SYMPTOMS:'
          '\n• White, powdery coating on upper leaf surfaces'
          '\n• Leaves curl, twist, or become distorted'
          '\n• Yellowing and early leaf drop in severe cases'
          '\n\n🌿 SHOOT & FRUIT SYMPTOMS:'
          '\n• Young shoots may appear stunted and covered in white mold'
          '\n• Immature fruits show white fungal patches'
          '\n• Infected cherries become deformed, cracked, or drop early'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Warm and dry days with cool, humid nights'
          '\n• Ideal temperature: 20–27°C with high humidity'
          '\n• Spreads through wind-borne spores'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Prune trees to improve air circulation and sunlight'
          '\n• Remove and destroy infected leaves and shoots'
          '\n• Apply sulfur-based or systemic fungicides during early growth stages'
          '\n• Avoid excessive nitrogen fertilizers'
          '\n• Monitor regularly, especially during dry spells followed by humid conditions'
          '\n\n⚠️ NOTE: Early infections reduce fruit quality and tree health – timely control is important!'
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

  final List<Map<String, String>> lemonData = const [
    {
      'image': 'assets/lemonbacterialblast.jpg',
      'title': 'Bacterial Blast',
      'description':
          'A severe bacterial disease caused by *Pseudomonas syringae pv. syringae*, affecting lemon flowers, twigs, and young shoots:\n\n'
              '🍃 LEAF & SHOOT SYMPTOMS:'
              '\n• Sudden wilting and blackening of young shoots'
              '\n• Burnt or scorched appearance on leaf edges'
              '\n• Gummy exudate may ooze from infected twigs'
              '\n• Twigs may die back, especially during flowering period'
              '\n\n🌸 FLOWER & FRUIT SYMPTOMS:'
              '\n• Blossom blight – flowers turn brown and fall off'
              '\n• Small, dark, sunken spots on young fruits'
              '\n• Fruit drop increases during infection outbreaks'
              '\n\n🌧️ WHEN IT SPREADS:'
              '\n• Cool, moist conditions (12–20°C), especially during spring'
              '\n• Spread by rain, wind, pruning tools, and insects'
              '\n• Sudden temperature drops and high humidity favor outbreaks'
              '\n\n✅ HOW TO CONTROL IT:'
              '\n• Prune infected twigs and destroy them'
              '\n• Apply copper-based bactericides before and during flowering'
              '\n• Disinfect pruning tools with bleach or alcohol'
              '\n• Improve air circulation with proper tree spacing and pruning'
              '\n• Avoid overhead irrigation, especially in cool seasons'
              '\n• Use resistant or tolerant lemon varieties if available'
              '\n\n⚠️ NOTE: Bacterial blast can reduce yield significantly if not managed early during flowering!'
    },
    {
      'image': 'assets/lemonbotrytisrot.jpg',
      'title': 'Botrytis Rot',
      'description': 'A fungal disease caused by *Botrytis cinerea*, affecting lemon flowers, twigs, and fruits, especially under cool, moist conditions:\n\n'
          '🍃 LEAF & FLOWER SYMPTOMS:'
          '\n• Browning and blight of petals (flower blight)'
          '\n• Soft, water-soaked lesions on leaves and flower clusters'
          '\n• Infected flowers fail to set fruit and drop early'
          '\n\n🍋 FRUIT SYMPTOMS:'
          '\n• Soft, brown rot starting at blossom end or injury sites'
          '\n• Covered with gray, fuzzy fungal growth (spores)'
          '\n• Fruit shrivels and drops or rots post-harvest'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Cool (15–20°C), humid, and poorly ventilated conditions'
          '\n• High moisture, rain, and fog promote rapid spread'
          '\n• Spores spread by wind, water splash, and handling of infected fruits'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Prune to increase air movement and sunlight'
          '\n• Remove and destroy infected flowers, fruits, and leaves'
          '\n• Avoid excessive irrigation and wetting of flowers'
          '\n• Apply fungicides (like iprodione or captan) during flowering and wet periods'
          '\n• Harvest fruits carefully to avoid bruising'
          '\n• Store fruits in cool, dry, well-ventilated conditions to prevent post-harvest rot'
          '\n\n⚠️ NOTE: Botrytis mostly attacks flowers and ripe fruits – watch carefully during flowering and cool, wet weather!'
    },
    {
      'image': 'assets/lemonwinddamage.jpg',
      'title': 'Wind Damage',
      'description': 'Physical damage caused by strong winds, affecting lemon trees, leaves, branches, and fruit quality:\n\n'
          '🍃 LEAF & BRANCH SYMPTOMS:'
          '\n• Torn, shredded, or curled leaves'
          '\n• Twisted or broken branches'
          '\n• Excessive leaf drop after windstorms'
          '\n• Reduced tree growth due to stress'
          '\n\n🍋 FRUIT SYMPTOMS:'
          '\n• Scarring or scratches on fruit skin (wind rub)'
          '\n• Premature fruit drop'
          '\n• Bruised or cracked lemons from rubbing against branches'
          '\n\n🌬️ WHEN IT HAPPENS:'
          '\n• During storms, strong seasonal winds, or unprotected orchard locations'
          '\n• Especially damaging to young or shallow-rooted trees'
          '\n\n✅ HOW TO PROTECT:'
          '\n• Plant windbreak trees (e.g., eucalyptus, casuarina) around the orchard'
          '\n• Stake and tie young trees to support them'
          '\n• Prune trees to maintain balanced shape and avoid dense, top-heavy canopies'
          '\n• Avoid excessive nitrogen – encourages weak, fast-growing shoots'
          '\n• Space trees properly to reduce wind tunnel effects'
          '\n\n⚠️ NOTE: While not a disease, wind damage weakens the plant and invites pests and infections – prevention is key!'
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

  final List<Map<String, String>> grapesData = const [
    {
      'image': 'assets/grapeblackmeasles.jpg',
      'title': 'Black Measles',
      'description': 'A serious fungal disease complex caused by multiple fungi (*Phaeomoniella*, *Phaeoacremonium*, *Fomitiporia*) affecting grapevines:\n\n'
          '🍃 LEAF SYMPTOMS:'
          '\n• Yellowing between veins (tiger-stripe pattern)'
          '\n• Leaves curl, dry out, and fall off early'
          '\n• Symptoms appear mid to late season, especially in mature vines'
          '\n\n🍇 FRUIT SYMPTOMS:'
          '\n• Small, sunken dark spots on grapes (like measles)'
          '\n• Berries may crack, shrivel, or dry up (raisin-like)'
          '\n• Fruit may become unmarketable or drop before ripening'
          '\n\n🌿 VINE SYMPTOMS:'
          '\n• Brown streaks in woody tissues when cut open'
          '\n• Sudden dieback of shoots or entire vine collapse in hot weather'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Fungi enter through pruning wounds'
          '\n• Disease develops slowly over years, worse in warm, dry climates'
          '\n• Spread by rain, infected tools, or nursery stock'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Avoid pruning during wet weather'
          '\n• Disinfect pruning tools between plants'
          '\n• Remove and burn infected wood or dead vines'
          '\n• Seal large pruning wounds with protective paste'
          '\n• Use certified disease-free planting material'
          '\n• Apply trunk protectants or fungicides if available'
          '\n\n⚠️ NOTE: Black measles can slowly destroy vines over years – early detection and sanitation are critical!',
    },
    {
      'image': 'assets/grapeblackrot.jpg',
      'title': 'Black Rot',
      'description': 'A common fungal disease caused by *Guignardia bidwellii*, affecting grape leaves, shoots, and fruits:\n\n'
          '🍃 LEAF SYMPTOMS:'
          '\n• Small, round, brown spots with dark edges'
          '\n• Centers of spots turn tan with tiny black dots (fruiting bodies)'
          '\n• Severely infected leaves may yellow and drop early'
          '\n\n🌿 SHOOT & STEM SYMPTOMS:'
          '\n• Dark brown or black sunken lesions on young shoots and tendrils'
          '\n• Can cause shoot dieback if severe'
          '\n\n🍇 FRUIT SYMPTOMS:'
          '\n• Small brown spots that rapidly enlarge'
          '\n• Berries shrivel, turn black, and become hard (mummified)'
          '\n• Mummified fruits stay attached and spread spores next season'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Warm, wet weather (20–30°C) during spring and summer'
          '\n• Rain splashes spread spores from mummies and infected tissues'
          '\n• Dense canopies and poor airflow increase risk'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Remove and destroy mummified berries and infected shoots'
          '\n• Prune vines for good air circulation and sunlight exposure'
          '\n• Apply protective fungicides (e.g., mancozeb, myclobutanil) from bud break to fruit ripening'
          '\n• Train vines to dry quickly after rain or irrigation'
          '\n• Avoid overhead watering'
          '\n\n⚠️ NOTE: Black rot can cause major fruit loss if not controlled early – especially dangerous during flowering and fruit set!',
    },
    {
      'image': 'assets/grapeblight.jpg',
      'title': 'Downy Mildew',
      'description':
          'A bacterial disease caused by *Xanthomonas campestris*, affecting grapevine leaves, shoots, and fruits, especially during wet and warm weather:\n\n'
              '🍃 LEAF SYMPTOMS:'
              '\n• Small, water-soaked spots that turn dark brown or black'
              '\n• Spots may merge, causing large dead patches'
              '\n• Leaf curling, drying, and premature drop in severe cases'
              '\n\n🌿 SHOOT & STEM SYMPTOMS:'
              '\n• Blackened shoot tips with wilting (shoot blight)'
              '\n• Young shoots become soft, dark, and may break off'
              '\n• Girdling lesions may form, stopping sap flow'
              '\n\n🍇 FRUIT SYMPTOMS:'
              '\n• Infected berries may turn brown, shrivel, and drop'
              '\n• Fruit clusters may die suddenly during early development'
              '\n\n🌧️ WHEN IT SPREADS:'
              '\n• Warm (25–30°C), humid weather and rainstorms'
              '\n• Bacteria spread by rain splash, wind, tools, and insects'
              '\n• More severe in low-lying, poorly drained vineyards'
              '\n\n✅ HOW TO CONTROL IT:'
              '\n• Prune out infected shoots and burn debris'
              '\n• Disinfect pruning tools between vines'
              '\n• Apply copper-based bactericides during wet seasons'
              '\n• Improve drainage and reduce overcrowding in vineyards'
              '\n• Avoid overhead irrigation and minimize leaf wetness'
              '\n\n⚠️ NOTE: Early infections can stunt vine growth and destroy entire fruit clusters – early detection is key!',
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

  final List<Map<String, String>> jamunData = const [
    {
      'image': 'assets/jamunbrownblight.jpg',
      'title': 'Brown Blight',
      'description':
          'A fungal disease caused by *Colletotrichum* species, affecting jamun leaves and young shoots, especially during humid weather:\n\n'
              '🍃 LEAF SYMPTOMS:'
              '\n• Small, brown, circular to irregular spots on leaves'
              '\n• Spots enlarge and merge, forming large dead patches'
              '\n• Yellowing and premature leaf drop in severe cases'
              '\n\n🌿 SHOOT & BRANCH SYMPTOMS:'
              '\n• Brown lesions on young shoots and twigs'
              '\n• Dieback of tender branches from tip to base'
              '\n• Overall reduction in growth and canopy health'
              '\n\n🌧️ WHEN IT SPREADS:'
              '\n• High humidity (>80%) and temperatures around 25–30°C'
              '\n• Spread by rain splash, wind, and infected plant debris'
              '\n• More common during monsoon season or prolonged wet spells'
              '\n\n✅ HOW TO CONTROL IT:'
              '\n• Prune and destroy infected leaves and branches'
              '\n• Ensure good air circulation with regular canopy thinning'
              '\n• Apply fungicides like copper oxychloride or mancozeb during rainy season'
              '\n• Avoid overhead irrigation and waterlogging'
              '\n• Keep the orchard clean and remove fallen debris regularly'
              '\n\n⚠️ NOTE: If untreated, brown blight can reduce tree vigor and fruit yield over time – early action helps maintain plant health!'
    },
    {
      'image': 'assets/jamunbacterialspot.jpg',
      'title': 'Bacterial Spot',
      'description':
          'A bacterial disease caused by *Xanthomonas axonopodis*, affecting jamun leaves, stems, and fruits, especially during wet, warm conditions:\n\n'
              '🍃 LEAF SYMPTOMS:'
              '\n• Small, water-soaked spots that turn dark brown or black'
              '\n• Yellow halos may surround the spots'
              '\n• Spots may merge, leading to leaf blight and early leaf fall'
              '\n\n🌿 STEM & TWIG SYMPTOMS:'
              '\n• Dark, sunken lesions on young stems and branches'
              '\n• Twigs may crack or ooze bacterial gum in severe infections'
              '\n• Dieback of young branches in prolonged cases'
              '\n\n🍈 FRUIT SYMPTOMS:'
              '\n• Small, black raised spots on fruit surface'
              '\n• Cracks or pits on mature fruits, reducing market quality'
              '\n• Increased chance of secondary fungal infections'
              '\n\n🌧️ WHEN IT SPREADS:'
              '\n• Warm (25–35°C), humid, and rainy conditions'
              '\n• Spread by rain splash, wind, infected tools, and insects'
              '\n• High risk during monsoon or after heavy rains'
              '\n\n✅ HOW TO CONTROL IT:'
              '\n• Remove and destroy infected plant parts'
              '\n• Apply copper-based bactericides during early signs or before monsoon'
              '\n• Disinfect pruning tools after each tree'
              '\n• Avoid overhead irrigation and keep foliage dry'
              '\n• Prune for better air movement and light penetration'
              '\n\n⚠️ NOTE: While not always fatal, bacterial spot affects fruit quality and yield – early prevention is key!'
    },
    {
      'image': 'assets/jamunsootyMold.jpg',
      'title': 'Sooty Mold',
      'description':
          'A fungal condition caused by the growth of mold (*Capnodium* species) on honeydew excreted by insects like aphids, whiteflies, and scale insects:\n\n'
              '🍃 LEAF SYMPTOMS:'
              '\n• Black, powdery coating on the upper surface of leaves'
              '\n• Mold can be easily rubbed off but keeps returning'
              '\n• Blocks sunlight, reducing photosynthesis'
              '\n• Yellowing and weakening of leaves in severe cases'
              '\n\n🌿 STEM & FRUIT SYMPTOMS:'
              '\n• Black fungal growth on twigs, branches, and fruit surfaces'
              '\n• Affects fruit appearance, reducing market value'
              '\n• Can lead to stunted growth and reduced yield'
              '\n\n🐜 HOW IT SPREADS:'
              '\n• Not directly harmful, but grows on sticky honeydew'
              '\n• Insects like aphids, mealybugs, and scale are the main cause'
              '\n• High humidity and poor airflow worsen the problem'
              '\n\n✅ HOW TO CONTROL IT:'
              '\n• Control the insect pests using neem oil or insecticidal soap'
              '\n• Wash leaves with water or mild soap solution to remove mold'
              '\n• Prune dense foliage to improve air circulation'
              '\n• Apply horticultural oil to reduce honeydew-producing insects'
              '\n• Encourage natural predators like ladybugs and lacewings'
              '\n\n⚠️ NOTE: Sooty mold is mostly cosmetic but signals insect infestation – manage the pests to stop the mold!',
    },
    {
      'image': 'assets/jamunpowderymildew.jpg',
      'title': 'Powdery Mildew',
      'description': 'A fungal disease caused by *Oidium* species that affects jamun leaves, buds, flowers, and young fruits, especially in dry, warm climates:\n\n'
          '🍃 LEAF SYMPTOMS:'
          '\n• White, powdery coating on upper or lower leaf surface'
          '\n• Leaves may curl, turn yellow, and fall off early'
          '\n• Common on new growth and young shoots'
          '\n\n🌼 FLOWER & FRUIT SYMPTOMS:'
          '\n• Infected flowers may dry up and fall before fruiting'
          '\n• Small fruits develop white coating and stop growing'
          '\n• Deformed or cracked fruits if infection continues'
          '\n\n🌤️ WHEN IT SPREADS:'
          '\n• Warm, dry days and cool, humid nights (20–30°C)'
          '\n• Spreads through wind and survives on infected plant parts'
          '\n• More common during flowering and early fruit stages'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Remove and destroy infected leaves, flowers, and fruits'
          '\n• Spray sulfur-based or potassium bicarbonate fungicides regularly'
          '\n• Apply neem oil or horticultural oil as preventive spray'
          '\n• Prune trees to improve air flow and reduce humidity'
          '\n• Avoid excess nitrogen fertilizer – it encourages soft, vulnerable growth'
          '\n\n⚠️ NOTE: Powdery mildew can reduce fruit set and yield – start treatment early, especially in flowering season!',
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

  final List<Map<String, String>> cornData = const [
    {
      'image': 'assets/corngrayspot.jpg',
      'title': 'Gray Spot',
      'description': 'A fungal disease caused by *Cercospora zeae-maydis*, affecting corn leaves and reducing yield, especially in humid regions:\n\n'
          '🌿 LEAF SYMPTOMS:'
          '\n• Long, narrow, rectangular gray to tan lesions (2–5 cm)'
          '\n• Lesions run parallel to leaf veins'
          '\n• May merge to form large dead areas (leaf blight)'
          '\n• Lower leaves get infected first, then spreads upward'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Warm (25–30°C), humid conditions and frequent rain or dew'
          '\n• Spreads through infected crop debris and wind-blown spores'
          '\n• Dense planting and poor air flow increase severity'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Rotate crops and avoid planting corn continuously in the same field'
          '\n• Use resistant or tolerant corn varieties'
          '\n• Remove or deeply bury infected crop residues'
          '\n• Apply fungicides (e.g., strobilurins or triazoles) at early signs'
          '\n• Maintain proper spacing for airflow'
          '\n\n⚠️ NOTE: Severe infections reduce photosynthesis and yield – especially harmful during tasseling to grain fill stage!🌽',
    },
    {
      'image': 'assets/cornrust.jpg',
      'title': 'Rust',
      'description':
          'A fungal disease commonly caused by *Puccinia sorghi*, affecting corn leaves and reducing plant energy and yield:\n\n'
              '🌿 LEAF SYMPTOMS:'
              '\n• Small, round to oval reddish-brown pustules (raised spots)'
              '\n• Pustules appear on both sides of the leaf'
              '\n• Heavy infection may turn leaves yellow and dry'
              '\n• Red-orange powder (spores) rubs off easily on fingers'
              '\n\n🌧️ WHEN IT SPREADS:'
              '\n• Moist, cool to warm temperatures (15–25°C)'
              '\n• Spread by wind-borne spores and high humidity'
              '\n• Most severe in rainy or heavily irrigated areas'
              '\n\n✅ HOW TO CONTROL IT:'
              '\n• Grow resistant or tolerant corn hybrids'
              '\n• Monitor fields weekly during early growth stages'
              '\n• Apply fungicides like mancozeb or triazoles when symptoms first appear'
              '\n• Practice crop rotation and avoid planting near infected fields'
              '\n• Remove infected debris after harvest'
              '\n\n⚠️ NOTE: Common rust is manageable but can reduce grain fill and yield if not controlled early! 🌽',
    },
    {
      'image': 'assets/cornblight.jpg',
      'title': 'Blight',
      'description':
          'A fungal disease caused by *Exserohilum turcicum*, affecting corn leaves and reducing photosynthesis and yield:\n\n'
              '🌿 LEAF SYMPTOMS:'
              '\n• Long, cigar-shaped gray to tan lesions (2–15 cm)'
              '\n• Lesions start on lower leaves and move upward'
              '\n• In wet conditions, lesions may show black spore growth'
              '\n• Severe infections lead to leaf blight and early drying'
              '\n\n🌧️ WHEN IT SPREADS:'
              '\n• Warm, humid weather (18–27°C) and leaf wetness'
              '\n• Spreads via wind, rain splash, and infected debris'
              '\n• Overwinters in crop residue left in fields'
              '\n\n✅ HOW TO CONTROL IT:'
              '\n• Plant resistant corn varieties'
              '\n• Rotate crops with non-hosts like soybeans'
              '\n• Remove or plow under infected plant residue'
              '\n• Apply fungicides (e.g., azoxystrobin or propiconazole) at early signs'
              '\n• Improve spacing and airflow in fields'
              '\n\n⚠️ NOTE: Severe blight during silking to grain fill can cut yields by 30–50% – early detection is key! 🌽',
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

  final List<Map<String, String>> orangeData = const [
    {
      'image': 'assets/orangehaunglongbing.jfif',
      'title': 'Orange Haunglongbing',
      'description': 'A deadly bacterial disease caused by *Candidatus Liberibacter asiaticus*, spread by the Asian citrus psyllid, affecting all citrus trees:\n\n'
          '🍃 LEAF SYMPTOMS:'
          '\n• Blotchy yellow mottling (not symmetrical across the leaf midrib)'
          '\n• Leaves may become small, misshapen, and fall early'
          '\n• Twig dieback and thinning of canopy over time'
          '\n\n🍊 FRUIT SYMPTOMS:'
          '\n• Small, lopsided, green fruits that don’t ripen evenly'
          '\n• Bitter taste and small seeds'
          '\n• Premature fruit drop and very poor fruit quality'
          '\n\n🐛 HOW IT SPREADS:'
          '\n• Carried by the Asian citrus psyllid (a tiny insect)'
          '\n• Can also spread through grafting infected budwood'
          '\n• Hot, humid climates accelerate the spread'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Use disease-free planting material only'
          '\n• Monitor and control psyllids with insecticides or neem oil'
          '\n• Remove and destroy infected trees to stop spread'
          '\n• Use yellow sticky traps and pruning to manage psyllid population'
          '\n• Apply micronutrients (zinc, manganese, boron) to support weak trees'
          '\n\n⚠️ NOTE: There is no cure – early detection and psyllid control are critical to protect citrus orchards!🍊.',
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

  final List<Map<String, String>> peachData = const [
    {
      'image': 'assets/PeachBacterialSpot.jfif',
      'title': 'Bacterial spot',
      'description': 'A serious bacterial disease caused by *Xanthomonas arboricola pv. pruni*, affecting peach leaves, fruits, and twigs, especially in wet and windy conditions:\n\n'
          '🍃 LEAF SYMPTOMS:'
          '\n• Small, dark brown to black spots with a water-soaked appearance'
          '\n• Spots often have yellow halos and may fall out, leaving holes (shot-hole effect)'
          '\n• Infected leaves turn yellow and drop early'
          '\n\n🍑 FRUIT SYMPTOMS:'
          '\n• Tiny, raised dark spots that become sunken and scabby over time'
          '\n• Cracks form on fruit surface, making them unmarketable'
          '\n• Severe cases lead to fruit drop and reduced yield'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Warm, wet, and windy weather (20–30°C)'
          '\n• Bacteria spread through rain splash, wind, and infected tools'
          '\n• Higher risk in densely planted or poorly ventilated orchards'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Plant resistant peach varieties if available'
          '\n• Prune trees to improve air circulation and light'
          '\n• Apply copper-based bactericides during early growth stages'
          '\n• Avoid overhead irrigation and manage orchard humidity'
          '\n• Remove and destroy infected leaves and fruit'
          '\n• Disinfect pruning tools regularly'
          '\n\n⚠️ NOTE: This disease significantly affects fruit quality and yield – early prevention is essential! 🍑.',
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

  final List<Map<String, String>> pomegranateData = const [
    {
      'image': 'assets/PomegranateBacterialSpot.jpg',
      'title': 'Bacterial spot',
      'description':
          'This is a serious disease in pomegranate trees caused by bacteria. You can spot it by:'
              '\n\n🍃 LEAVES: Small dark spots with yellow rings that make leaves fall off early'
              '\n🍎 FRUITS: Rough brown spots that crack open, ruining the fruit'
              '\n\nHOW IT SPREADS:'
              '\n• Rain and wind carry the bacteria'
              '\n• Dirty gardening tools spread it'
              '\n• Insects move it between trees'
              '\n• Warm, wet weather helps it grow'
              '\n\nHOW TO CONTROL IT:'
              '\n✅ Plant tough varieties like Bhagwa'
              '\n✅ Spray copper medicine during flowering season'
              '\n✅ Cut off sick branches (clean tools after!)'
              '\n✅ Remove fallen leaves and fruits'
              '\n✅ Use drip watering instead of sprinklers'
              '\n✅ Check trees weekly during rainy season'
              '\n\nWithout control, this disease can destroy half your crop!',
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

  final List<Map<String, String>> potatoData = const [
    {
      'image': 'assets/PotatoLateBlight.jpg',
      'title': 'Late blight',
      'description': 'A deadly fungal-like disease caused by *Phytophthora infestans*, responsible for the Irish potato famine and still a major threat to crops:\n\n'
          '🍃 LEAF SYMPTOMS:'
          '\n• Dark brown or black irregular spots on leaf tips and edges'
          '\n• Water-soaked appearance with pale green borders'
          '\n• White mold (spore growth) under leaves in humid weather'
          '\n• Rapid leaf yellowing and collapse in severe cases'
          '\n\n🥔 TUBER SYMPTOMS:'
          '\n• Brown to purple dry rot on skin surface'
          '\n• Flesh shows firm brown discoloration under the skin'
          '\n• Infected tubers rot quickly in storage, becoming mushy and foul-smelling'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Cool, moist conditions (15–20°C with >90% humidity)'
          '\n• Spreads through wind-blown spores, infected seed tubers, and rain splash'
          '\n• Overwinters in leftover tubers or debris in the soil'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Use certified, disease-free seed potatoes'
          '\n• Apply protective fungicides (e.g., mancozeb, chlorothalonil) early and regularly'
          '\n• Remove and destroy infected plants and leftover tubers'
          '\n• Space plants properly and avoid overhead irrigation'
          '\n• Harvest in dry weather and store tubers in cool, dry, well-ventilated areas'
          '\n\n⚠️ NOTE: Late blight can destroy entire potato crops in days – early detection and spraying are critical!',
    },
    {
      'image': 'assets/PotatoNematode.jpg',
      'title': 'Potato Nematode',
      'description': 'Tiny worms in soil that attack potato plants:'
          '\n\n🥔 PLANT SYMPTOMS:'
          '\n• Stunted, weak plants'
          '\n• Yellow leaves that wilt easily'
          '\n• Fewer and smaller potatoes'
          '\n\n🌱 ROOT SYMPTOMS:'
          '\n• Knots or bumps on roots'
          '\n• Tiny white/yellow balls (cysts) on roots'
          '\n• Damaged roots that can\'t absorb water'
          '\n\nHOW IT SPREADS:'
          '\n• Lives in soil for years'
          '\n• Spreads through dirty tools, boots, or machinery'
          '\n• Carried by infected seed potatoes'
          '\n• Moves in water runoff'
          '\n\nHOW TO CONTROL IT:'
          '\n✅ Rotate crops: Don\'t plant potatoes in same soil for 4-5 years'
          '\n✅ Use certified nematode-free seed potatoes'
          '\n✅ Plant resistant varieties like Defender or Harmony'
          '\n✅ Solarize soil: Cover wet soil with plastic in hot sun for 4-6 weeks'
          '\n✅ Add marigold plants to your field (they fight nematodes!)'
          '\n✅ Test soil before planting season'
          '\n\nWithout control, these worms can destroy your whole potato crop!',
    },
    {
      'image': 'assets/PotatoEarlyBlight.jpg',
      'title': 'Early Blight',
      'description': 'A common fungal disease that attacks potato plants:'
          '\n\n🥔 LEAF SYMPTOMS:'
          '\n• Bullseye spots (dark rings with yellow halos)'
          '\n• Yellow leaves starting from bottom up'
          '\n• Leaves dry out and fall off early'
          '\n\n🍠 TUBER SYMPTOMS:'
          '\n• Dark, sunken spots on potatoes'
          '\n• Rot starts where spots form'
          '\n• Potatoes look wrinkled and old'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• In warm, humid weather'
          '\n• After rain or heavy dew'
          '\n• When plants are stressed'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Space plants for good air flow'
          '\n• Water soil only (avoid wetting leaves)'
          '\n• Rotate crops yearly (don\'t plant potatoes in same spot)'
          '\n• Use fungicides with chlorothalonil if needed'
          '\n• Remove infected leaves immediately'
          '\n• Choose resistant varieties like Defender'
          '\n• Remove all plant debris after harvest'
          '\n\n⚠️ WARNING: Can reduce harvest by 20-50% if untreated!',
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

  final List<Map<String, String>> riceData = const [
    {
      'image': 'assets/RiceBacterialBlight.jpg',
      'title': 'Bacterial Blight',
      'description': 'A serious bacterial disease that attacks rice plants:'
          '\n\n🌾 LEAF SYMPTOMS:'
          '\n• Water-soaked streaks starting at leaf edges'
          '\n• Streaks turn yellow then white'
          '\n• Leaves look burnt and dry'
          '\n\n🌱 PLANT SYMPTOMS:'
          '\n• Stunted growth'
          '\n• Fewer grain-filled panicles'
          '\n• Young plants may die completely'
          '\n\n💧 HOW IT SPREADS:'
          '\n• Enters through wounds in leaves'
          '\n• Spreads through water in flooded fields'
          '\n• Carried by wind and rain'
          '\n• Survives in infected seeds and straw'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Plant resistant varieties like IR20 or Swarna'
          '\n• Avoid too much nitrogen fertilizer'
          '\n• Drain fields for 2-3 days during rainy season'
          '\n• Apply copper-based sprays when first spots appear'
          '\n• Remove infected plants immediately'
          '\n• Burn rice straw after harvest'
          '\n• Keep fields clean of weeds'
          '\n\n⚠️ WARNING: Can destroy 20-50% of your harvest!',
    },
    {
      'image': 'assets/RiceBrownSpot.jpg',
      'title': 'Brown spot',
      'description': 'A common fungal disease that weakens rice plants:'
          '\n\n🍚 LEAF SYMPTOMS:'
          '\n• Small oval brown spots'
          '\n• Spots have yellow rings around them'
          '\n• Leaves turn yellow and dry from tip down'
          '\n\n🌾 GRAIN SYMPTOMS:'
          '\n• Dark spots on rice grains'
          '\n• Grains become lightweight and chalky'
          '\n• Panicles don\'t fill properly'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• In warm, humid weather'
          '\n• When soil lacks nutrients'
          '\n• During drought stress'
          '\n• Through infected seeds and straw'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Test soil and add missing nutrients'
          '\n• Use balanced fertilizer (especially zinc)'
          '\n• Plant resistant varieties like BR29 or IR64'
          '\n• Treat seeds before planting'
          '\n• Spray fungicides at early signs'
          '\n• Remove infected plants after harvest'
          '\n• Keep fields well-watered during dry spells'
          '\n\n⚠️ WARNING: Can cause 20-40% yield loss!',
    },
    {
      'image': 'assets/RiceTungro.jpg',
      'title': 'Tungro',
      'description': 'A dangerous virus disease spread by leafhoppers:'
          '\n\n🟠 PLANT SYMPTOMS:'
          '\n• Yellow-orange leaves starting from tips'
          '\n• Severe stunting (plants half normal size)'
          '\n• Fewer tillers and small panicles'
          '\n• Delayed flowering'
          '\n\n🦗 HOW IT SPREADS:'
          '\n• Carried by green leafhopper insects'
          '\n• Leafhoppers pick up virus from infected plants'
          '\n• Spreads quickly through whole fields'
          '\n• Weeds nearby help leafhoppers survive'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Plant resistant varieties like IR36 or IR50'
          '\n• Synchronize planting with neighbors'
          '\n• Use light traps to monitor leafhoppers'
          '\n• Spray recommended insecticides only when needed'
          '\n• Remove infected plants immediately'
          '\n• Clear weeds around fields'
          '\n• Avoid planting near infected fields'
          '\n\n⚠️ WARNING: Can cause 50-100% crop loss!',
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

  final List<Map<String, String>> roseData = const [
    {
      'image': 'assets/RoseRust.jpg',
      'title': 'Rust',
      'description': 'A fungal disease caused by *Phragmidium* species that affects rose leaves, stems, and canes, especially in cool and moist weather:\n\n'
          '🍃 LEAF SYMPTOMS:'
          '\n• Orange, yellow, or rust-colored powdery pustules on the underside of leaves'
          '\n• Yellow spots visible on the upper side of the leaf'
          '\n• Leaves may curl, dry, and fall off early'
          '\n• In severe cases, plants can become defoliated'
          '\n\n🌿 STEM & CANE SYMPTOMS:'
          '\n• Orange pustules may also appear on young green stems'
          '\n• Infected stems may weaken or die back'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Cool temperatures (12–20°C) and high humidity'
          '\n• Fungal spores spread through wind, rain, or splashing water'
          '\n• Dense, shaded rose beds increase risk'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Remove and destroy infected leaves and stems early'
          '\n• Prune roses to allow air circulation and reduce humidity'
          '\n• Avoid wetting leaves during watering'
          '\n• Apply fungicides like sulfur, myclobutanil, or chlorothalonil regularly'
          '\n• Use resistant rose varieties when possible'
          '\n\n⚠️ NOTE: Rose rust weakens plants over time – keep roses dry and pruned to prevent outbreaks!',
    },
    {
      'image': 'assets/RoseSlugSawfly.jpg',
      'title': 'Slug Sawfly',
      'description': 'A common rose pest caused by the larvae of sawflies (*Endelomyia aethiops* or *Cladius difformis*), which skeletonize rose leaves and reduce plant health:\n\n'
          '🐛 LARVA SYMPTOMS:'
          '\n• Slug-like green to yellowish larvae (6–13 mm long)'
          '\n• Found on the undersides of leaves, especially young ones'
          '\n• Larvae feed on soft leaf tissue, leaving behind clear “windows”'
          '\n• Severe feeding causes complete leaf skeletonization and browning'
          '\n\n🌿 PLANT DAMAGE:'
          '\n• Leaves appear scorched or lacy'
          '\n• Reduced photosynthesis and plant vigor'
          '\n• Heavy infestations weaken the plant and reduce blooming'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Most active in spring and early summer'
          '\n• Adult sawflies lay eggs on leaf undersides'
          '\n• One or more generations per year depending on climate'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Hand-pick larvae from leaves in early stages'
          '\n• Spray with insecticidal soap or neem oil (especially on undersides)'
          '\n• Use horticultural oil or pyrethrin sprays for heavier infestations'
          '\n• Encourage natural predators like birds and parasitic wasps'
          '\n• Keep the rose area clean of leaf litter and debris'
          '\n\n⚠️ NOTE: Though not true slugs, their feeding resembles slug damage – early control protects leaf health and flowering!',
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
      'image': 'assets/StrawberryLeafScorch.jpg',
      'title': 'Scorch',
      'description': 'A fungal disease caused by *Diplocarpon earlianum*, affecting strawberry leaves and reducing plant health and fruit yield:\n\n'
          '🍃 LEAF SYMPTOMS:'
          '\n• Small purple to reddish-brown spots on upper leaf surface'
          '\n• Spots merge, causing leaves to appear scorched or burnt'
          '\n• Leaf edges curl and dry out, but veins stay green early on'
          '\n• Infected leaves may die and drop prematurely'
          '\n\n🍓 PLANT DAMAGE:'
          '\n• Reduced photosynthesis leads to smaller, fewer fruits'
          '\n• Entire plants can weaken over time in severe infections'
          '\n• May also affect stems and flower stalks in advanced stages'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Wet, humid conditions and moderate temperatures (15–25°C)'
          '\n• Spread through rain splash, irrigation water, and infected debris'
          '\n• Overwinters on old infected leaves and plant material'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Remove and destroy infected leaves regularly'
          '\n• Avoid overhead watering – use drip irrigation'
          '\n• Ensure good air circulation by proper spacing and pruning'
          '\n• Apply fungicides like captan or myclobutanil during early signs'
          '\n• Use resistant varieties when available'
          '\n\n⚠️ NOTE: Not usually fatal, but can severely reduce fruit quality and yield if left unmanaged!',
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

  final List<Map<String, String>> sugarcaneData = const [
    {
      'image': 'assets/SugercaneRedRot.jpeg',
      'title': 'Red Rot',
      'description': 'A major fungal disease caused by *Colletotrichum falcatum*, known as the "cancer of sugarcane" due to its destructive impact on crops:\n\n'
          '🌿 STALK SYMPTOMS:'
          '\n• Leaves start drying from the tips downward (top drying)'
          '\n• Red coloration inside stalk with crosswise white patches (typical sign)'
          '\n• Sour or alcoholic smell when stalk is split open'
          '\n• Hollow, brittle, and rotting internodes'
          '\n\n🍃 LEAF SYMPTOMS:'
          '\n• Yellowing of top leaves followed by drooping'
          '\n• Leaves may break or dry prematurely'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Hot and humid conditions (25–35°C) with stagnant water'
          '\n• Spread through infected setts (planting material) and water'
          '\n• Poor drainage and continuous sugarcane cropping increase risk'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Use disease-free and resistant varieties (e.g., Co 0238, Co 86032)'
          '\n• Treat seed setts with fungicides (e.g., carbendazim or bavistin)'
          '\n• Improve field drainage and avoid water stagnation'
          '\n• Follow crop rotation and avoid ratooning infected fields'
          '\n• Remove and burn infected plants to prevent spread'
          '\n\n⚠️ NOTE: Red rot can reduce yield by 30–70% – early sett treatment and field hygiene are critical!',
    },
    {
      'image': 'assets/SugarcaneRust.jpeg',
      'title': 'Rust',
      'description': 'A fungal disease caused by *Puccinia melanocephala* (Brown Rust), affecting sugarcane leaves and reducing crop productivity:\n\n'
          '🍃 LEAF SYMPTOMS:'
          '\n• Small, elongated orange-brown pustules (rust spots) mainly on upper leaf surface'
          '\n• Spots cluster together forming large rusted patches'
          '\n• Yellowing and drying of leaf tissue around pustules'
          '\n• Premature leaf death in severe infections'
          '\n\n🌿 PLANT EFFECTS:'
          '\n• Reduced photosynthesis due to leaf loss'
          '\n• Stunted growth and poor sugar content in canes'
          '\n• Greater damage in young, actively growing plants'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Warm, moist conditions (20–30°C) favor spread'
          '\n• Fungal spores spread through wind, rain, and infected leaves'
          '\n• Overcrowded fields and poor airflow increase infection risk'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Plant rust-resistant sugarcane varieties (e.g., Co 86032, CoJ 64)'
          '\n• Remove and destroy infected leaves early'
          '\n• Apply fungicides like propiconazole or mancozeb at early stage'
          '\n• Avoid dense planting; improve air movement with proper spacing'
          '\n• Practice crop rotation and field sanitation'
          '\n\n⚠️ NOTE: While not usually fatal, rust significantly reduces yield and sugar quality – monitor fields regularly!',
    },
    {
      'image': 'assets/SugarcaneLeafYellow.jpeg',
      'title': 'Yellow',
      'description': 'A viral disease caused by *Sugarcane yellow leaf virus* (SCYLV), mainly transmitted by aphids and affecting sugarcane leaf health and yield:\n\n'
          '🍃 LEAF SYMPTOMS:'
          '\n• Bright yellowing of the midrib, especially on upper leaves'
          '\n• Yellowing spreads outward from the midrib over time'
          '\n• Leaves become pale, thin, and may roll slightly'
          '\n• In severe cases, leaves dry up and fall off early'
          '\n\n🌿 PLANT EFFECTS:'
          '\n• Reduced plant vigor and growth'
          '\n• Shorter stalks and thinner canes'
          '\n• Lower juice quality and sugar recovery'
          '\n• Often no external symptoms in early stages (asymptomatic carriers)'
          '\n\n🌧️ WHEN IT SPREADS:'
          '\n• Spread mainly by sugarcane aphids (Melanaphis sacchari)'
          '\n• Also spreads through infected seed setts (planting material)'
          '\n• More common in areas with warm temperatures and continuous cropping'
          '\n\n✅ HOW TO CONTROL IT:'
          '\n• Use virus-free, certified seed setts for planting'
          '\n• Control aphid populations using neem oil or selective insecticides'
          '\n• Remove and destroy infected plants and residues'
          '\n• Avoid ratooning fields with visible infections'
          '\n• Practice crop rotation and proper field sanitation'
          '\n\n⚠️ NOTE: Leaf yellow may look mild at first, but it silently reduces yield and sugar content – clean planting material is key!',
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
