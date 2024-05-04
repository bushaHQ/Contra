# Contra

![coverage][coverage_badge]
[![License: BSD-1-Clause][license_badge]][license_link]

Contra is a minimal internal package designed to manage the MVC (Model-View-Controller) architecture within our app. It is currently under development, and improvements will be made accordingly. <br /><br/>
The primary goal of Contra is to integrate Riverpod with our controller, providing a proper way to manage our project effectively.
<br />

## Features

- ContraView: A widget to hold most views that can be propagated with our controller.
- ContraController: A controller to hold most of our view logic.
- ContraWidget: A widget that allows subwidgets of the ContraViewBuilder to access the controller easily.
- Internal Busy State Management: Each controller has an internal busy state that tracks the loading state of views, making it easy to set the loading state of a view.

## Usage

### ContraView Example

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

### ContraController Example

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

### Managing Local state

Riverpod advises against using its providers for your local state, such as 
- storing form state
- selected item
- animations
- generally everything that Flutter deals with via a 'controller' (e.g., TextEditingController). 

For these reasons, we have added support for hooks inside our controller, which means every controller can make use of Flutter hooks. However, try to be mindful of how you use the hooks.

```dart
  final firstName = useState('Contra');

  void update() {
    firstName.value = 'Supporting Hooks';
  }
```

### ContraWidget Example

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
              const RandomTextSubWidget(),
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

class RandomTextSubWidget extends ContraWidget<RandomTextController>{
  const RandomTextSubWidget({super.key});

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

### Internal Busy State Management Example

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

  Future<String> _generateRandomDynamicText() {
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

  Future<String> _generateRandomDynamicText() {
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

  Future<String> _generateRandomDynamicText() {
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
[license_badge]: https://img.shields.io/badge/License-BSD_3--Clause-blue.svg
[license_link]: https://opensource.org/licenses/MIT
