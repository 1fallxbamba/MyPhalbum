import 'package:flutter/material.dart';

import 'package:myphalbum/services/storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  getSavedData() async {
    String? _sliderStatus = await getLocalData('sliderStatus');
    String? _stayConnected = await getLocalData('stayConnected');
    String? _userID = await getLocalData('userID');

    print('Slider : ' + _sliderStatus!);
    print('Stay : ' + _stayConnected!);
    print('User : ' + _userID!);

  }

  @override
  void initState() {
    super.initState();
    getSavedData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('Homee'),
      ),
    );
  }
}
