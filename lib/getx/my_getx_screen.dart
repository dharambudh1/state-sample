import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:state_sample/getx/my_getx_controller.dart";

class MyGetXScreen extends StatefulWidget {
  const MyGetXScreen({super.key});

  @override
  State<MyGetXScreen> createState() => _MyGetXScreenState();
}

class _MyGetXScreenState extends State<MyGetXScreen> {
  final MyGetXController _controller = MyGetXController();

  @override
  void dispose() {
    _controller.closeResources();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Using GETX"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.counter++,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: count(),
        ),
      ),
    );
  }

  Widget count() {
    return Obx(
      () {
        final String count = _controller.counter.toString();
        return Center(child: Text("Count: $count"));
      },
    );
  }
}
