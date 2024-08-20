import 'package:http/http.dart' as http;
import 'package:news_app/Service/api_constant/api_constants.dart';
import 'package:news_app/models/google_news_model.dart';
import '../models/business_news_model.dart';
import '../models/entertainment_news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/health_news_model.dart';
import '../models/science_news_model.dart';
import '../models/sports_news_model.dart';
import '../models/technology_news_model.dart';
import '../models/world_news_model.dart';

class GoogleNewsApi {

  static const String cacheKey = 'cachedNewsLatestData';
  static const String cacheKey2 = 'cachedNewsEntertainmentData';
  static const String cacheKey3 = 'cachedNewsWorldData';
  static const String cacheKey4 = 'cachedNewsBusinessData';
  static const String cacheKey5 = 'cachedNewsHealthData';
  static const String cacheKey6 = 'cachedNewsSportsData';
  static const String cacheKey7 = 'cachedNewsScienceData';
  static const String cacheKey8 = 'cachedNewsTechnologyData';

  Future<List<Item>?> getGoogleNewsData() async {
    print("Loading");
    try {
      var url = Uri.parse(
          ApiConstants.baseUrlGoogleNews + ApiConstants.endPointGoogleNews);
      var response = await http.get(url, headers: {
        'X-RapidAPI-Key': '470320623bmshe9515c5cc3b7cc0p167bdejsn4fb8aa7e9472',
        'X-RapidAPI-Host': 'google-news13.p.rapidapi.com'
      });
      if (response.statusCode == 200) {
        final listOfMyGoogleNews = googleNewsModelFromJson(response.body);
        await _cachedGoogleNewsData(response.body);

        print(listOfMyGoogleNews.items.toString());
        print("Loading finish");

        return listOfMyGoogleNews.items;
      }
    } catch (e) {
      print(e.toString());
      return await getCachedGoogleNewsData();
    }
  }

  Future<void> _cachedGoogleNewsData(String jsonData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(cacheKey, jsonData);
  }

