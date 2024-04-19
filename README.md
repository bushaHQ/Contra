# Centa

![coverage][coverage_badge]
[![License: MIT][license_badge]][license_link]

Minimal Internal Package to manage MVC Architecture in our app

---

It is still under `development`!!!!

As we continue with our project, it is still under development, and we will improve it accordingly.

The idea is to integrate Riverpod with our controller, providing a proper way to manage our project effectively.

`ContraView`- to hold most view of which we can progate with our controller.

```dart
class RandomTextView extends StatelessWidget {
  const RandomTextView({super.key});

  @override
  Widget build(BuildContext context) {
    return ContraViewBuilder(
      builder : (BuildContext context, RandomTextController controller){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Contra Example'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : [
              Text(controller.text),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed:(){
                  controller.generateText();
                },
                child: const Text('Generate'),
              ),
            ],
          ),
        );
      },
      controllerBuilder: () => RandomTextController(),
    );
  }
}

```

`ContraController` - to hold most of the logics.

```dart

class RandomTextController extends ContraController{
  RandomTextController(): super();

  String get text => ref.watch(_textProvider);

  String _generateRandomDynamicText() {
    final random = Random();
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    return String.fromCharCodes(
      List.generate(8, (_) => characters.codeUnitAt(random.nextInt(characters.length))),
    );
  }

  void generateText(){
    var randomText = _generateRandomDynamicText();
    ref.read(_textProvider.notifier).state = randomText;
  }
}

final _textProvider = StateProvider((ref) => 'hello');

```

In a bid to make the codebase highly maintainable, we introduced a `ContraWidget`, that allows subwidgets of the ContraViewBuilder access the controller easily.

```dart
class RandomTextSubWidget extends ContraWidget<RandomTextController>{
  @override
  Widget build(BuildContext context, RandomTextController controller){
    return Text(
      'This is a styled random text ${controller.text}',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Colors.amber,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
```

Also, each controller has an internal busy state it tracks. This makes very easy to set the loading state of a view.

```dart

class RandomTextView extends StatelessWidget {
  const RandomTextView({super.key});

  @override
  Widget build(BuildContext context) {
    return ContraViewBuilder(
      builder : (BuildContext context, RandomTextController controller){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Contra Example'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : [
              AnimatedCrossFade(
                firstChild: Text(controller.text),
                secondChild: const CircularProgressIndicator(),
                duration: const Duration(milliseconds: 2000),
                crossFadeState: controller.isBusy ? CrossFadeState.showSecond :  CrossFadeState.showFirst,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed:(){
                  controller.generateText();
                },
                child: const Text('Generate'),
              ),
            ],
          ),
        );
      },
      controllerBuilder: () => RandomTextController(),
    );
  }
}

class RandomTextController extends ContraController{
  RandomTextController(): super();

  String get text => ref.watch(_textProvider);

  String _generateRandomDynamicText() {
    final random = Random();
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    final generatedText =  String.fromCharCodes(
      List.generate(8, (_) => characters.codeUnitAt(random.nextInt(characters.length))),
    );

    return Future.value(generatedText);
  }

  void generateText() async {
    setBusy(true);
    var randomText = await _generateRandomDynamicText();
    ref.read(_textProvider.notifier).state = randomText;
    setBusy(false);
  }

}

final _textProvider = StateProvider((ref) => 'hello');

```

You could also set the busy state for different objects too

```dart

class RandomTextController extends ContraController{
  RandomTextController(): super();



  String get text => ref.watch(_textProvider);

  String _generateRandomDynamicText() {
    final random = Random();
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    final generatedText =  String.fromCharCodes(
      List.generate(8, (_) => characters.codeUnitAt(random.nextInt(characters.length))),
    );

    return Future.value(generatedText);
  }

  void generateText() async {
    setBusyForObject('generating', true);
    var randomText = await _generateRandomDynamicText();
    ref.read(_textProvider.notifier).state = randomText;
    setBusyForObject('generating', false);
  }

}

final _textProvider = StateProvider((ref) => 'hello');


```

You could also set the busy state of the controller simultaneously while running an asynchronous function

```dart

class RandomTextController extends ContraController{
  RandomTextController(): super();



  String get text => ref.watch(_textProvider);

  String _generateRandomDynamicText() {
    final random = Random();
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    final generatedText =  String.fromCharCodes(
      List.generate(8, (_) => characters.codeUnitAt(random.nextInt(characters.length))),
    );

    return Future.value(generatedText);
  }

  void generateText() async {
    try{
      var randomText = await runBusyFuture(
        _generateRandomDynamicText(),
        throwException: true,
      );
      ref.read(_textProvider.notifier).state = randomText;
    } catch(e){
      // handle your error
    }

  }

}

final _textProvider = StateProvider((ref) => 'hello');

```

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
