import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InfiniteProcessView extends StatefulWidget {
  const InfiniteProcessView({super.key});

  @override
  State<InfiniteProcessView> createState() => _InfiniteProcessViewState();
}

var list = <int>[];

class _InfiniteProcessViewState extends State<InfiniteProcessView> {
  int result = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircularProgressIndicator(),
          Text('$result'),
          ElevatedButton(
            onPressed: withCompute,
            child: const Text('with isolate'),
          ),
          ElevatedButton(
            onPressed: withOutCompute,
            child: const Text('with out isolate'),
          ),
        ],
      ),
    );
  }

  void withCompute() async {
    final i = await compute(add, 134000001);
    setState(() {
      result = i;
    });
  }

  void withOutCompute() async {
    final i = add(134000000);
    setState(() {
      result = i;
    });
  }
}

int add(int n) {
  int a = 0;
  for (int i = 0; i < n; i++) {
    list.add(i);
  }
  a = list.length;
  list.clear();
  return a;
}
