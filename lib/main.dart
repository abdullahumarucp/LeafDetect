import 'package:LeafDetect/Splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gal/gal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:developer' as developer;
import 'dart:async';
import 'home_plant_buttons.dart';
import 'search_page.dart';
import 'custom_appbar.dart';
import 'gradient_background.dart';
import 'bottom_bar.dart';
import 'history_page.dart';
import 'custom_end_drawer.dart';
import 'package:LeafDetect/notification/notifi_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await availableCameras(); // Initialize camera
  } catch (e) {
    developer.log("Error initializing cameras: $e", name: 'Camera', error: e);
    // Optionally, you can show an error dialog or fallback UI here
  }
  await NotificationService().init();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Karachi'));
  runApp(MyApp2());
}

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> with WidgetsBindingObserver {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  List<String> imagePaths = [
    'assets/Apple.png',
    'assets/Guava.png',
    'assets/Grapes.png',
    // Add more image paths here
  ];
  int currentImageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        currentImageIndex = (currentImageIndex + 1) % imagePaths.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (cameraController == null ||
        cameraController?.value.isInitialized == false) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Note: This line seems incorrect; it tries to instantiate a class directly
      // Replace with proper camera reinitialization if needed
      _setupCameraController();
    }
  }

  Future<void> _setupCameraController() async {
    try {
      List<CameraDescription> camerass = await availableCameras();
      if (camerass.isNotEmpty) {
        setState(() {
          cameras = camerass;
          cameraController = CameraController(
            camerass.first,
            ResolutionPreset.high,
          );
        });
        await cameraController?.initialize();
      }
    } catch (e) {
      developer.log("Error initializing camera: $e", name: 'Camera', error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      appBar: CustomAppBar(),
      endDrawer: CustomEndDrawer(),
      body: SingleChildScrollView(
        child: GradientBackground(
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 239, 244, 241),
                      backgroundColor: Color.fromRGBO(46, 114, 48, 1),
                      minimumSize: Size(300, 90),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return CameraButton(currentIndex: 0);
                          },
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/c.png',
                          height: 110,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 239, 244, 241),
                      backgroundColor: Color.fromRGBO(46, 114, 48, 1),
                      minimumSize: Size(300, 35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return SearchPage(currentIndex: 1);
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Plant",
                      style: TextStyle(
                        color: Color.fromARGB(255, 249, 252, 249),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  MultipleButtonScroll(),
                  SizedBox(height: 35),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 239, 244, 241),
                      backgroundColor: Color.fromRGBO(46, 114, 48, 1),
                      minimumSize: Size(300, 35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return HistoryPage(currentIndex: 2);
                          },
                        ),
                      );
                    },
                    child: Text(
                      "History",
                      style: TextStyle(
                        color: Color.fromARGB(255, 249, 252, 249),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        imagePaths[currentImageIndex],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Bottompart(
        currentIndex: 0, // FirstPage is index 0
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Firstpage(),
              ),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SearchPage(currentIndex: index),
              ),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HistoryPage(currentIndex: index),
              ),
            );
          }
        },
      ),
    );
  }
}

class CameraButton extends StatefulWidget {
  final int currentIndex;
  const CameraButton({super.key, required this.currentIndex});

  @override
  State<CameraButton> createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  CameraController? cameraController;
  List<CameraDescription> cameras = [];
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _requestPermissions(); // Request permissions when the widget is initialized
  }

  Future<void> _requestPermissions() async {
    // Request camera and storage permissions
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.photos, // For iOS photo library access
      Permission.storage, // For Android storage access (if needed)
    ].request();

    // Check camera permission
    if (statuses[Permission.camera]!.isDenied) {
      _showPermissionDeniedDialog(
          'Camera permission is required to take pictures of plants.');
    } else if (statuses[Permission.camera]!.isPermanentlyDenied) {
      _showSettingsDialog(
          'Camera permission is permanently denied. Please enable it in settings.');
    }

    // Check storage/photos permission
    if (statuses[Permission.photos]!.isDenied ||
        statuses[Permission.storage]!.isDenied) {
      _showPermissionDeniedDialog(
          'Storage or photo library permission is required to save or select images.');
    } else if (statuses[Permission.photos]!.isPermanentlyDenied ||
        statuses[Permission.storage]!.isPermanentlyDenied) {
      _showSettingsDialog(
          'Storage or photo library permission is permanently denied. Please enable it in settings.');
    }

    // If permissions are granted, set up the camera
    if (statuses[Permission.camera]!.isGranted) {
      _setupCameraController();
    }
  }

  void _showPermissionDeniedDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Denied'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await _requestPermissions(); // Retry requesting permissions
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  void _showSettingsDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Required'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings(); // Open app settings
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  Future<void> _setupCameraController() async {
    try {
      List<CameraDescription> camerass = await availableCameras();
      if (camerass.isNotEmpty) {
        setState(() {
          cameras = camerass;
          cameraController = CameraController(
            camerass.first,
            ResolutionPreset.high,
          );
        });
        await cameraController?.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      }
    } catch (e) {
      developer.log("Error initializing camera: $e", name: 'Camera', error: e);
      _showPermissionDeniedDialog(
          'Failed to initialize camera. Please check permissions.');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController == null ||
        cameraController!.value.isInitialized == false) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CameraPreview(
                cameraController!,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: IconButton(
                      onPressed: () async {
                        if (await Permission.camera.isGranted) {
                          try {
                            if (cameraController != null &&
                                cameraController!.value.isInitialized) {
                              XFile picture =
                                  await cameraController!.takePicture();
                              await Gal.putImage(picture.path);
                              developer.log("Picture taken!", name: 'Camera');
                            }
                          } catch (e) {
                            developer.log("Error capturing image: $e",
                                name: 'Camera', error: e);
                          }
                        } else {
                          _requestPermissions();
                        }
                      },
                      iconSize: 50,
                      icon: const Icon(
                        Icons.camera,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: IconButton(
                      onPressed: () async {
                        if (await Permission.photos.isGranted ||
                            await Permission.storage.isGranted) {
                          final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (image != null) {
                            developer.log(
                                "Image selected from gallery: ${image.path}",
                                name: 'Gallery');
                          }
                        } else {
                          _requestPermissions();
                        }
                      },
                      iconSize: 50,
                      icon: const Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }
}