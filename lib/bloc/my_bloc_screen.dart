import "package:flutter/material.dart";
import "package:state_sample/bloc/my_bloc_controller.dart";

class MyBlocScreen extends StatefulWidget {
  const MyBlocScreen({super.key});

  @override
  State<MyBlocScreen> createState() => _MyBlocScreenState();
}

class _MyBlocScreenState extends State<MyBlocScreen> {
  final MyBLOCController _controller = MyBLOCController();

  @override
  void dispose() {
    _controller.closeResources();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Using BLOC")),
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
    return StreamBuilder<dynamic>(
      stream: _controller.mergedStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> asyncSnapshot) {
        final String count = _controller.counter.toString();
        return Center(
          child: Text("Count: $count"),
        );
      },
    );
  }
}
