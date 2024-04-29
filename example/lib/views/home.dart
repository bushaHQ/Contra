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
                    const SizedBox(
                      height: 100,
                    ),
                    _HomeError(),
                  ],
                );
              },
              controllerBuilder: () => RandomTextController(),
            ),
            const SizedBox(
              height: 20,
            ),
            const _AnotherHome(),
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

class _HomeError extends ContraWidget<RandomTextController> {
  @override
  Widget build(BuildContext context, RandomTextController controller) {
    return Column(
      children: [
        Text('Controller has error ${controller.hasError}'),
        Text('Controller error ${controller.controllerError}'),
        ElevatedButton(
          onPressed: controller.toogleControllerError,
          child: const Text('toggle error'),
        ),
        Text('State object has error ${controller.hasObjectError('state')}'),
        Text('Controller error ${controller.objectError('state')}'),
        ElevatedButton(
          onPressed: controller.toggleStateObjectError,
          child: const Text('toggle error'),
        ),
      ],
    );
  }
}

class _AnotherHome extends StatelessWidget {
  const _AnotherHome();

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
