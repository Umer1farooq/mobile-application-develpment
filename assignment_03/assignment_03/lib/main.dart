import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

enum DeviceType { Light, Fan, AC, Camera }

class Device {
  String name;
  DeviceType type;
  String room;
  bool isOn;
  double level; // brightness or speed (0-100)
  Device({
    required this.name,
    required this.type,
    required this.room,
    this.isOn = false,
    this.level = 50,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home Dashboard',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        primaryColor: Colors.indigo[700],
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: AppBarTheme(
          elevation: 2,
          backgroundColor: Colors.indigo[600],
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 4,
        ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Device> devices = [
    Device(
      name: 'Living Room Light',
      type: DeviceType.Light,
      room: 'Living Room',
      isOn: true,
      level: 80,
    ),
    Device(
      name: 'Bedroom Fan',
      type: DeviceType.Fan,
      room: 'Bedroom',
      isOn: false,
      level: 40,
    ),
    Device(
      name: 'Kitchen AC',
      type: DeviceType.AC,
      room: 'Kitchen',
      isOn: true,
      level: 22,
    ),
    Device(
      name: 'Front Door Camera',
      type: DeviceType.Camera,
      room: 'Entrance',
      isOn: true,
      level: 100,
    ),
  ];
  void addDevice(Device d) {
    setState(() {
      devices.add(d);
    });
  }

  void updateDevice(int index, Device d) {
    setState(() {
      devices[index] = d;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    int crossAxisCount = 2;
    if (width > 900)
      crossAxisCount = 4;
    else if (width > 600)
      crossAxisCount = 3;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text('Smart Home Dashboard'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/profile.jpg',
              ), // replace or keep a placeholder
              radius: 18,
              backgroundColor: Colors.grey[300],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.95,
                ),
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  final d = devices[index];
                  return DeviceCard(
                    device: d,
                    onToggle: (val) {
                      setState(() {
                        d.isOn = val;
                      });
                    },
                    onTap: () async {
                      // navigate to details and await updated device
                      final updated = await Navigator.push<Device?>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeviceDetails(device: d),
                        ),
                      );
                      if (updated != null) updateDevice(index, updated);
                    },
                    onLevelChanged: (newLevel) {
                      setState(() {
                        d.level = newLevel;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newDevice = await showDialog<Device>(
            context: context,
            builder: (context) => AddDeviceDialog(),
          );
          if (newDevice != null) {
            addDevice(newDevice);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DeviceCard extends StatefulWidget {
  final Device device;
  final ValueChanged<bool> onToggle;
  final VoidCallback onTap;
  final ValueChanged<double> onLevelChanged;
  DeviceCard({
    required this.device,
    required this.onToggle,
    required this.onTap,
    required this.onLevelChanged,
  });
  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 120),
          lowerBound: 0.0,
          upperBound: 0.05,
        )..addListener(() {
          setState(() {
            _scale = 1 - _controller.value;
          });
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  IconData _iconForType(DeviceType t) {
    switch (t) {
      case DeviceType.Light:
        return Icons.lightbulb_outline;
      case DeviceType.Fan:
        return Icons.toys; // fan-like icon
      case DeviceType.AC:
        return Icons.ac_unit;
      case DeviceType.Camera:
        return Icons.videocam_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.device;
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      child: Transform.scale(
        scale: _scale,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: widget.onTap,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: d.isOn
                                  ? Colors.indigo.withOpacity(0.12)
                                  : Colors.grey.withOpacity(0.08),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _iconForType(d.type),
                              size: 28,
                              color: d.isOn ? Colors.indigo : Colors.grey[600],
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.28,
                                child: Text(
                                  d.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '${d.room}',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Switch(
                        value: d.isOn,
                        onChanged: (val) {
                          widget.onToggle(val);
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    _statusText(d),
                    style: TextStyle(
                      color: d.isOn ? Colors.indigo[700] : Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  // miniature level indicator
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: (d.level / 100).clamp(0.0, 1.0),
                          minHeight: 6,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${d.level.toInt()}%',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _statusText(Device d) {
    final base = d.type == DeviceType.Light
        ? 'Light'
        : d.type == DeviceType.Fan
        ? 'Fan'
        : d.type == DeviceType.AC
        ? 'AC'
        : 'Camera';
    return '$base is ${d.isOn ? 'ON' : 'OFF'}';
  }
}

class DeviceDetails extends StatefulWidget {
  final Device device;
  DeviceDetails({required this.device});
  @override
  _DeviceDetailsState createState() => _DeviceDetailsState();
}

class _DeviceDetailsState extends State<DeviceDetails> {
  late Device d;
  @override
  void initState() {
    super.initState();
    d = Device(
      name: widget.device.name,
      type: widget.device.type,
      room: widget.device.room,
      isOn: widget.device.isOn,
      level: widget.device.level,
    );
  }

  IconData _iconForType(DeviceType t) {
    switch (t) {
      case DeviceType.Light:
        return Icons.lightbulb_outline;
      case DeviceType.Fan:
        return Icons.toys;
      case DeviceType.AC:
        return Icons.ac_unit;
      case DeviceType.Camera:
        return Icons.videocam_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isLightOrFan = d.type == DeviceType.Light || d.type == DeviceType.Fan;
    return Scaffold(
      appBar: AppBar(
        title: Text(d.name),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context, d); // return updated device
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8),
            Container(
              width: mq.size.width * 0.6,
              height: mq.size.width * 0.45,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Center(
                child: Icon(
                  _iconForType(d.type),
                  size: 84,
                  color: d.isOn ? Colors.indigo : Colors.grey[500],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 8),
                Text(
                  d.isOn ? 'ON' : 'OFF',
                  style: TextStyle(
                    fontSize: 16,
                    color: d.isOn ? Colors.green[700] : Colors.red[400],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 16),
                Switch(
                  value: d.isOn,
                  onChanged: (val) {
                    setState(() {
                      d.isOn = val;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 18),
            if (isLightOrFan)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    d.type == DeviceType.Light ? 'Brightness' : 'Speed',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Slider(
                    value: d.level,
                    min: 0,
                    max: 100,
                    divisions: 20,
                    label: d.level.toInt().toString(),
                    onChanged: (val) {
                      setState(() {
                        d.level = val;
                      });
                    },
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Auto adjust'),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            d.level = 70; // simple action
                          });
                        },
                        child: Text('Set to 70%'),
                      ),
                    ],
                  ),
                ],
              ),
            if (!isLightOrFan)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'No adjustable controls for this device type.',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, d);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Text('Save & Back'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddDeviceDialog extends StatefulWidget {
  @override
  _AddDeviceDialogState createState() => _AddDeviceDialogState();
}

class _AddDeviceDialogState extends State<AddDeviceDialog> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  DeviceType type = DeviceType.Light;
  String room = '';
  bool status = false;
  double level = 50;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Device'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Device name'),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Enter device name'
                    : null,
                onSaved: (v) => name = v!.trim(),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<DeviceType>(
                value: type,
                items: DeviceType.values
                    .map(
                      (t) => DropdownMenuItem(
                        value: t,
                        child: Text(t.toString().split('.').last),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() => type = v!),
                decoration: InputDecoration(labelText: 'Device type'),
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: 'Room name'),
                onSaved: (v) => room = v ?? '',
              ),
              SizedBox(height: 8),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Start as ON'),
                value: status,
                onChanged: (v) => setState(() => status = v),
              ),
              if (type == DeviceType.Light || type == DeviceType.Fan)
                Column(
                  children: [
                    SizedBox(height: 8),
                    Text('Initial level (${level.toInt()}%)'),
                    Slider(
                      value: level,
                      min: 0,
                      max: 100,
                      divisions: 20,
                      onChanged: (v) => setState(() => level = v),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              final d = Device(
                name: name,
                type: type,
                room: room,
                isOn: status,
                level: level,
              );
              Navigator.pop(context, d);
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
