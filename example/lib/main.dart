import 'package:contra/contra.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CounterView(),
    );
  }
}

class CounterView extends ContraView<CounterController> {
  CounterView({super.key}) : super(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contra Example'),
      ),
      body: Center(
        child: Text("${controller.counter}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterController extends ContraController {
  CounterController() : super();

  void increment() {
    ref.read(counterProvider.notifier).state++;
  }

  int get counter => ref.watch(counterProvider);
}

final counterProvider = StateProvider<int>((ref) => 0);
