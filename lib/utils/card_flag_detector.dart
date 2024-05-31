// ignore_for_file: constant_identifier_names

enum CardType { Visa, MasterCard, AmericanExpress, Discover, Other }

CardType detectCardType(String cardNumber) {
  if (cardNumber.isEmpty) {
    return CardType.Other;
  }

  // Remover espaços em branco e caracteres não numéricos
  cardNumber = cardNumber.replaceAll(RegExp(r'\D+'), '');

  // Verificar padrões para detectar a bandeira do cartão
  if (RegExp(r'^4[0-9]{12}(?:[0-9]{3})?$').hasMatch(cardNumber)) {
    return CardType.Visa;
  } else if (RegExp(r'^5[1-5][0-9]{14}$').hasMatch(cardNumber)) {
    return CardType.MasterCard;
  } else if (RegExp(r'^3[47][0-9]{13}$').hasMatch(cardNumber)) {
    return CardType.AmericanExpress;
  } else if (RegExp(r'^6(?:011|5[0-9]{2})[0-9]{12}$').hasMatch(cardNumber)) {
    return CardType.Discover;
  } else {
    return CardType.Other;
  }
}
