import 'package:contra/contra.dart';
import 'package:example/controllers/counter_controller.dart';
import 'package:flutter/material.dart';

class CounterViewWihtBuilder extends StatelessWidget {
  const CounterViewWihtBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ContraViewBuilder(
      controllerBuilder: () => CounterController(),
      builder: (context, controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Contra Example'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${controller.counter} - loading ${controller.isBusy}"),
                const SizedBox(
                  height: 20,
                ),
                Text("loading meta object ${controller.busy(controller.metaObject)}"),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => controller.toggleBusyState(),
                  child: const Text('Toggle State'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => controller.toggleMetaObjectBusyState(),
                  child: const Text('Toggle MetaObject'),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => controller.increment(),
            child: const Icon(Icons.add),
          ),
        );
      },
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