  Future<List<Item>?> getCachedGoogleNewsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString(cacheKey);
    if (jsonData != null) {
      final fromJson = googleNewsModelFromJson(jsonData);
      return fromJson.items;
    }
    return null;
  }


  Future<List<Item2>?> getEntertainmentNewsData() async {
    print("Loading");
    try {
      var url = Uri.parse(
          'https://google-news13.p.rapidapi.com/entertainment?lr=en-US');
      var response = await http.get(url, headers: {
        'X-RapidAPI-Key': '470320623bmshe9515c5cc3b7cc0p167bdejsn4fb8aa7e9472',
        'X-RapidAPI-Host': 'google-news13.p.rapidapi.com'
      });
      print(response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        final listOfMyGoogleNews = entertainmentNewsModelFromJson(
            response.body);
        await _cachedEntertainmentNewsData(response.body);
        // print(listOfMyGoogleNews.entertainmentItems[7].subnews[0]);
        print("Loading finish");
        // print(listOfMyGoogleNews.toString());
        print(listOfMyGoogleNews.items.toString());
        print("returning list");
        return listOfMyGoogleNews.items;
      }
    } catch (e) {
      print(e.toString());
      print("Returning local data");
      return await getCachedEntertainmentNewsData();
    }
  }

  Future<void> _cachedEntertainmentNewsData(String jsonData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("storing data");
    await prefs.setString(cacheKey2, jsonData);
  }

  Future<List<Item2>?> getCachedEntertainmentNewsData() async {
    print("Entr");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString(cacheKey2);
    print(jsonData.toString());
    if (jsonData != null) {
      print("fromJson fun");
      final fromJson = entertainmentNewsModelFromJson(jsonData);
      print('Returning local data from getCachedEntMethod');
      print(fromJson.items.toString());
      return fromJson.items;
    }
    print("returning null");
    return null;
  }


  //For world page

  Future<List<Item3>?> getWorldNewsData() async {
    print("Loading");
    try {
      var url = Uri.parse(
          'https://google-news13.p.rapidapi.com/world?lr=en-US');
      var response = await http.get(url, headers: {
        'X-RapidAPI-Key': '470320623bmshe9515c5cc3b7cc0p167bdejsn4fb8aa7e9472',
        'X-RapidAPI-Host': 'google-news13.p.rapidapi.com'
      });
      print(response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        final listOfMyGoogleNews = worldNewsModelFromJson(response.body);
        await _cachedWorldNewsData(response.body);
        // print(listOfMyGoogleNews.entertainmentItems[7].subnews[0]);
        print("Loading finish");
        // print(listOfMyGoogleNews.toString());
        print(listOfMyGoogleNews.items.toString());
        print("returning list");
        return listOfMyGoogleNews.items;
      }
    } catch (e) {
      print(e.toString());
      print("Returning local data");
      return await getCachedWorldNewsData();
    }
  }

  Future<void> _cachedWorldNewsData(String jsonData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("storing data");
    await prefs.setString(cacheKey3, jsonData);
  }

  Future<List<Item3>?> getCachedWorldNewsData() async {
    print("Entr");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString(cacheKey3);
    print(jsonData.toString());
    if (jsonData != null) {
      print("fromJson fun");
      final fromJson = worldNewsModelFromJson(jsonData);
      print('Returning local data from getCachedEntMethod');
      print(fromJson.items.toString());
      return fromJson.items;
    }
    print("returning null");
    return null;
  }


  //Business Page

  Future<List<Item4>?> getBusinessNewsData() async {
    print("Loading");
    try {
      var url = Uri.parse(
          'https://google-news13.p.rapidapi.com/business?lr= en-US');
      var response = await http.get(url, headers: {
        'X-RapidAPI-Key': '470320623bmshe9515c5cc3b7cc0p167bdejsn4fb8aa7e9472',
        'X-RapidAPI-Host': 'google-news13.p.rapidapi.com'
      });
      print(response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        final listOfMyGoogleNews = businessNewsModelFromJson(response.body);
        await _cachedBusinessNewsData(response.body);
        // print(listOfMyGoogleNews.entertainmentItems[7].subnews[0]);
        print("Loading finish");
        // print(listOfMyGoogleNews.toString());
        print(listOfMyGoogleNews.items.toString());
        print("returning list");
        return listOfMyGoogleNews.items;
      }
    } catch (e) {
      print(e.toString());
      print("Returning local data");
      return await getCachedBusinessNewsData();
    }
  }

  Future<void> _cachedBusinessNewsData(String jsonData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("storing data");
    await prefs.setString(cacheKey4, jsonData);
  }

  Future<List<Item4>?> getCachedBusinessNewsData() async {
    print("Entr");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString(cacheKey4);
    print(jsonData.toString());
    if (jsonData != null) {
      print("fromJson fun");
      final fromJson = businessNewsModelFromJson(jsonData);
      print('Returning local data from getCachedEntMethod');
      print(fromJson.items.toString());
      return fromJson.items;
    }
    print("returning null");
    return null;
  }

  //Health Page


  Future<List<Item5>?> getHealthNewsData() async {
    print("Loading");
    try {
      var url = Uri.parse(
          'https://google-news13.p.rapidapi.com/health?lr=en-US');
      var response = await http.get(url, headers: {
        'X-RapidAPI-Key': '470320623bmshe9515c5cc3b7cc0p167bdejsn4fb8aa7e9472',
        'X-RapidAPI-Host': 'google-news13.p.rapidapi.com'
      });
      print(response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        final listOfMyGoogleNews = healthNewsModelFromJson(response.body);
        await _cachedHealthNewsData(response.body);
        // print(listOfMyGoogleNews.entertainmentItems[7].subnews[0]);
        print("Loading finish");
        // print(listOfMyGoogleNews.toString());
        print(listOfMyGoogleNews.items.toString());
        print("returning list");
        return listOfMyGoogleNews.items;
      }
    } catch (e) {
      print(e.toString());
      print("Returning local data");
      return await getCachedHealthNewsData();
    }
  }

  Future<void> _cachedHealthNewsData(String jsonData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("storing data");
    await prefs.setString(cacheKey5, jsonData);
  }

  Future<List<Item5>?> getCachedHealthNewsData() async {
    print("Entr");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString(cacheKey5);
    print(jsonData.toString());
    if (jsonData != null) {
      print("fromJson fun");
      final fromJson = healthNewsModelFromJson(jsonData);
      print('Returning local data from getCachedEntMethod');
      print(fromJson.items.toString());
      return fromJson.items;
    }
    print("returning null");
    return null;
  }


  //Sports Page

  Future<List<Item6>?> getSportsNewsData() async {
    print("Loading");
    try {
      var url = Uri.parse(
          'https://google-news13.p.rapidapi.com/sport?lr=en-US');
      var response = await http.get(url, headers: {
        'X-RapidAPI-Key': '470320623bmshe9515c5cc3b7cc0p167bdejsn4fb8aa7e9472',
        'X-RapidAPI-Host': 'google-news13.p.rapidapi.com'
      });
      print(response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        final listOfMyGoogleNews = sportsNewsModelFromJson(response.body);
        await _cachedSportsNewsData(response.body);
        // print(listOfMyGoogleNews.entertainmentItems[7].subnews[0]);
        print("Loading finish");
        // print(listOfMyGoogleNews.toString());
        print(listOfMyGoogleNews.items.toString());
        print("returning list");
        return listOfMyGoogleNews.items;
      }
    } catch (e) {
      print(e.toString());
      print("Returning local data");
      return await getCachedSportsNewsData();
    }
  }

  Future<void> _cachedSportsNewsData(String jsonData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("storing data");
    await prefs.setString(cacheKey6, jsonData);
  }

  Future<List<Item6>?> getCachedSportsNewsData() async {
    print("Entr");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString(cacheKey6);
    print(jsonData.toString());
    if (jsonData != null) {
      print("fromJson fun");
      final fromJson = sportsNewsModelFromJson(jsonData);
      print('Returning local data from getCachedEntMethod');
      print(fromJson.items.toString());
      return fromJson.items;
    }
    print("returning null");
    return null;
  }

