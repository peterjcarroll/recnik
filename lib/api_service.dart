import 'dart:async';
import 'dart:convert';
import 'package:angular2/core.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

@Injectable()
class ApiService {
  static const _apiUrl = 'http://localhost:8000';
  final BrowserClient _http;

  ApiService(this._http);

  Future<List<String>> getSuggestions(String search) async {
    try{
      final response = await _http.get(_apiUrl + '/suggest?search=' + search);
      final words = _extractWords(response);
      return words;
    } catch (e) {
      throw _handleError(e);
    }
  } 

  dynamic _extractWords(Response res) {
    var body = JSON.decode(res.body);
    return body['words'];
  }

  Future<List<Map>> lookupWord(String word) async {
    try{
      final response = await _http.get(_apiUrl + '/lookup?word=' + word);
      final definitions = _extractDefinitions(response);
      return definitions;
    } catch (e) {
      throw _handleError(e);
    }    
  }

  dynamic _extractDefinitions(Response res) {
    var body = JSON.decode(res.body);
    return body;
  }

  Exception _handleError(dynamic e) {
    // In a real world app, we might use a remote logging infrastructure
    // We'd also dig deeper into the error to get a better message
    print(e); // log to console instead
    return new Exception('Server error; cause: $e');
  }

}