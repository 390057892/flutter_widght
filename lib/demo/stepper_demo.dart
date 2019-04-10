import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(primaryColor: Colors.black),
              child: Stepper(
                currentStep: _currentStep,
                onStepTapped: (int value) {
                  setState(() {
                    _currentStep = value;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                  });
                },
                onStepCancel: () {
                  setState(() {
                    _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                  });
                },
                steps: [
                  Step(
                      title: Text('Step1'),
                      subtitle: Text('Step First'),
                      content: Text(
                          'Ea in aliquip nostrud et deserunt magna id non commodo culpa labore eiusmod.'),
                      isActive: _currentStep == 0),
                  Step(
                      title: Text('Step2'),
                      subtitle: Text('Step Second'),
                      content: Text(
                          'Voluptate exercitation irure cupidatat id amet nisi sint id labore pariatur adipisicing irure esse.'),
                      isActive: _currentStep == 1),
                  Step(
                      title: Text('Step3'),
                      subtitle: Text('Step Three'),
                      content: Text('Sit labore irure veniam cillum laborum.'),
                      isActive: _currentStep == 2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
