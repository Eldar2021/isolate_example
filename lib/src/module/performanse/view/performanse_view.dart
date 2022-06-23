import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../performanse.dart';
import '../widgets/widgets.dart';

class PerformanseView extends StatefulWidget {
  const PerformanseView({super.key});

  @override
  State<PerformanseView> createState() => _PerformanseViewState();
}

class _PerformanseViewState extends State<PerformanseView> {
  Future<void> computeFuture = Future.value();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SmoothAnimation(),
          FutureBuilder(
            future: computeFuture,
            builder: (context, snapshot) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 8.0),
                onPressed: snapshot.connectionState == ConnectionState.done
                    ? () => handleComputeOnMain(context)
                    : null,
                child: const Text('Compute on Main'),
              );
            },
          ),
          FutureBuilder(
            future: computeFuture,
            builder: (context, snapshot) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 8.0),
                onPressed: snapshot.connectionState == ConnectionState.done
                    ? () => handleComputeOnSecondary(context)
                    : null,
                child: const Text('Compute on Secondary'),
              );
            },
          ),
        ],
      ),
    );
  }

  void handleComputeOnMain(BuildContext context) {
    var future = computeOnMainIsolate()
      ..then((_) {
        var snackBar = const SnackBar(
          content: Text('Main Isolate Done!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });

    setState(() {
      computeFuture = future;
    });
  }

  void handleComputeOnSecondary(BuildContext context) {
    var future = computeOnSecondaryIsolate().then(
      (value) {
        var snackBar = const SnackBar(
          content: Text('Secondary Isolate Done!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );

    setState(() {
      computeFuture = future;
    });
  }

  Future<void> computeOnMainIsolate() async {
    // await Future<void>.delayed(const Duration(milliseconds: 100));
    fib(45);
  }

  Future<void> computeOnSecondaryIsolate() async {
    await compute(fib, 45);
  }
}
