import 'package:flutter/material.dart';

String localizedText(
  BuildContext context,
  String value, {
  bool transliterateToHindi = true,
}) {
  if (!transliterateToHindi || value.trim().isEmpty) {
    return value;
  }

  final locale = Localizations.localeOf(context);
  if (locale.languageCode != 'hi') {
    return value;
  }

  if (RegExp(r'^[\d\s()+-]+$').hasMatch(value.trim())) {
    return value;
  }

  return _transliterateToHindi(value);
}

String _transliterateToHindi(String input) {
  final normalizedWords = <String, String>{
    'mumbai': 'मुंबई',
    'delhi': 'दिल्ली',
    'new delhi': 'नई दिल्ली',
    'kolkata': 'कोलकाता',
    'chennai': 'चेन्नई',
    'pune': 'पुणे',
    'jaipur': 'जयपुर',
    'lucknow': 'लखनऊ',
    'patna': 'पटना',
    'bhopal': 'भोपाल',
    'surat': 'सूरत',
    'kanpur': 'कानपुर',
    'india': 'इंडिया',
    'gmail': 'जीमेल',
    'yahoo': 'याहू',
    'outlook': 'आउटलुक',
    'road': 'रोड',
    'nagar': 'नगर',
    'market': 'मार्केट',
  };

  final wordPattern = RegExp(r'[A-Za-z]+(?:\s+[A-Za-z]+)?');
  return input.replaceAllMapped(wordPattern, (match) {
    final word = match.group(0) ?? '';
    final mapped = normalizedWords[word.toLowerCase()];
    if (mapped != null) {
      return mapped;
    }

    return _transliterateWord(word);
  });
}

String _transliterateWord(String word) {
  final lower = word.toLowerCase();
  final buffer = StringBuffer();
  int index = 0;

  while (index < lower.length) {
    if (index + 3 <= lower.length) {
      final tri = lower.substring(index, index + 3);
      final triMapped = _threeLetterMap[tri];
      if (triMapped != null) {
        buffer.write(triMapped);
        index += 3;
        continue;
      }
    }

    if (index + 2 <= lower.length) {
      final pair = lower.substring(index, index + 2);
      final pairMapped = _twoLetterMap[pair];
      if (pairMapped != null) {
        buffer.write(pairMapped);
        index += 2;
        continue;
      }
    }

    final char = lower[index];
    buffer.write(_singleLetterMap[char] ?? char);
    index++;
  }

  return buffer.toString();
}

const Map<String, String> _threeLetterMap = {
  'sha': 'श',
  'kha': 'ख',
  'gha': 'घ',
  'cha': 'च',
  'jha': 'झ',
  'tha': 'थ',
  'dha': 'ध',
  'pha': 'फ',
  'bha': 'भ',
};

const Map<String, String> _twoLetterMap = {
  'aa': 'आ',
  'ai': 'ऐ',
  'au': 'औ',
  'ee': 'ई',
  'oo': 'ऊ',
  'kh': 'ख',
  'gh': 'घ',
  'ch': 'च',
  'jh': 'झ',
  'th': 'थ',
  'dh': 'ध',
  'ph': 'फ',
  'bh': 'भ',
  'sh': 'श',
  'ri': 'रि',
  'ya': 'या',
  'ra': 'रा',
  'na': 'ना',
  'ka': 'का',
  'ma': 'मा',
  'la': 'ला',
};

const Map<String, String> _singleLetterMap = {
  'a': 'अ',
  'b': 'ब',
  'c': 'क',
  'd': 'द',
  'e': 'े',
  'f': 'फ',
  'g': 'ग',
  'h': 'ह',
  'i': 'इ',
  'j': 'ज',
  'k': 'क',
  'l': 'ल',
  'm': 'म',
  'n': 'न',
  'o': 'ो',
  'p': 'प',
  'q': 'क',
  'r': 'र',
  's': 'स',
  't': 'त',
  'u': 'उ',
  'v': 'व',
  'w': 'व',
  'x': 'क्स',
  'y': 'य',
  'z': 'ज',
};