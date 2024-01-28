import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentStep = 0;

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _address = TextEditingController();
  final _postcode = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fire Hands',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Custom Stepper',
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: Colors.red)),
          child: Stepper(
            type: StepperType.vertical,
            steps: getSteps(),
            onStepTapped: (newStepIndex) {
              setState(() {
                _currentStep = newStepIndex;
              });
            },
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep != 2) {
                setState(() {
                  _currentStep += 1;
                });
              }
            },
            onStepCancel: () {
              if (_currentStep != 0) {
                setState(() {
                  _currentStep -= 1;
                });
              }
            },
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Container(
                margin: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepContinue,
                        child: Text(_currentStep == 2 ? 'CONFIRM' : 'NEXT'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (_currentStep != 0)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: details.onStepCancel,
                          child: const Text('BACK'),
                        ),
                      ),
                  ],
                ),
              );
            },
            connectorThickness: 2,
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: _currentStep >= 0,
        title: const Text('Account'),
        content: Column(
          children: [
            TextFormField(
              controller: _firstName,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                labelText: 'First Name',
                floatingLabelStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.deepPurple,
                ),
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              controller: _lastName,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                labelText: 'Last Name',
                floatingLabelStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.deepPurple,
                ),
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      Step(
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: _currentStep >= 1,
        title: const Text('Address'),
        content: Column(
          children: [
            TextFormField(
              controller: _address,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                labelText: 'Address',
                floatingLabelStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.deepPurple,
                ),
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              controller: _postcode,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                labelText: 'Postcode',
                floatingLabelStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.deepPurple,
                ),
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      Step(
        isActive: _currentStep >= 2,
        title: const Text('Complete'),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FirstName',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'LastName',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Postcode',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _firstName.text,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
                Text(
                  _lastName.text,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
                Text(
                  _address.text,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
                Text(
                  _postcode.text,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ];
  }
}