// Science Page

  Future<List<Item7>?> getScienceNewsData() async {
    print("Loading");
    try {
      var url = Uri.parse(
          'https://google-news13.p.rapidapi.com/science?lr=en-US');
      var response = await http.get(url, headers: {
        'X-RapidAPI-Key': '470320623bmshe9515c5cc3b7cc0p167bdejsn4fb8aa7e9472',
        'X-RapidAPI-Host': 'google-news13.p.rapidapi.com'
      });
      print(response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        final listOfMyGoogleNews = scienceNewsModelFromJson(response.body);
        await _cachedScienceNewsData(response.body);
        // print(listOfMyGoogleNews.entertainmentItems[7].subnews[0]);
        print("Loading finish");
        // print(listOfMyGoogleNews.toString());
        print(listOfMyGoogleNews.items.toString());
        print("returning list");
        return listOfMyGoogleNews.items;
      }
    } catch (e) {
      print(e.toString());
      print("Returning local data");
      return await getCachedScienceNewsData();
    }
  }

  Future<void> _cachedScienceNewsData(String jsonData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("storing data");
    await prefs.setString(cacheKey7, jsonData);
  }

  Future<List<Item7>?> getCachedScienceNewsData() async {
    print("Entr");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString(cacheKey7);
    print(jsonData.toString());
    if (jsonData != null) {
      print("fromJson fun");
      final fromJson = scienceNewsModelFromJson(jsonData);
      print('Returning local data from getCachedEntMethod');
      print(fromJson.items.toString());
      return fromJson.items;
    }
    print("returning null");
    return null;
  }

  Future<List<Item8>?> getTechnologyNewsData() async {
    try {
      var url = Uri.parse(
          'https://google-news13.p.rapidapi.com/technology?lr=en-US');
      var response = await http.get(url, headers: {
        'X-RapidAPI-Key': '470320623bmshe9515c5cc3b7cc0p167bdejsn4fb8aa7e9472',
        'X-RapidAPI-Host': 'google-news13.p.rapidapi.com',
      }
      );
      if(response.statusCode==200){
        final listOfMyGoogleNews = technologyNewsModelFromJson(response.body);
        await _cachedTechnologyNewsData(response.body);
        print(listOfMyGoogleNews.items.toString());
        return listOfMyGoogleNews.items;
      }
    } catch(e){
      print(e.toString());
      return await getCachedTechnologyNewsData();
    }
  }
  Future<void> _cachedTechnologyNewsData(String jsonData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("storing data");
    await prefs.setString(cacheKey8, jsonData);
  }

  Future<List<Item8>?> getCachedTechnologyNewsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString(cacheKey8);
    print(jsonData.toString());
    if (jsonData != null) {
      final fromJson = technologyNewsModelFromJson(jsonData);
      print(fromJson.items.toString());
      return fromJson.items;
    }
    return null;
  }
}
