import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class VibrateVibrateView extends StatefulWidget {
  const VibrateVibrateView({super.key});

  static const routeName = '/vibrate_vibrate';

  @override
  VibrateVibrateViewState createState() => VibrateVibrateViewState();
}

class VibrateVibrateViewState extends State<VibrateVibrateView> {
  double _duration = 50;
  double _amplitude = -1;
  double _sharpness = 0.5;
  List<int> _pattern = [];
  List<int> _intensities = [];
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _amplitudeConteroller = TextEditingController();
  final TextEditingController _sharpnessController = TextEditingController();
  final TextEditingController _patternController = TextEditingController();
  final TextEditingController _intensitiesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _durationController.text = _duration.toString();
    _amplitudeConteroller.text = _amplitude.toString();
    _sharpnessController.text = _sharpness.toString();
    _patternController.text = _pattern.join(',');
    _intensitiesController.text = _intensities.join(',');
  }

  @override
  void dispose() {
    _durationController.dispose();
    _amplitudeConteroller.dispose();
    _sharpnessController.dispose();
    _patternController.dispose();
    _intensitiesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vibration.vibrateテスター'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Text(
            'Duration (1-200 ms)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: _durationController.text.isEmpty
                      ? 50
                      : (double.tryParse(_durationController.text) ?? 50)
                          .clamp(1, 200),
                  min: 1,
                  max: 200,
                  divisions: 200,
                  label: '${_duration.round()} ms',
                  activeColor: Colors.blue,
                  inactiveColor: Colors.blue.shade100,
                  onChanged: (double value) {
                    setState(() {
                      _durationController.text = value.round().toString();
                    });
                  },
                ),
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _durationController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() {
                    _duration = (double.tryParse(value) ?? 50).clamp(1, 200);
                  }),
                ),
              ),
            ],
          ),
          Text(
            'Amplitude (-1-255)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: _amplitudeConteroller.text.isEmpty
                      ? -1
                      : (double.tryParse(_amplitudeConteroller.text) ?? -1)
                          .clamp(-1, 255),
                  min: -1,
                  max: 255,
                  divisions: 256,
                  label:
                      '${_amplitudeConteroller.text.isEmpty ? -1 : _amplitudeConteroller.text}',
                  activeColor: Colors.blue,
                  inactiveColor: Colors.blue.shade100,
                  onChanged: (double value) {
                    setState(() {
                      _amplitudeConteroller.text = value.round().toString();
                    });
                  },
                ),
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _amplitudeConteroller,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          Text(
            'Sharpness (0-1)',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: _sharpnessController.text.isEmpty
                      ? 0.5
                      : double.tryParse(_sharpnessController.text)
                              ?.clamp(0.0, 1.0) ??
                          0.5,
                  min: 0,
                  max: 1,
                  divisions: 10,
                  label: _sharpness.toStringAsFixed(1),
                  activeColor: Colors.blue,
                  inactiveColor: Colors.blue.shade100,
                  onChanged: (double value) {
                    setState(() {
                      _sharpnessController.text = value.toStringAsFixed(1);
                    });
                  },
                ),
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _sharpnessController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          TextField(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: const InputDecoration(
              labelText: 'Pattern (数字1-2000の,区切り)\n*優先される',
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            keyboardType: TextInputType.text,
            onChanged: (String value) {
              setState(() {
                _pattern = value.isEmpty
                    ? []
                    : value
                        .split(',')
                        .map((e) => int.tryParse(e.trim()) ?? 0)
                        .toList();
              });
            },
          ),
          SizedBox(height: 16),
          TextField(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: const InputDecoration(
              labelText: 'Intensities (数字1-255の,区切り)\n*優先される',
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            keyboardType: TextInputType.text,
            onChanged: (String value) {
              setState(() {
                _intensities = value.isEmpty
                    ? []
                    : value
                        .split(',')
                        .map((e) => int.tryParse(e.trim()) ?? 0)
                        .toList();
              });
            },
          ),
          SizedBox(height: 90),
          IconButton(
            iconSize: 80,
            visualDensity: VisualDensity.compact,
            padding: const EdgeInsets.all(32),
            icon: const Icon(Icons.vibration),
            color: Colors.white,
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 92, 182, 255)),
                maximumSize: WidgetStateProperty.all(Size(200, 200)),
                minimumSize: WidgetStateProperty.all(Size(200, 200))),
            onPressed: () async {
              if (await Vibration.hasVibrator()) {
                Vibration.vibrate(
                    duration: int.tryParse(_durationController.text) ?? 50,
                    amplitude: int.tryParse(_amplitudeConteroller.text) ?? -1,
                    sharpness:
                        double.tryParse(_sharpnessController.text) ?? 0.5,
                    pattern: _pattern,
                    intensities: _intensities);
              }
            },
            tooltip: 'Test Vibration',
          ),
        ],
      ),
    );
  }
}
