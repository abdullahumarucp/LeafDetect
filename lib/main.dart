import 'package:LeafDetect/Splashscreen.dart';
import 'package:LeafDetect/chatbot/chat_provider.dart';
import 'package:LeafDetect/chatbot/models_provider.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gal/gal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
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
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  await dotenv.load(fileName: 'lib/api_const.env');
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  await NotificationService().init();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Karachi'));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModelsProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MyApp2(cameras: cameras),
    ),
  );
}

class MyApp2 extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp2({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Leaf Detect',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(cameras: []),
        '/home': (context) => Firstpage(cameras: cameras),
        '/camera': (context) => CameraButton(cameras: cameras),
        '/search': (context) => SearchPage(currentIndex: 1),
        '/history': (context) => HistoryPage(currentIndex: 2),
      },
    );
  }
}

class Firstpage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const Firstpage({super.key, required this.cameras});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> with WidgetsBindingObserver {
  CameraController? cameraController;
  List<String> imagePaths = [
    'assets/Apple.png',
    'assets/Guava.png',
    'assets/Grapes.png',
  ];
  int currentImageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startTimer();
    _setupCameraController();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        setState(() {
          currentImageIndex = (currentImageIndex + 1) % imagePaths.length;
        });
      }
    });
  }

  Future<void> _setupCameraController() async {
    if (widget.cameras.isEmpty) return;

    cameraController = CameraController(
      widget.cameras.first,
      ResolutionPreset.high,
    );

    try {
      await cameraController!.initialize();
      if (mounted) setState(() {});
    } catch (e) {
      developer.log("Camera initialization error: $e", error: e);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    cameraController?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _setupCameraController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 153, 232, 156),
      appBar: const CustomAppBar(),
      endDrawer: const CustomEndDrawer(),
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
                      foregroundColor: const Color.fromARGB(255, 239, 244, 241),
                      backgroundColor: const Color.fromRGBO(46, 114, 48, 1),
                      minimumSize: const Size(300, 90),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/camera');
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
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 239, 244, 241),
                      backgroundColor: const Color.fromRGBO(46, 114, 48, 1),
                      minimumSize: const Size(300, 35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/search');
                    },
                    child: const Text(
                      "Plant",
                      style: TextStyle(
                        color: Color.fromARGB(255, 249, 252, 249),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const MultipleButtonScroll(),
                  const SizedBox(height: 35),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 239, 244, 241),
                      backgroundColor: const Color.fromRGBO(46, 114, 48, 1),
                      minimumSize: const Size(300, 35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/history');
                    },
                    child: const Text(
                      "History",
                      style: TextStyle(
                        color: Color.fromARGB(255, 249, 252, 249),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
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
        currentIndex: 0,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (Route<dynamic> route) => false);
              break;
            case 1:
              Navigator.pushNamedAndRemoveUntil(
                  context, '/search', (Route<dynamic> route) => false);
              break;
            case 2:
              Navigator.pushNamedAndRemoveUntil(
                  context, '/history', (Route<dynamic> route) => false);
              break;
          }
        },
      ),
    );
  }
}

class CameraButton extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraButton({super.key, required this.cameras});

  @override
  State<CameraButton> createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton>
    with WidgetsBindingObserver {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  bool _isLoading = false;
  bool _isCameraReady = false;
  String? _prediction;
  double? _confidence;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    try {
      final cameraStatus = await Permission.camera.request();
      final storageStatus = await Permission.storage.request();
      final photosStatus = Platform.isAndroid
          ? await Permission.photos.request()
          : PermissionStatus.granted;

      if (!cameraStatus.isGranted ||
          !storageStatus.isGranted ||
          (Platform.isAndroid && !photosStatus.isGranted)) {
        if (cameraStatus.isPermanentlyDenied ||
            storageStatus.isPermanentlyDenied ||
            (Platform.isAndroid && photosStatus.isPermanentlyDenied)) {
          if (mounted) {
            _showSettingsDialog(
                'Please enable camera and storage permissions in app settings');
          }
        }
        //  else if (mounted) {
        //   _showPermissionDeniedDialog('Camera and storage permissions are required');
        // }
      }
    } catch (e) {
      debugPrint('Permission error: $e');
      if (mounted) {
        _showError('Failed to request permissions');
      }
    }
  }

  Future<void> _initializeCamera() async {
    if (widget.cameras.isEmpty || !mounted) return;

    try {
      _controller = CameraController(
        widget.cameras.first,
        ResolutionPreset.high,
      );

      _initializeControllerFuture = _controller!.initialize().then((_) {
        if (mounted) {
          setState(() => _isCameraReady = true);
        }
      });

      await _initializeControllerFuture;
    } catch (e) {
      debugPrint('Camera initialization error: $e');
      if (mounted) {
        setState(() => _isCameraReady = false);
        _showError('Failed to initialize camera');
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_controller == null || !_controller!.value.isInitialized) return;

    if (state == AppLifecycleState.inactive) {
      _controller?.dispose();
      if (mounted) {
        setState(() => _isCameraReady = false);
      }
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    }
  }

  Future<void> _takePicture() async {
    if (!mounted || _controller == null || !_isCameraReady) return;

    try {
      setState(() => _isLoading = true);
      await _initializeControllerFuture;
      final image = await _controller!.takePicture();
      await _sendImageToServer(File(image.path));
      await Gal.putImage(image.path);
    } catch (e) {
      if (mounted) _showError('Failed to take picture: ${e.toString()}');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _pickImageFromGallery() async {
    try {
      setState(() => _isLoading = true);
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        await _sendImageToServer(File(pickedFile.path));
      }
    } catch (e) {
      if (mounted) _showError('Failed to pick image: ${e.toString()}');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _sendImageToServer(File imageFile) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(dotenv.env['API_URL'] ?? 'http://10.0.2.2:8000/api/detect/'),
      );

      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
        ),
      );

      var response = await request.send();

      if (response.statusCode == 201) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseData);

        if (mounted) {
          setState(() {
            _prediction = jsonResponse['prediction'];
            _confidence = jsonResponse['confidence'];
          });
          _showResult(_prediction!, _confidence!);
        }
      } else {
        throw Exception('Server returned ${response.statusCode}');
      }
    } catch (e) {
      if (mounted) _showError('Failed to send image: ${e.toString()}');
    }
  }

  void _showResult(String prediction, double confidence) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Detection Result'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Prediction: $prediction'),
            const SizedBox(height: 8),
            Text('Confidence: ${(confidence * 100).toStringAsFixed(2)}%'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // void _showPermissionDeniedDialog(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => AlertDialog(
  //       title: const Text('Permission Denied'),
  //       content: Text(message),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: const Text('OK'),
  //         ),
  //         TextButton(
  //           onPressed: () async {
  //             Navigator.pop(context);
  //             await _requestPermissions();
  //           },
  //           child: const Text('Retry'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  void _showSettingsDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Permission Required'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _isCameraReady && _controller != null
                ? Stack(
                    children: [
                      CameraPreview(_controller!),
                      if (_isLoading)
                        const Center(child: CircularProgressIndicator()),
                    ],
                  )
                : const Center(child: Text('Camera not available'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'gallery',
            onPressed: _pickImageFromGallery,
            child: const Icon(Icons.photo_library),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'capture',
            onPressed: _takePicture,
            child: const Icon(Icons.camera),
          ),
        ],
      ),
    );
  }
}
