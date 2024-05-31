String maskCardNumber(String? cardNumber) {
  if (cardNumber == null || cardNumber.isEmpty) {
    return '';
  }

  // Remover espaços em branco e caracteres não numéricos
  cardNumber = cardNumber.replaceAll(RegExp(r'\D'), '');

  // Verificar se o número do cartão tem menos de 4 dígitos
  if (cardNumber.length < 4) {
    return cardNumber;
  }

  // Separar o número do cartão em grupos de 4 dígitos
  List<String> groups = [];
  for (var i = 0; i < cardNumber.length; i += 4) {
    groups.add(cardNumber.substring(i, i + 4));
  }

  // Mascara todos os grupos, exceto o último
  for (var i = 0; i < groups.length - 1; i++) {
    groups[i] = '•' * groups[i].length;
  }

  // Juntar os grupos e retornar
  return groups.join(' ');
}
