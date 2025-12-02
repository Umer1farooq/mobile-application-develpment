import 'dart:io';
@override
void initState() {
super.initState();
_initCamera();
}


Future<void> _initCamera() async {
cameras = await availableCameras();
controller = CameraController(cameras!.first, ResolutionPreset.medium);
await controller!.initialize();
setState(() => ready = true);
}


Future<void> _capture() async {
final loc = await LocationService().getCurrentLocation();
final file = await controller!.takePicture();
// create activity
final activity = Activity(
id: Uuid().v4(),
latitude: loc.latitude,
longitude: loc.longitude,
imagePath: file.path,
timestamp: DateTime.now(),
);


await Provider.of<ActivityProvider>(context, listen: false).addActivity(activity);
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Activity logged')));
}


@override
Widget build(BuildContext context) {
if (!ready) return Scaffold(body: Center(child: CircularProgressIndicator()));
return Scaffold(
appBar: AppBar(title: Text('Capture')),
body: Column(
children: [
AspectRatio(aspectRatio: controller!.value.aspectRatio, child: CameraPreview(controller!)),
ElevatedButton.icon(onPressed: _capture, icon: Icon(Icons.camera_alt), label: Text('Log Activity')),
],
),
);
}


@override
void dispose() {
controller?.dispose();
super.dispose();
}
}