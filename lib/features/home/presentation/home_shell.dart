import 'package:flutter/cupertino.dart';

import '../../eeg/presentation/eeg_page.dart';
import '../../bandpower/presentation/bandpower_page.dart';
import '../../heart/presentation/heart_page.dart';
import '../../motion/presentation/motion_page.dart';
import '../../settings/presentation/settings_page.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  final _pages = const [
    EegPage(),
    BandPowerPage(),
    HeartPage(),
    MotionPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(label: 'EEG', icon: Text('🧠')),
          BottomNavigationBarItem(label: 'Band', icon: Text('🌊')),
          BottomNavigationBarItem(label: 'Heart', icon: Text('❤️')),
          BottomNavigationBarItem(label: 'Motion', icon: Text('🎛️')),
          BottomNavigationBarItem(label: 'Settings', icon: Text('⚙️')),
        ],
      ),
      tabBuilder: (context, index) => _pages[index],
    );
  }
}
