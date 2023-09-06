import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

abstract class Animal {
  // No default implementation, will need to be overridden when extended or implemented.
  String makeSound();

  // Has a default implementation, only needs to be overridden by classes which use "implements".
  String makePoop() => "Plop";
}

mixin Flies {
  String fly() => "Flying!";
}

class Dog extends Animal {
  @override
  String makeSound() {
    return "Bark!";
  }
}

class Crow extends Animal with Flies {
  @override
  String makeSound() {
    return "Caw!";
  }
}

class MockDog extends Mock implements Dog {}

void main() {
  test(
    "2 + 2 = 4",
    () {
      const result = 2 + 2;

      expect(result, 4);
    },
  );

  test(
    "Bird",
    () {
      final bird = Crow();

      expect(bird.fly(), "Flying!");
      expect(bird.makeSound(), "Caw!");
    },
  );

  test(
    "Mocking a dog barking",
    () {
      final dog = MockDog();

      when(() => dog.makeSound()).thenReturn("Bark!");
      when(() => dog.makePoop()).thenReturn("Plop");

      expect(
        dog.makeSound(),
        "Bark!",
        reason: "Dog did not bark as expected.",
      );

      dog.makeSound();

      dog.makePoop();

      // Can check that makeSound was called exactly twice.
      verify(() => dog.makeSound()).called(2);

      // Calling verify will reset the number of invocations for the verified function.
      verifyNever(() => dog.makeSound());

      // makePoop did not have its invocations reset when verifying other functions.
      verify(() => dog.makePoop()).called(1);
    },
  );
}
