import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class MultipleButtonScroll extends StatefulWidget {
  const MultipleButtonScroll({super.key});

  @override
  MultipleButtonScrollState createState() => MultipleButtonScrollState();
}

class MultipleButtonScrollState extends State<MultipleButtonScroll>
    with SingleTickerProviderStateMixin {
  // Animation controller
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  // List of image paths for the buttons
  final List<String> buttonImages = [
    'assets/Apple.png',
    'assets/Guava.png',
    'assets/Cherry.png',
    'assets/Lemon.png',
    'assets/Grapes.png',
    'assets/Jamun.png',
    'assets/Corn.png',
    'assets/Orange.png',
    'assets/Peach.png',
    'assets/Pomegranate.png',
    'assets/Potato.png',
    'assets/Rice.png',
    'assets/Rose.png',
    'assets/Strawberry.png',
    'assets/Sugarcane.png',
    'assets/Tomato.png',
  ];

  // List of text labels for the buttons
  final List<String> buttonLabels = [
    'Apple',
    'Guava',
    'Cherry',
    'Lemon',
    'Grapes',
    'Jamun',
    'Corn',
    'Orange',
    'Peach',
    'Pomegranate',
    'Potato',
    'Rice',
    'Rose',
    'Strawberry',
    'Sugarcane',
    'Tomato',
  ];

  @override
  void initState() {
    super.initState();
    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    // Initialize scale animation
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  // Function to handle button tap with animation
  void _onButtonTap(int index, BuildContext context) {
    _controller.forward().then((_) {
      _controller.reverse(); // Reverse the animation after completion
      _navigateToScreen(context, index); // Navigate to the next screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: buttonImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => _onButtonTap(index, context), // Trigger animation
              child: ScaleTransition(
                scale: _scaleAnimation, // Apply scale animation
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
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
                          buttonImages[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      buttonLabels[index],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to handle navigation to a new screen
  void _navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Apple()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Guava()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Cherry()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Lemon()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Grapes()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Jamun()),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Corn()),
        );
        break;
      case 7:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Orange()),
        );
        break;
      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Peach()),
        );
        break;
      case 9:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Pomegranate()),
        );
        break;
      case 10:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Potato()),
        );
        break;
      case 11:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Rice()),
        );
        break;
      case 12:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Rose()),
        );
        break;
      case 13:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Strawberry()),
        );
        break;
      case 14:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Sugarcane()),
        );
        break;
      case 15:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Tomato()),
        );
        break;
      default:
        break;
    }
  }
}

// Screen for Button 1
class Apple extends StatefulWidget {
  const Apple({super.key});

  @override
  State<Apple> createState() => _AppleState();
}

