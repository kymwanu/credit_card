import 'package:credit_card/utils/card_date.dart';
import 'package:credit_card/utils/card_flag_detector.dart';
import 'package:credit_card/utils/card_mask.dart';
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

  group('Testes para detectCardType', () {
    test('Deve retornar Visa para números de cartão Visa válidos', () {
      expect(detectCardType('4111111111111111'), equals(CardType.Visa));
    });

    test('Deve retornar MasterCard para números de cartão MasterCard válidos',
        () {
      expect(detectCardType('5500000000000004'), equals(CardType.MasterCard));
    });

    test(
        'Deve retornar AmericanExpress para números de cartão American Express válidos',
        () {
      expect(
          detectCardType('378282246310005'), equals(CardType.AmericanExpress));
    });

    test('Deve retornar Discover para números de cartão Discover válidos', () {
      expect(detectCardType('6011000000000004'), equals(CardType.Discover));
    });

    test('Deve retornar Other para números de cartão inválidos', () {
      expect(detectCardType('1234567890123456'), equals(CardType.Other));
    });
  });

  group('Testes para validarCCV', () {
    test('Deve retornar verdadeiro para um CCV válido', () {
      expect(validarCCV('123', CardType.Visa), isTrue);
    });

    test('Deve retornar falso para um CCV inválido', () {
      expect(validarCCV('12345', CardType.MasterCard), isFalse);
    });

    // Adicione mais testes para diferentes casos, se necessário
  });

  group('Testes para Mascaramento de Número de Cartão:', () {
    test('Mascarar número de cartão válido', () {
      expect(
          maskCardNumber("4539 1488 0343 6467"), equals("•••• •••• •••• 6467"));
    });

    test('Mascarar número de cartão com menos de 4 dígitos', () {
      expect(maskCardNumber("123"), equals("123"));
    });

    test('Mascarar número de cartão nulo', () {
      expect(maskCardNumber(null), equals(''));
    });

    test('Mascarar número de cartão vazio', () {
      expect(maskCardNumber(''), equals(''));
    });

    test('Mascarar número de cartão com caracteres especiais', () {
      expect(
          maskCardNumber("4539-1488-0343-6467"), equals("•••• •••• •••• 6467"));
    });
  });

  group('Testes para Validar Mês e Ano:', () {
    test('Validar mês e ano válidos', () {
      expect(isValidDate('2023-02'), equals(true));
    });

    test('Validar mês inválido', () {
      expect(isValidDate('2023-13'), equals(false));
    });

    test('Validar formato inválido', () {
      expect(isValidDate('2023/02'), equals(false));
    });

    test('Validar ano com dois dígitos', () {
      expect(isValidDate('23-02'), equals(false));
    });
  });
}
