bool isValidLuhn(String cardNumber) {
  if (cardNumber.isEmpty) {
    return false;
  }

  // Remove qualquer espaço em branco e caracteres não numéricos
  cardNumber = cardNumber.replaceAll(RegExp(r'\D+'), '');

  // Inverta o número do cartão
  List<int> reversedCardNumber =
      cardNumber.split('').map(int.parse).toList().reversed.toList();

  int sum = 0;
  bool isSecondDigit = false;

  for (int digit in reversedCardNumber) {
    if (isSecondDigit) {
      digit *= 2;
      if (digit > 9) {
        digit -= 9;
      }
    }
    sum += digit;
    isSecondDigit = !isSecondDigit;
  }

  return sum % 10 == 0;
}
