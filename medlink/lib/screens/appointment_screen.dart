import 'package:flutter/material.dart';

// Mock data for appointments
final List<Map<String, String>> appointments = [
  {
    'doctor': 'Dr. John Doe',
    'patient': 'Alice Smith',
    'date': '2024-08-01 10:00 AM',
    'status': 'Scheduled',
  },
  {
    'doctor': 'Dr. Jane Doe',
    'patient': 'Bob Johnson',
    'date': '2024-08-02 11:00 AM',
    'status': 'Completed',
  },
  // Add more mock appointments here
];

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _doctorController = TextEditingController();
  final _patientController = TextEditingController();
  final _dateController = TextEditingController();
  final _statusController = TextEditingController();

  void _addAppointment() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        appointments.add({
          'doctor': _doctorController.text,
          'patient': _patientController.text,
          'date': _dateController.text,
          'status': _statusController.text,
        });
        _doctorController.clear();
        _patientController.clear();
        _dateController.clear();
        _statusController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Appointments'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Appointment Details',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  final appointment = appointments[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text('${appointment['doctor']} - ${appointment['patient']}'),
                      subtitle: Text('${appointment['date']} - ${appointment['status']}'),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Add New Appointment', style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _doctorController,
                    decoration: InputDecoration(labelText: 'Doctor Name'),
                    validator: (value) => value?.isEmpty ?? true ? 'Please enter doctor\'s name' : null,
                  ),
                  TextFormField(
                    controller: _patientController,
                    decoration: InputDecoration(labelText: 'Patient Name'),
                    validator: (value) => value?.isEmpty ?? true ? 'Please enter patient\'s name' : null,
                  ),
                  TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(labelText: 'Appointment Date and Time'),
                    validator: (value) => value?.isEmpty ?? true ? 'Please enter appointment date and time' : null,
                  ),
                  TextFormField(
                    controller: _statusController,
                    decoration: InputDecoration(labelText: 'Status'),
                    validator: (value) => value?.isEmpty ?? true ? 'Please enter status' : null,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _addAppointment,
                    child: Text('Add Appointment'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
