import 'package:credit_card/utils/card_flag_detector.dart';
import 'package:credit_card/utils/card_number_validate.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testes para Validar cartão:', () {
    test('Valid Luhn number', () {
      // Número de cartão de crédito válido
      String validCardNumber = "4539 1488 0343 6467";
      expect(isValidLuhn(validCardNumber), true);
    });

    test('Invalid Luhn number', () {
      // Número de cartão de crédito inválido
      String invalidCardNumber = "4539 1488 0343 6466";
      expect(isValidLuhn(invalidCardNumber), false);
    });

    test('Empty card number', () {
      // Teste com um número de cartão vazio
      String emptyCardNumber = "";
      expect(isValidLuhn(emptyCardNumber), false);
    });

    test('Null card number', () {
      // Teste com um número de cartão nulo
      String? nullCardNumber;
      expect(isValidLuhn(nullCardNumber ?? ""), false);
    });

    test('Non-numeric characters', () {
      // Teste com caracteres não numéricos no número do cartão
      String nonNumericCardNumber = "4539-1488-0343-6467";
      expect(isValidLuhn(nonNumericCardNumber), true);
    });

    test('With spaces', () {
      // Teste com espaços extras no número do cartão
      String spacedCardNumber = " 4539 1488 0343 6467 ";
      expect(isValidLuhn(spacedCardNumber), true);
    });

    test('Teste para função 2', () {
      // Teste para a função 2
    });
  });

  group('Testes para Detetar tipo de cartão:', () {
    test('Detectar Visa', () {
      expect(detectCardType("4539 1488 0343 6467"), equals(CardType.Visa));
    });

    test('Detectar MasterCard', () {
      expect(detectCardType("5500000000000004"), equals(CardType.MasterCard));
    });

    test('Detectar American Express', () {
      expect(
          detectCardType("378282246310005"), equals(CardType.AmericanExpress));
    });

    test('Detectar Discover', () {
      expect(detectCardType("6011111111111117"), equals(CardType.Discover));
    });

    test('Detectar Outros', () {
      expect(detectCardType("1234"), equals(CardType.Other));
    });
/* 
    test('Detectar cartão nulo', () {
      expect(() => detectCardType(null), throwsA(isA<AssertionError>()));
    }); */

    test('Detectar cartão vazio', () {
      expect(detectCardType(""), equals(CardType.Other));
    });
  });
}
