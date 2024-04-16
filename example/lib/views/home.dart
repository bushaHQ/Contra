import 'package:contra/contra.dart';
import 'package:example/controllers/random_text_controller.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contra Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContraViewBuilder(
              builder: (context, controller) {
                return Column(
                  children: [
                    Text(controller.text),
                    Text('is busy ${controller.isBusy}'),
                    _HomeMeta(),
                    const SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.increment();
                        controller.toggleBusyState();
                      },
                      child: const Text('process'),
                    ),
                  ],
                );
              },
              controllerBuilder: () => RandomTextController(),
            ),
            const _AnotherHome(
              key: ValueKey('another'),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeMeta extends ContraWidget<RandomTextController> {
  @override
  Widget build(BuildContext context, RandomTextController controller) {
    return Column(
      children: [
        Text(controller.text),
        Text('sub is busy ${controller.isBusy}'),
      ],
    );
  }
}

class _AnotherHome extends StatelessWidget {
  const _AnotherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ContraViewBuilder(
      builder: (context, controller) {
        return Column(
          children: [
            Text('Busy ${controller.isBusy}'),
            ElevatedButton(
              onPressed: () {
                controller.toggleBusyState();
              },
              child: const Text('change'),
            ),
          ],
        );
      },
      controllerBuilder: () => RandomTextController(),
    );
  }
}
