extension ConvertWordToNumber on String {
  int getNumber() {
    List<String> formattedNumbers = replaceAll("e ", "").split(" ");
    int number = 0;
    for (var element in formattedNumbers) {
      number = number +
          (_mappedDozensAndCenturies[element] ?? _mappedNumbers[element] ?? 0);
    }
    return number;
  }

  static Map<String, int> get _mappedNumbers => {
        'um': 1,
        'dois': 2,
        'três': 3,
        'quatro': 4,
        'cinco': 5,
        'seis': 6,
        'sete': 7,
        'oito': 8,
        'nove': 9,
        'dez': 10,
        'onze': 11,
        'doze': 12,
        'treze': 13,
        'quatorze': 14,
        'quinze': 15,
        'dezesseis': 16,
        'dezessete': 17,
        'dezoito': 18,
        'dezenove': 19,
        'XIX': 19,
      };

  static Map<String, int> get _mappedDozensAndCenturies => {
        'vinte': 20,
        'trinta': 30,
        'quarenta': 40,
        'cinquenta': 50,
        'sessenta': 60,
        'setenta': 70,
        'oitenta': 80,
        'noventa': 90,
        'cento': 100,
      };
}

extension ConvertFirstToNumber on String {
  String convertNumberWordsToNumber() {
    List<String> stringList = toLowerCase().split(' ');
    String formattedBook = '';
    for (var element in stringList) {
      formattedBook =
          formattedBook + (_mappedFirstToNumber[element] ?? element);
    }
    return (formattedBook != '') ? formattedBook : this;
  }

  static Map<String, String> get _mappedFirstToNumber => {
        'primeira': "1+",
        'primeiro': "1+",
        'segunda': "2+",
        'segundo': "2+",
        'terceira': "3+",
        'terceiro': "3+",
      };
}
