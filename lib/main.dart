import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputSelectionDemo(),
    );
  }
}

class InputSelectionDemo extends StatefulWidget {
  const InputSelectionDemo({Key? key}) : super(key: key);

  @override
  State<InputSelectionDemo> createState() => _InputSelectionDemoState();
}

class _InputSelectionDemoState extends State<InputSelectionDemo> {
  bool _isChecked = false;
  String? _gender = "Laki-laki";
  bool _isSwitchOn = false;
  double _sliderValue = 10;
  DateTime? _selectedDate;
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Input & Selection Widgets")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextField
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nama",
                ),
              ),
              const SizedBox(height: 20),

              // Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  const Text("Setuju dengan syarat & ketentuan"),
                ],
              ),
              const SizedBox(height: 20),

              // Radio Button
              const Text("Pilih Jenis Kelamin:"),
              Row(
                children: [
                  Radio<String>(
                    value: "Laki-laki",
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  const Text("Laki-laki"),
                  Radio<String>(
                    value: "Perempuan",
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  const Text("Perempuan"),
                ],
              ),
              const SizedBox(height: 20),

              // Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Aktifkan Notifikasi"),
                  Switch(
                    value: _isSwitchOn,
                    onChanged: (value) {
                      setState(() {
                        _isSwitchOn = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Slider
              Text("Nilai: ${_sliderValue.toStringAsFixed(0)}"),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                divisions: 100,
                label: _sliderValue.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Date Picker
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_selectedDate == null
                      ? "Belum pilih tanggal"
                      : "Tanggal: ${_selectedDate!.toLocal()}".split(' ')[0]),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: const Text("Pilih Tanggal"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
