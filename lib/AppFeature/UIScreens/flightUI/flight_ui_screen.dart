import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';

class FlightUIScreen extends StatefulWidget {
  const FlightUIScreen({super.key});

  @override
  State<FlightUIScreen> createState() => _FlightUIScreenState();
}

class _FlightUIScreenState extends State<FlightUIScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  DateTime? _departureDate;

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );

    if (picked != null && picked != _departureDate) {
      setState(() {
        _departureDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flight Booking'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _fromController,
              decoration: const InputDecoration(
                labelText: 'From',
                prefixIcon: Icon(Icons.flight_takeoff),
                border: OutlineInputBorder(),
              ),
            ).animate().fadeIn(duration: 500.ms),
            const SizedBox(height: 16),
            TextField(
              controller: _toController,
              decoration: const InputDecoration(
                labelText: 'To',
                prefixIcon: Icon(Icons.flight_land),
                border: OutlineInputBorder(),
              ),
            ).animate().fadeIn(duration: 500.ms),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Departure Date',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                child: Text(
                  _departureDate != null
                      ? DateFormat('dd/MM/yyyy').format(_departureDate!)
                      : 'Select Date',
                ),
              ),
            ).animate().fadeIn(duration: 500.ms),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder:
                    (context, index) => Card(
                      child: ListTile(
                        title: Text('Flight ${index + 1}'),
                        subtitle: const Text('Jakarta - Singapore'),
                        trailing: const Text('299'),
                        leading: const Icon(Icons.airplanemode_active),
                      ),
                    ).animate().slideX(
                      begin: -0.3,
                      delay: (100 * index).ms,
                      curve: Curves.easeInOut,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
