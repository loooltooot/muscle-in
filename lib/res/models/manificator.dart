class Manificator {
  static List<String> manification(String word) {
    List<String> _manWords = [];
    String _wordWithoutTail = _removeTail(word);

    if(word == _wordWithoutTail) {
      _manWords.add('Мужики вперед!!!');
      return _manWords;
    }

    if(word.length > 12) {
      _manWords.add('Мужики, ой, длинное слово');
      return _manWords;
    }

    List<String> _manTails = ['атель', 'ун', 'як', 'яльщик', 'ер', 'ик', ''];
    _manWords.addAll(_manTails.map((e) => _wordWithoutTail + e));
    return _manWords;
  }

  static String _removeTail(String word) {
    List<String> _tails = ['ая', 'ия', 'а', 'я', 'есса', 'иха', 'ка'];

    if(_tails.contains(word.substring(word.length - 4))) {
      return word.substring(0, word.length - 4);
    } else if(_tails.contains(word.substring(word.length - 3))) {
      return word.substring(0, word.length - 3);
    } else if(_tails.contains(word.substring(word.length - 2))) {
      return word.substring(0, word.length - 2);
    } else if(_tails.contains(word[word.length - 1])) {
      return word.substring(0, word.length - 1);
    }

    return word;
  }
}