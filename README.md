# Centa

![coverage][coverage_badge]
[![License: MIT][license_badge]][license_link]


Minimal Internal Package to manage MVC Architecture in our app

---

It is still under `development`!!!!

As we continue with our project, it is still under development, and we will improve it accordingly.

The idea is to integrate Riverpod with our controller, providing a proper way to manage our project effectively.

ContraView- to hold most view of which we can progate with our controller.
```dart
class CounterView extends ContraView<CounterController> {
  CounterView() : super(CounterController());

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Contra Example'),
          ),
          body: Center(
            child: Text("${ref.watch(counterProvider)}"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => controller.increment(ref),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
```

ContraController - to hold most of our view logic.

```dart
....

class CounterController extends ContraController {
  CounterController() : super();

  void increment(WidgetRef ref) {
    ref.read(counterProvider.notifier).state++;
  }
}
```