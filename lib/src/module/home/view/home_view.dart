import 'package:flutter/material.dart';
import 'package:isolate_example/src/src.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.flash_on),
                text: 'Performance',
              ),
              Tab(
                icon: Icon(Icons.sync),
                text: 'Infinite Process',
              ),
              Tab(
                icon: Icon(Icons.storage),
                text: 'Data Transfer',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PerformansePage(),
            InfiniteProcessPage(),
            DataTransferPage(),
          ],
        ),
      ),
    );
  }
}
