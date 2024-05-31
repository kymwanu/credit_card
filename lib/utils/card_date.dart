bool isValidDate(String dateStr) {
  try {
    // Verificar o formato da data
    RegExp regex = RegExp(r'^\d{4}-\d{2}$');
    if (!regex.hasMatch(dateStr)) {
      return false;
    }

    // Separar o ano e mês
    List<String> parts = dateStr.split('-');
    int year = int.parse(parts[0]);
    int month = int.parse(parts[1]);

    // Verificar se o mês está entre 1 e 12 e o ano é válido
    if ((month < 1 || month > 12) || (year < 1)) {
      return false;
    }

    // Se chegou até aqui, consideramos válido
    return true;
  } catch (e) {
    return false;
  }
}
