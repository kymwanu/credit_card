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

bool validarCCV(String ccv, CardType cardType) {
  if (ccv.isEmpty) {
    return false;
  }

  // Remover espaços em branco e caracteres não numéricos
  ccv = ccv.replaceAll(RegExp(r'\D+'), '');

  // Determinar o comprimento do CCV com base no tipo de cartão
  int ccvLength;
  switch (cardType) {
    case CardType.Visa:
    case CardType.MasterCard:
    case CardType.Discover:
      ccvLength = 3;
      break;
    case CardType.AmericanExpress:
      ccvLength = 4;
      break;
    default:
      return false; // Tipo de cartão desconhecido
  }

  // Verificar se o CCV tem o comprimento correto
  return ccv.length == ccvLength;
}