class _AppleState extends State<Apple> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText = "🍎 Apple Tree Care Guide 🍏\n\n"
      "Apples are not only delicious but also packed with fiber and vitamin C, making them a healthy choice for your garden and table. Proper care is key to growing a healthy apple tree that produces sweet, juicy fruits.\n\n"
      "🌿 Planting:\n"
      "- Choose a sunny location with well-drained soil.\n"
      "- Plant bare-root apple trees in early spring or fall.\n"
      "- Space trees 15-20 feet apart for standard varieties and 10 feet for dwarf types.\n\n"
      "💧 Watering:\n"
      "- Water young apple trees deeply once a week during dry periods.\n"
      "- Mature trees usually need about 1 inch of water per week.\n"
      "- Avoid overwatering; soggy soil can lead to root rot.\n\n"
      "🌼 Fertilizing:\n"
      "- Fertilize in early spring before new growth begins.\n"
      "- Use a balanced fertilizer or compost to enrich the soil.\n"
      "- Avoid excessive nitrogen; it promotes leafy growth over fruit production.\n\n"
      "✂️ Pruning:\n"
      "- Prune annually in late winter while trees are dormant.\n"
      "- Remove dead, diseased, or crowded branches to improve airflow.\n"
      "- Shape the tree to allow sunlight to reach all parts.\n\n"
      "🛡️ Pest & Disease Management:\n"
      "- Monitor regularly for pests like aphids, codling moths, and apple maggots.\n"
      "- Use organic sprays or introduce beneficial insects when needed.\n"
      "- Prevent fungal diseases with good spacing and airflow.\n\n"
      "🍏 Harvesting:\n"
      "- Harvest apples when they are fully colored and easily come off the branch.\n"
      "- Taste one to check sweetness and ripeness.\n\n"
      "With love, patience, and proper care, your apple tree will reward you with bountiful harvests for many years! 🌳❤️";
  Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Apple"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Apple.png'),
              ),
              const SizedBox(height: 16),
              Text(
                "Apple Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for Button 2
class Guava extends StatefulWidget {
  const Guava({super.key});

  @override
  State<Guava> createState() => _GuavaState();
}

class _GuavaState extends State<Guava> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText = "🍐 Guava Tree Care Guide 🥝🍐\n\n"
      "Guavas are tropical fruits known for their sweet and fragrant flavor. They are rich in vitamin C, fiber, and antioxidants, making them a powerhouse for nutrition and a rewarding plant for your garden.\n\n"
      "🌿 Planting:\n"
      "- Choose a warm, sunny spot with well-drained soil.\n"
      "- Plant guava trees during the warm months, ideally in spring.\n"
      "- Space trees about 10-15 feet apart to allow full growth.\n\n"
      "💧 Watering:\n"
      "- Water young guava trees 2-3 times a week.\n"
      "- Mature trees need deep watering once per week during dry periods.\n"
      "- Avoid waterlogging, as guavas dislike soggy roots.\n\n"
      "🌼 Fertilizing:\n"
      "- Fertilize guava trees three times a year: spring, summer, and fall.\n"
      "- Use a balanced fertilizer rich in nitrogen, phosphorus, and potassium.\n"
      "- Organic compost can enhance fruit production and tree health.\n\n"
      "✂️ Pruning:\n"
      "- Prune in late winter or early spring to maintain shape.\n"
      "- Remove dead or weak branches and any branches that cross over each other.\n"
      "- Regular pruning encourages better fruiting and air circulation.\n\n"
      "🛡️ Pest & Disease Management:\n"
      "- Watch for fruit flies, aphids, and whiteflies.\n"
      "- Apply neem oil or insecticidal soap for organic control.\n"
      "- Keep the area around the tree clean to prevent fungal issues.\n\n"
      "🍐 Harvesting:\n"
      "- Pick guavas when they soften slightly and emit a strong, sweet fragrance.\n"
      "- Handle gently as ripe guavas are delicate.\n\n"
      "With care and attention, your guava tree will provide delicious fruits and beauty to your garden! 🌳💚";
  Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Guava"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Guava.png'),
              ),
              const SizedBox(height: 16),
              Text(
                "Guava Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for Button 3
class Cherry extends StatefulWidget {
  const Cherry({super.key});

  @override
  State<Cherry> createState() => _CherryState();
}

class _CherryState extends State<Cherry> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText = "🍒 Cherry Tree Care Guide 🍒\n\n"
      "Cherries are delightful fruits enjoyed fresh, dried, or in desserts. They are rich in antioxidants, vitamins, and fiber. Growing cherries requires a little care, but they reward you with beautiful blossoms and tasty fruits.\n\n"
      "🌿 Planting:\n"
      "- Choose a sunny location with good air circulation.\n"
      "- Well-drained, fertile soil with a pH of 6.0–7.0 is ideal.\n"
      "- Plant cherry trees in early spring or late fall when the soil is moist.\n"
      "- Space sweet cherry trees about 30-40 feet apart and sour cherry trees about 20 feet apart.\n\n"
      "💧 Watering:\n"
      "- Water deeply every 7–10 days during dry periods.\n"
      "- Young trees require consistent moisture, especially during fruit development.\n"
      "- Avoid standing water as it can cause root diseases.\n\n"
      "🌼 Fertilizing:\n"
      "- Fertilize lightly in early spring with a balanced fertilizer.\n"
      "- Avoid excessive nitrogen to prevent too much leafy growth.\n"
      "- Mulch with organic matter to retain moisture and enrich the soil.\n\n"
      "✂️ Pruning:\n"
      "- Prune in late winter to early spring while the tree is dormant.\n"
      "- Remove dead, damaged, or inward-growing branches.\n"
      "- Maintain an open center to allow sunlight penetration.\n\n"
      "🛡️ Pest & Disease Management:\n"
      "- Watch for aphids, cherry fruit flies, and borers.\n"
      "- Apply organic sprays or introduce beneficial insects when needed.\n"
      "- Prevent fungal diseases by pruning for airflow and keeping leaves dry.\n\n"
      "🍒 Harvesting:\n"
      "- Harvest cherries when they are fully colored, plump, and flavorful.\n"
      "- Pick with the stem attached to prolong freshness.\n"
      "- Handle cherries carefully as they bruise easily.\n\n"
      "With patience and care, your cherry tree will fill your garden with beauty and sweet rewards! 🌸❤️";
  Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cherry"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Cherry.png'),
              ),
              const SizedBox(height: 16),
              Text(
                "Cherry Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for Button 4
class Lemon extends StatefulWidget {
  const Lemon({super.key});

  @override
  State<Lemon> createState() => _LemonState();
}

class _LemonState extends State<Lemon> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText = "🍋 Lemon Tree Care Guide 🍋\n\n"
      "Lemons are a refreshing citrus fruit packed with vitamin C and antioxidants. A lemon tree brings beauty to your garden and provides abundant juicy fruits with the right care.\n\n"
      "🌿 Planting:\n"
      "- Choose a sunny, wind-protected location.\n"
      "- Plant in well-draining soil with a slightly acidic pH (5.5–6.5).\n"
      "- Plant in early spring when the danger of frost has passed.\n"
      "- Space trees about 12–25 feet apart depending on variety.\n\n"
      "💧 Watering:\n"
      "- Water young trees 2–3 times a week to establish strong roots.\n"
      "- Mature trees need deep watering once every 7–10 days.\n"
      "- Keep soil moist but not soggy. Use mulch to conserve moisture.\n\n"
      "🌼 Fertilizing:\n"
      "- Feed lemon trees with a citrus-specific fertilizer.\n"
      "- Apply fertilizer 3–4 times a year: early spring, summer, and fall.\n"
      "- Balance nitrogen with phosphorus and potassium to promote fruits.\n\n"
      "✂️ Pruning:\n"
      "- Prune in late winter or early spring before new growth starts.\n"
      "- Remove any dead, diseased, or crossing branches.\n"
      "- Maintain an open canopy for better air circulation and sunlight.\n\n"
      "🛡️ Pest & Disease Management:\n"
      "- Watch for pests like aphids, citrus leaf miners, and spider mites.\n"
      "- Use neem oil, horticultural oil, or insecticidal soap for organic control.\n"
      "- Keep an eye out for fungal diseases and treat early if spotted.\n\n"
      "🍋 Harvesting:\n"
      "- Lemons are ready to harvest when they are fully yellow and slightly soft.\n"
      "- Twist gently off the branch or clip with pruning shears.\n"
      "- Regular picking encourages more fruit production.\n\n"
      "With consistent love and care, your lemon tree will brighten your garden and kitchen with its vibrant fruits! 🌳💛";
  Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lemon"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Lemon.png'),
              ),
              const SizedBox(height: 16),
