// Copyright (c) 2016, PeterCarroll. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:ng_bootstrap/ng_bootstrap.dart';
import 'dart:html';
import 'api_service.dart';

@Component(
    selector: 'my-app',
    styleUrls: const ['app_component.css'],
    templateUrl: 'app_component.html',
    directives: const [FORM_DIRECTIVES, BS_DIRECTIVES],
    providers: const [ApiService])
class AppComponent 
{
  final ApiService _api;
  String searchWord = '';
  List<String> suggestedWords = [];
  List<Map> definitions = [];

  AppComponent(this._api);

  getSuggestions() async {
    if(searchWord.length == 0) return [];
    definitions = [];
    suggestedWords = await _api.getSuggestions(searchWord);
  }

  lookupWord(String word) async {
    searchWord = word;
    definitions = await _api.lookupWord(word);
  }
  
  String getAltWord(){
    String newAltWord = '';

    int i=0;
    while(i<searchWord.length){
      var char = searchWord[i];
      if(i+1 < searchWord.length){
        if(isDigraph(char, searchWord[i+1])){
          char += searchWord[i+1];
        }
      }
      newAltWord += getAltLetter(char);

      i+=char.length;
    }

    return newAltWord;
  }

  insertLetter(inLetter){
    searchWord += inLetter;
    var e = document.getElementById('searchWord');
    e.focus();
  }

  bool isDigraph(inChar, inNextChar){
    if(['N', 'n', 'L', 'l'].contains(inChar)){
      return ['J', 'j'].contains(inNextChar);
    }
    else if(['D','d'].contains(inChar)){
      return ['Ž', 'ž'].contains(inNextChar);
    }
    return false;
  }

  String getAltLetter(inLetter)
  {
    switch(inLetter){
      //latin uppercase, return cyrillic uppercase
      case 'A': return 'А';
      case 'B': return 'Б';
      case 'V': return 'В';
      case 'G': return 'Г';
      case 'D': return 'Д';
      case 'Đ': return 'Ђ';
      case 'E': return 'Е';
      case 'Ž': return 'Ж';
      case 'Z': return 'З';
      case 'I': return 'И';
      case 'J': return 'Ј';
      case 'K': return 'К';
      case 'L': return 'Л';
      case 'Lj': 
      case 'LJ': 
        return 'Љ';
      case 'M': return 'М';
      case 'N': return 'Н';
      case 'Nj':
      case 'NJ':
        return 'Њ';
      case 'O': return 'О';
      case 'P': return 'П';
      case 'R': return 'Р';
      case 'S': return 'С';
      case 'T': return 'Т';
      case 'Ć': return 'Ћ';
      case 'U': return 'У';
      case 'F': return 'Ф';
      case 'H': return 'Х';
      case 'C': return 'Ц';
      case 'Č': return 'Ч';
      case 'Dž':
      case 'DŽ': 
        return 'Џ';
      case 'Š': return 'Ш';
      
      //latin lowercase, return cyrillic lowercase
      case 'a': return 'а';
      case 'b': return 'б';
      case 'v': return 'в';
      case 'g': return 'г';
      case 'd': return 'д';
      case 'đ': return 'ђ';
      case 'e': return 'е';
      case 'ž': return 'ж';
      case 'z': return 'з';
      case 'i': return 'и';
      case 'j': return 'ј';
      case 'k': return 'к';
      case 'l': return 'л';
      case 'lj': 
      case 'lJ': 
        return 'љ';
      case 'm': return 'м';
      case 'n': return 'н';
      case 'nj':
      case 'nJ':
        return 'њ';
      case 'o': return 'о';
      case 'p': return 'п';
      case 'r': return 'р';
      case 's': return 'с';
      case 't': return 'т';
      case 'ć': return 'ћ';
      case 'u': return 'у';
      case 'f': return 'ф';
      case 'h': return 'х';
      case 'c': return 'ц';
      case 'č': return 'ч';
      case 'dž':
      case 'dŽ': 
        return 'џ';
      case 'š': return 'ш';
      
      //cyrillic uppercase, return latin uppercase
      case 'А': return 'A';
      case 'Б': return 'B';
      case 'В': return 'V';
      case 'Г': return 'G';
      case 'Д': return 'D';
      case 'Ђ': return 'Đ';
      case 'Е': return 'E';
      case 'Ж': return 'Ž';
      case 'З': return 'Z';
      case 'И': return 'I';
      case 'Ј': return 'J';
      case 'К': return 'K';
      case 'Л': return 'L';
      case 'Љ': return 'Lj';
      case 'М': return 'M';
      case 'Н': return 'N';
      case 'Њ': return 'Nj';
      case 'О': return 'O';
      case 'П': return 'P';
      case 'Р': return 'R';
      case 'С': return 'S';
      case 'Т': return 'T';
      case 'Ћ': return 'Ć';
      case 'У': return 'U';
      case 'Ф': return 'F';
      case 'Х': return 'H';
      case 'Ц': return 'C';
      case 'Ч': return 'Č';
      case 'Џ': return 'Dž';
      case 'Ш': return 'Š';
      
      //cyrillic lowercase, return latin lowercase
      case 'а': return 'a';
      case 'б': return 'b';
      case 'в': return 'v';
      case 'г': return 'g';
      case 'д': return 'd';
      case 'ђ': return 'đ';
      case 'е': return 'e';
      case 'ж': return 'ž';
      case 'з': return 'z';
      case 'и': return 'i';
      case 'ј': return 'j';
      case 'к': return 'k';
      case 'л': return 'l';
      case 'љ': return 'lj';
      case 'м': return 'm';
      case 'н': return 'n';
      case 'њ': return 'nj';
      case 'о': return 'o';
      case 'п': return 'p';
      case 'р': return 'r';
      case 'с': return 's';
      case 'т': return 't';
      case 'ћ': return 'ć';
      case 'у': return 'u';
      case 'ф': return 'f';
      case 'х': return 'h';
      case 'ц': return 'c';
      case 'ч': return 'č';
      case 'џ': return 'dž';
      case 'ш': return 'š';

    }

    return inLetter;
  }
}
