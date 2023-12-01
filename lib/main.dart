import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:state_sample/bloc/my_bloc_screen.dart";
import "package:state_sample/getx/my_getx_screen.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "State Management Demo",
      navigatorKey: Get.key,
      theme: getThemeData(brightness: Brightness.light),
      darkTheme: getThemeData(brightness: Brightness.dark),
      home: const MyHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData getThemeData({required Brightness brightness}) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorSchemeSeed: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
    return themeData;
  }
}

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("State Management Demo")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    const Widget widget = MyBlocScreen();
                    final MaterialPageRoute<void> rou = MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return widget;
                      },
                    );
                    await Navigator.of(context).push(rou);
                  },
                  child: const Text("Go to BLOC Screen"),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    const Widget widget = MyGetXScreen();
                    final MaterialPageRoute<void> rou = MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return widget;
                      },
                    );
                    await Navigator.of(context).push(rou);
                  },
                  child: const Text("Go to GETX Screen"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