Text(
                "Lemon Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for Button 5
class Grapes extends StatefulWidget {
  const Grapes({super.key});

  @override
  State<Grapes> createState() => _GrapesState();
}

class _GrapesState extends State<Grapes> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText = "🍇 Grapevine Care Guide 🍇\n\n"
      "Grapes are delicious fruits perfect for eating fresh, making juice, or creating wine. Growing grapevines adds beauty to your garden and rewards you with sweet clusters of fruit when cared for properly.\n\n"
      "🌿 Planting:\n"
      "- Choose a sunny site with at least 7–8 hours of direct sunlight daily.\n"
      "- Plant in well-drained, loamy soil with good air circulation.\n"
      "- Space grapevines 6–10 feet apart depending on the variety.\n"
      "- Plant in early spring after the last frost.\n\n"
      "💧 Watering:\n"
      "- Water young vines regularly to establish roots.\n"
      "- Mature vines need deep watering every 7–14 days during dry periods.\n"
      "- Avoid overhead watering to prevent fungal diseases.\n\n"
      "🌼 Fertilizing:\n"
      "- Apply a balanced fertilizer in early spring.\n"
      "- Avoid heavy fertilizing as it encourages leafy growth over fruiting.\n"
      "- Mulch around the base to retain moisture and suppress weeds.\n\n"
      "✂️ Pruning:\n"
      "- Prune grapevines heavily each winter when dormant.\n"
      "- Remove about 90% of the previous season’s growth to encourage fruiting.\n"
      "- Proper pruning is essential for large, high-quality grape clusters.\n\n"
      "🛡️ Pest & Disease Management:\n"
      "- Watch for pests like grape berry moths, leafhoppers, and aphids.\n"
      "- Use neem oil or insecticidal soap if infestations occur.\n"
      "- Prevent fungal diseases by ensuring good airflow and removing any fallen leaves.\n\n"
      "🍇 Harvesting:\n"
      "- Harvest grapes when they are fully colored, plump, and sweet.\n"
      "- Taste a few before harvesting; grapes do not continue ripening after picking.\n"
      "- Use scissors or pruners to clip the bunches carefully.\n\n"
      "With dedication and the right care, your grapevines will thrive and provide bountiful harvests for years to come! 🌿💜";
  Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Grapes"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Grapes.png'),
              ),
              const SizedBox(height: 16),
              Text(
                "Grapes Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for Button 6
class Jamun extends StatefulWidget {
  const Jamun({super.key});

  @override
  State<Jamun> createState() => _JamunState();
}

class _JamunState extends State<Jamun> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText = "🍇 Jamun Tree Care Guide 🍇\n\n"
      "Jamun (Syzygium cumini), also known as Indian Blackberry, is a delicious, nutrient-rich fruit tree known for its health benefits, particularly in managing blood sugar levels. With the right care, a Jamun tree can thrive and produce abundant fruit.\n\n"
      "🌿 Planting:\n"
      "- Choose a sunny location with well-drained, rich soil.\n"
      "- Plant during the monsoon season or early spring.\n"
      "- Space Jamun trees about 8–10 meters apart for healthy growth.\n\n"
      "💧 Watering:\n"
      "- Water young trees regularly to help establish roots.\n"
      "- Mature trees are drought-tolerant but benefit from deep watering every 10–15 days during dry periods.\n"
      "- Avoid water stagnation to prevent root rot.\n\n"
      "🌼 Fertilizing:\n"
      "- Apply organic compost or well-rotted manure annually during the growing season.\n"
      "- Use a balanced fertilizer (NPK 10-10-10) in spring.\n"
      "- Mulching helps in retaining soil moisture and suppressing weeds.\n\n"
      "✂️ Pruning:\n"
      "- Light pruning in early spring helps shape the tree and remove deadwood.\n"
      "- Avoid heavy pruning as Jamun trees naturally develop a good canopy.\n"
      "- Remove suckers and weak branches regularly.\n\n"
      "🛡️ Pest & Disease Management:\n"
      "- Monitor for pests like fruit flies, caterpillars, and aphids.\n"
      "- Use organic neem spray or biological controls if needed.\n"
      "- Ensure good air circulation around the tree to prevent fungal issues.\n\n"
      "🍇 Harvesting:\n"
      "- Jamun fruits are ready for harvest when they turn deep purple or black.\n"
      "- Shake the tree gently or handpick to collect ripe fruits.\n"
      "- Jamuns have a short shelf life, so consume or preserve them quickly after harvest.\n\n"
      "With patience and love, your Jamun tree will reward you with nutritious and delicious fruits year after year! 🌳💜";
  Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Jamun"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Jamun.png'),
              ),
              const SizedBox(height: 16),
              Text(
                "Jamun Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for Button 7
class Corn extends StatefulWidget {
  const Corn({super.key});

  @override
  State<Corn> createState() => _CornState();
}

class _CornState extends State<Corn> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText = "🌽 Corn Plant Care Guide 🌽\n\n"
      "Corn, or maize, is a staple crop known for its tall stalks and sweet kernels. With proper care, you can enjoy a delicious harvest right from your backyard!\n\n"
      "🌿 Planting:\n"
      "- Choose a sunny location; corn needs full sun.\n"
      "- Plant in blocks (not single rows) to ensure good pollination.\n"
      "- Sow seeds directly into the soil after the last frost.\n"
      "- Space seeds 8–10 inches apart in rows about 30 inches apart.\n\n"
      "💧 Watering:\n"
      "- Keep soil consistently moist, especially during pollination and ear development.\n"
      "- Water deeply about once or twice per week depending on weather.\n"
      "- Avoid letting the soil dry out completely.\n\n"
      "🌼 Fertilizing:\n"
      "- Use a nitrogen-rich fertilizer when plants are about 6 inches tall.\n"
      "- Fertilize again when plants start producing tassels.\n"
      "- Compost or organic matter improves soil health and water retention.\n\n"
      "✂️ Maintenance:\n"
      "- Remove weeds carefully to avoid disturbing corn roots.\n"
      "- Mound soil around the base of stalks as they grow to support stability.\n\n"
      "🛡️ Pest & Disease Management:\n"
      "- Watch for pests like corn earworms, cutworms, and aphids.\n"
      "- Use organic insecticides if infestations occur.\n"
      "- Rotate crops yearly to prevent soil-borne diseases.\n\n"
      "🌽 Harvesting:\n"
      "- Harvest when silks turn brown and ears feel full and firm.\n"
      "- Pull back a little husk and check kernels: they should squirt milky liquid when punctured.\n"
      "- Harvest early in the morning for best flavor!\n\n"
      "With the right care, your corn plants will grow tall and strong, providing sweet, juicy ears perfect for summer meals! 🌾💛";
  Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Corn"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Corn.png'),
              ),
              const SizedBox(height: 16),
              Text(
                "Corn Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for Button 8
class Orange extends StatefulWidget {
  const Orange({super.key});

  @override
  State<Orange> createState() => _OrangeState();
}

class _OrangeState extends State<Orange> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText = "🍊 Orange Tree Care Guide 🍊\n\n"
      "Oranges are one of the most popular fruits worldwide, known for their sweet and tangy taste. With proper care, you can grow a healthy and fruitful orange tree in your garden.\n\n"
      "🌿 Planting:\n"
      "- Choose a sunny location with well-drained soil.\n"
      "- Plant during spring after the frost has passed.\n"
      "- Space trees about 12–25 feet apart depending on variety.\n\n"
      "💧 Watering:\n"
      "- Water regularly to keep soil moist, especially during dry periods.\n"
      "- Mature trees need about 1 inch of water per week.\n"
      "- Avoid overwatering, as it may lead to root rot.\n\n"
      "🌼 Fertilizing:\n"
      "- Fertilize orange trees 2–3 times a year with a balanced citrus fertilizer.\n"
      "- Apply in early spring, mid-summer, and late fall.\n"
      "- Organic compost can also be beneficial for soil health.\n\n"
      "✂️ Pruning:\n"
      "- Prune in late winter or early spring before new growth starts.\n"
      "- Remove dead or damaged branches and any that cross over each other.\n"
      "- Shape the tree to allow sunlight to reach all parts for even fruiting.\n\n"
      "🛡️ Pest & Disease Management:\n"
      "- Watch for common pests like aphids, spider mites, and whiteflies.\n"
      "- Use neem oil or insecticidal soap for natural pest control.\n"
      "- Prevent fungal diseases by ensuring good airflow around the tree.\n\n"
      "🍊 Harvesting:\n"
      "- Oranges are ready for harvest when they are fully colored (orange).\n"
      "- Taste test a fruit to check for sweetness.\n"
      "- Harvest by gently twisting the fruit off the branch to avoid damage.\n\n"
      "With proper care and attention, your orange tree will thrive and provide a bountiful harvest of sweet, juicy oranges for many seasons to come! 🌳🍊";
  Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orange"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Orange.png'),
              ),
              const SizedBox(height: 16),
              Text(
                "Orange Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for Button 9
class Peach extends StatefulWidget {
  const Peach({super.key});

  @override
  State<Peach> createState() => _PeachState();
}

class _PeachState extends State<Peach> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText = "🍑 Peach Tree Care Guide 🍑\n\n"
      "Peaches are delicious, juicy fruits that thrive in warm climates. Whether you're planting a small tree or a larger orchard, proper care ensures healthy trees and a bountiful harvest.\n\n"
      "🌿 Planting:\n"
      "- Choose a sunny location with well-drained, slightly acidic soil.\n"
      "- Plant peaches in early spring, after the frost has passed.\n"
      "- Space trees about 15–20 feet apart to allow for growth.\n\n"
      "💧 Watering:\n"
      "- Water young peach trees regularly, keeping the soil consistently moist.\n"
      "- Mature trees need about 1 inch of water per week.\n"
      "- Avoid overhead watering to reduce the risk of fungal diseases.\n\n"
      "🌼 Fertilizing:\n"
      "- Fertilize peach trees in early spring before new growth begins.\n"
      "- Use a balanced fertilizer or compost to enrich the soil.\n"
      "- Avoid excessive nitrogen, which can promote leafy growth over fruiting.\n\n"
      "✂️ Pruning:\n"
      "- Prune peach trees in late winter or early spring while the tree is dormant.\n"
      "- Remove dead, diseased, or broken branches.\n"
      "- Shape the tree to promote a strong central leader and ensure good sunlight penetration.\n\n"
      "🛡️ Pest & Disease Management:\n"
      "- Watch for pests like aphids, peach tree borers, and scale insects.\n"
      "- Apply organic insecticides or introduce beneficial insects as needed.\n"
      "- Prevent fungal diseases by ensuring good air circulation around the tree.\n\n"
      "🍑 Harvesting:\n"
      "- Peaches are ready to harvest when they have fully colored and are slightly soft to the touch.\n"
      "- Gently twist the fruit off the tree to avoid bruising.\n"
      "- Taste one to check for sweetness and ripeness.\n\n"
      "With proper care, your peach tree will reward you with juicy, fragrant peaches that are perfect for eating fresh or using in recipes! 🌳🍑";
  Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Peach"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Peach.png'),
              ),
              const SizedBox(height: 16),
              Text(
                "Peach Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for Button 10
class Pomegranate extends StatefulWidget {
  const Pomegranate({super.key});

  @override
  State<Pomegranate> createState() => _PomegranateState();
}

class _PomegranateState extends State<Pomegranate> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText = "🍈 Pomegranate Tree Care Guide 🍈\n\n"
      "Pomegranates are ancient fruits prized for their jewel-like seeds and sweet-tart flavor. These hardy plants are drought-tolerant and can thrive with minimal care once established.\n\n"
      "🌿 Planting:\n"
      "- Choose a sunny, warm location with well-drained soil.\n"
      "- Plant pomegranates in early spring or fall.\n"
      "- Space trees about 12–15 feet apart for optimal growth.\n\n"
      "💧 Watering:\n"
      "- Water young trees every 7–10 days during the first year.\n"
      "- Mature trees are drought-tolerant but produce better fruit with regular watering.\n"
      "- Allow the soil to dry slightly between waterings.\n\n"
      "🌼 Fertilizing:\n"
      "- Fertilize in early spring before new growth appears.\n"
      "- Use a balanced, slow-release fertilizer or organic compost.\n"
      "- Over-fertilizing can reduce fruit production.\n\n"
      "✂️ Pruning:\n"
      "- Prune lightly in late winter to remove dead or crossing branches.\n"
      "- Train young plants to a single trunk or a few main stems.\n"
      "- Pruning improves airflow and sunlight exposure for better fruiting.\n\n"
      "🛡️ Pest & Disease Management:\n"
      "- Pomegranates are generally pest-resistant but watch for aphids and whiteflies.\n"
      "- Use organic insecticides if infestations occur.\n"
      "- Good air circulation helps prevent fungal diseases.\n\n"
      "🍈 Harvesting:\n"
      "- Harvest when fruits are deep red, heavy, and make a metallic sound when tapped.\n"
      "- Cut fruits from the branch rather than pulling to avoid damaging the tree.\n"
      "- Ripe pomegranates can be stored in a cool, dry place for several weeks.\n\n"
      "With proper care, your pomegranate tree will offer beautiful flowers, delicious fruit, and a striking ornamental appeal to your garden! 🌳❤️";
  Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pomegranate"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Pomegranate.png'),
              ),
              const SizedBox(height: 16),
              Text(
                "Pomegranate Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for Button 11
class Potato extends StatefulWidget {
  const Potato({super.key});

  @override
  State<Potato> createState() => _PotatoState();
}

class _PotatoState extends State<Potato> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText = "🥔 Potato Plant Care Guide 🥔\n\n"
      "Potatoes are a versatile and beloved vegetable, easy to grow at home with the right conditions. With a little care, you can enjoy a plentiful harvest from your garden or even a large container.\n\n"
      "🌿 Planting:\n"
      "- Choose a sunny location with loose, well-drained soil.\n"
      "- Plant seed potatoes (cut pieces with eyes) in early spring after the last frost.\n"
      "- Space pieces 12 inches apart and bury them 4 inches deep.\n\n"
      "💧 Watering:\n"
      "- Water regularly to keep the soil evenly moist, especially during flowering.\n"
      "- Avoid letting the soil dry out completely or become waterlogged.\n"
      "- Mulch around plants to retain moisture and suppress weeds.\n\n"
      "🌼 Fertilizing:\n"
      "- Enrich soil with compost before planting.\n"
      "- Apply a balanced fertilizer when the plants are 6 inches tall.\n"
      "- Avoid excessive nitrogen; it promotes leafy growth over tuber production.\n\n"
      "✂️ Care and Maintenance:\n"
      "- Hill soil up around the stems as the plants grow to protect developing tubers from sunlight.\n"
      "- Monitor for pests like Colorado potato beetles and aphids.\n"
      "- Remove any affected leaves and use organic insecticides if needed.\n\n"
      "🛡️ Pest & Disease Management:\n"
      "- Practice crop rotation to reduce risk of soil-borne diseases.\n"
      "- Watch for blight and treat early with fungicidal sprays if necessary.\n"
      "- Good spacing and air circulation reduce disease risk.\n\n"
      "🥔 Harvesting:\n"
      "- Harvest 'new potatoes' two weeks after flowering.\n"
      "- For mature potatoes, wait until the plants die back.\n"
      "- Carefully dig up potatoes with a spade or fork to avoid bruising.\n\n"
      "Growing potatoes is rewarding and surprisingly easy, offering fresh, delicious results for your kitchen table! 🌱🥔";
  Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Potato"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Potato.png'),
              ),
              const SizedBox(height: 16),
              Text(
                "Potato Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for Button 12
class Rice extends StatefulWidget {
  const Rice({super.key});

  @override
  State<Rice> createState() => _RiceState();
}

class _RiceState extends State<Rice> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText =
                  "🌾 Rice Plant Care Guide 🌾\n\n"
                  "Rice is a staple food for over half the world’s population. It thrives in warm, wet environments and can be grown in paddies, gardens, or containers with careful management.\n\n"
                  "🌿 Planting:\n"
                  "- Select a warm, sunny location with heavy clay or loamy soil.\n"
                  "- Start seeds indoors or sow directly in the soil when temperatures stay above 20°C (68°F).\n"
                  "- Space seedlings about 6 inches apart.\n\n"
                  "💧 Watering:\n"
                  "- Keep the soil constantly wet, especially during early growth.\n"
                  "- Rice prefers flooded conditions but can tolerate moist soils in certain varieties.\n"
                  "- Drain fields slightly as plants mature to encourage stronger root systems.\n\n"
                  "🌼 Fertilizing:\n"
                  "- Enrich soil with compost before planting.\n"
                  "- Apply nitrogen-rich fertilizer at key stages: early growth, tillering, and panicle formation.\n"
                  "- Organic fertilizers can enhance soil health and crop yield.\n\n"
                  "✂️ Care and Maintenance:\n"
                  "- Weed the area frequently, especially in early stages.\n"
                  "- Thin out weak seedlings to allow strong plants more space.\n"
                  "- Protect young plants from birds and pests using nets if necessary.\n\n"
                  "🛡️ Pest & Disease Management:\n"
                  "- Monitor for common pests like rice stem borers and leafhoppers.\n"
                  "- Use integrated pest management (IPM) practices or organic insecticides.\n"
                  "- Practice crop rotation to reduce disease buildup in soil.\n\n"
                  "🌾 Harvesting:\n"
                  "- Harvest rice when grains are firm and golden, usually 3-6 months after planting.\n"
                  "- Cut the stalks and dry them thoroughly before threshing to remove grains.\n"
                  "- Store harvested rice in cool, dry conditions.\n\n"
                  "With patience, consistent care, and the right conditions, you can enjoy a rewarding rice harvest right from your garden! 🌱🌾";
                    Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rice"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Rice.png'),
              ),
              const SizedBox(height: 16),
              Text(
                "Rice Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for Button 13
class Rose extends StatefulWidget {
  const Rose({super.key});

  @override
  State<Rose> createState() => _RoseState();
}

class _RoseState extends State<Rose> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText =
                  "🌹 Rose Plant Care Guide 🌹\n\n"
                  "Roses are timeless symbols of beauty and love, adored for their exquisite blooms and enchanting fragrance. With the right care, you can grow stunning roses that flourish season after season.\n\n"
                  "🌿 Planting:\n"
                  "- Choose a sunny spot with at least 6 hours of sunlight daily.\n"
                  "- Plant in well-drained, fertile soil rich in organic matter.\n"
                  "- Space roses adequately to allow good airflow between plants.\n\n"
                  "💧 Watering:\n"
                  "- Water deeply once or twice a week, depending on weather conditions.\n"
                  "- Avoid overhead watering; water at the base to prevent fungal diseases.\n"
                  "- Keep soil consistently moist but not waterlogged.\n\n"
                  "🌼 Fertilizing:\n"
                  "- Feed roses every 4-6 weeks during the growing season.\n"
                  "- Use a balanced fertilizer or a special rose fertilizer rich in phosphorus.\n"
                  "- Organic compost and manure improve bloom size and plant health.\n\n"
                  "✂️ Pruning:\n"
                  "- Prune in late winter or early spring before new growth starts.\n"
                  "- Remove dead, damaged, or weak stems.\n"
                  "- Shape the plant to encourage outward growth and more blooms.\n\n"
                  "🛡️ Pest & Disease Management:\n"
                  "- Watch for aphids, spider mites, and black spot disease.\n"
                  "- Treat early with neem oil or insecticidal soap.\n"
                  "- Ensure good air circulation and remove fallen leaves to prevent diseases.\n\n"
                  "🌸 Blooming Tips:\n"
                  "- Deadhead (remove faded flowers) regularly to promote continuous blooming.\n"
                  "- Mulch around the base to retain moisture and suppress weeds.\n"
                  "- Roses appreciate a bit of love — regular care will reward you with vibrant, stunning flowers.\n\n"
                  "A rose's beauty is a testament to patience, care, and passion. Grow yours with love and they will reward you generously! 🌹✨";
                    Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rose"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Rose.png'),
              ),
              const SizedBox(height: 16),
              Text(
                "Rose Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for Button 14
class Strawberry extends StatefulWidget {
  const Strawberry({super.key});

  @override
  State<Strawberry> createState() => _StrawberryState();
}

class _StrawberryState extends State<Strawberry> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText =
                  "🍓 Strawberry Plant Care Guide 🍓\n\n"
                  "Strawberries are delightful fruits known for their juicy sweetness and vibrant color. They are easy to grow and perfect for home gardens or containers.\n\n"
                  "🌿 Planting:\n"
                  "- Choose a sunny location with rich, well-drained soil.\n"
                  "- Plant strawberries in early spring when the soil is workable.\n"
                  "- Space plants about 12-18 inches apart in rows.\n\n"
                  "💧 Watering:\n"
                  "- Water regularly to keep the soil consistently moist.\n"
                  "- Avoid overhead watering; water at the base to minimize fungal diseases.\n"
                  "- Mulch around plants to retain moisture and prevent weeds.\n\n"
                  "🌼 Fertilizing:\n"
                  "- Fertilize with a balanced fertilizer during planting.\n"
                  "- After the first harvest, feed lightly to encourage more fruiting.\n"
                  "- Avoid heavy nitrogen, which causes leafy growth instead of fruits.\n\n"
                  "✂️ Pruning:\n"
                  "- Remove old leaves and runners after the growing season.\n"
                  "- Thin out overcrowded plants to allow good air circulation.\n\n"
                  "🛡️ Pest & Disease Management:\n"
                  "- Protect from slugs, snails, and birds (use netting if needed).\n"
                  "- Watch for signs of powdery mildew or root rot.\n"
                  "- Maintain clean beds and rotate crops to prevent disease buildup.\n\n"
                  "🍓 Harvesting:\n"
                  "- Pick strawberries when they are fully red and ripe.\n"
                  "- Harvest early in the day for the best flavor.\n"
                  "- Handle berries gently to avoid bruising.\n\n"
                  "With love and regular attention, your strawberry plants will reward you with baskets of sweet, homegrown fruit! 🌿❤️";
  Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Strawberry"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Strawberry.png'),
              ),
              const SizedBox(height: 16),
              Text(
                "Strawberry Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for Button 15
class Sugarcane extends StatefulWidget {
  const Sugarcane({super.key});

  @override
  State<Sugarcane> createState() => _SugarcaneState();
}

class _SugarcaneState extends State<Sugarcane> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText =
                  "🌱 Sugarcane Plant Care Guide 🌱\n\n"
                  "Sugarcane is a tall, perennial grass known for its juicy stalks, which are the main source of sugar production. It thrives in tropical and subtropical climates and can be a rewarding crop with proper care.\n\n"
                  "🌿 Planting:\n"
                  "- Plant sugarcane using healthy stalk cuttings, each with at least one bud.\n"
                  "- Choose a location with full sun and fertile, well-drained soil.\n"
                  "- Space rows about 3-4 feet apart to allow room for growth.\n\n"
                  "💧 Watering:\n"
                  "- Water regularly to maintain consistently moist soil, especially during dry periods.\n"
                  "- Avoid waterlogging, which can cause root diseases.\n"
                  "- Reduce watering slightly as the plant matures to encourage sugar concentration.\n\n"
                  "🌼 Fertilizing:\n"
                  "- Fertilize with a nitrogen-rich fertilizer early in the growing season.\n"
                  "- Apply compost or organic manure to enrich the soil.\n"
                  "- Additional potassium can help improve the sweetness of the stalks.\n\n"
                  "✂️ Maintenance:\n"
                  "- Keep the field weed-free, especially during the early stages.\n"
                  "- Hill up soil around the base of plants to support heavy stalks.\n"
                  "- Thin weaker shoots to focus growth on stronger canes.\n\n"
                  "🛡️ Pest & Disease Management:\n"
                  "- Watch for pests like borers and aphids.\n"
                  "- Practice crop rotation and maintain clean fields to prevent diseases.\n"
                  "- Use organic treatments or beneficial insects for pest control.\n\n"
                  "🌱 Harvesting:\n"
                  "- Harvest sugarcane when stalks are mature, firm, and sweet (usually 10–18 months after planting).\n"
                  "- Cut close to the ground where the highest sugar concentration is found.\n\n"
                  "With the right conditions and attentive care, sugarcane can yield rich, juicy harvests, perfect for fresh juice or sugar production! 🍬🌿";
                  Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sugarcane"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Sugarcane.png'),
              ),
              const SizedBox(height: 16),
              Text(
                "Sugarcane Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen for Button 16
class Tomato extends StatefulWidget {
  const Tomato({super.key});

  @override
  State<Tomato> createState() => _TomatoState();
}

class _TomatoState extends State<Tomato> {
  bool showUrdu = false;
  bool isLoading = false;
  final translator = GoogleTranslator();
  String translatedText = '';
  final String englishText =
                  "🍅 Tomato Plant Care Guide 🍅\n\n"
                  "Tomatoes are one of the most popular garden vegetables, prized for their juicy, flavorful fruits. With the right care, you can enjoy a bountiful harvest throughout the season.\n\n"
                  "🌿 Planting:\n"
                  "- Choose a sunny location that receives 6-8 hours of sunlight daily.\n"
                  "- Plant tomatoes in fertile, well-drained soil rich in organic matter.\n"
                  "- Space plants 18-24 inches apart to allow air circulation.\n\n"
                  "💧 Watering:\n"
                  "- Water consistently and deeply, about 1-2 inches per week.\n"
                  "- Water at the base to avoid wetting the leaves and prevent disease.\n"
                  "- Mulch around plants to retain moisture and reduce weeds.\n\n"
                  "🌼 Fertilizing:\n"
                  "- Use a balanced fertilizer when planting.\n"
                  "- Once fruits start forming, switch to a fertilizer higher in phosphorus and potassium.\n"
                  "- Avoid over-fertilizing with nitrogen, as it encourages leafy growth over fruiting.\n\n"
                  "✂️ Pruning:\n"
                  "- Remove suckers (small shoots) that grow between the main stem and branches.\n"
                  "- Support plants with stakes, cages, or trellises to keep fruit off the ground.\n\n"
                  "🛡️ Pest & Disease Management:\n"
                  "- Watch for pests like aphids, whiteflies, and tomato hornworms.\n"
                  "- Use neem oil, insecticidal soap, or companion planting to control pests.\n"
                  "- Rotate crops annually to prevent soil-borne diseases like blight.\n\n"
                  "🍅 Harvesting:\n"
                  "- Pick tomatoes when they are fully colored and slightly soft.\n"
                  "- Gently twist or cut fruits off the plant to avoid damaging vines.\n\n"
                  "With careful attention, your tomato plants will produce vibrant, tasty fruits perfect for salads, sauces, and more! 🌞🌱";
                    Future<void> _toggleLanguage() async {
    setState(() {
      isLoading = true;
      showUrdu = !showUrdu;
    });

    if (showUrdu && translatedText.isEmpty) {
      final translation = await translator.translate(englishText, to: 'ur');
      translatedText = translation.text;
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final displayText = showUrdu ? translatedText : englishText;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tomato"),
        backgroundColor: const Color.fromARGB(255, 153, 232, 156),
        actions: [
          IconButton(
            icon: Icon(showUrdu ? Icons.language : Icons.translate),
            onPressed: isLoading ? null : _toggleLanguage,
            tooltip: showUrdu ? 'Show English' : 'Translate to Urdu',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/Tomato.png'),
              ),
              const SizedBox(height: 16),
              Text(
                "Tomato Fruit",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        displayText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black87,
                          fontFamily: showUrdu ? 'NotoNastaliqUrdu' : null,
                        ),
                        textAlign: showUrdu ? TextAlign.right : TextAlign.left,
                        textDirection:
                            showUrdu ? TextDirection.rtl : TextDirection.ltr,
                      ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}