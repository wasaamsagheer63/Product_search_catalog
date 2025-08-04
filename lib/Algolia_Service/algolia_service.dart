import 'dart:convert';

import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AlgoliaServices{
     String application_ID = "U44Z8FR9YK";
     String API_KEY = "4142a565bc372ec89124c7e652ed0e54";
     String api_index = "Products";

     late final HitsSearcher searcher ;

     AlgoliaServices(){
       searcher = HitsSearcher(
           applicationID: application_ID,
           apiKey: API_KEY,
           indexName: api_index );
     }

     HitsSearcher get searchfinder => searcher;
     
     Future<bool> sendDatatoAlgoliaStructure() async{
       try{
         final responce =await  http.get(Uri.parse("https://688c665ccd9d22dda5ccfa73.mockapi.io/api/v1/data"));
         var  data = jsonDecode(responce.body.toString());
         if(responce.statusCode != 200){
           print("Data is not transfer successfully");
           return false;
         }
         else{
           final List<Map<String,dynamic>> AlgoliaList = [];
           for(var item in data) {
             final algoliaobject = {
               'objectID':item['id'].toString(),
               'id':item['id'].toString(),
               'index':item['Index'],
               'name':item['Name'],
               'description':item['Description'],
               'brand':item['Brand'],
               'category':item['Category'],
               'price':item['Price'],
               'currency':item['Currency'],
               'stock':item['Stock'],
               'ean':item['EAN'],
               'color':item['Color'],
               'size':item['Size'],
               'availability':item['Availability'],
               'internalID':item['Internal ID'],
               'priceRange':priceRange(item['Price']),
               'inStock':item['Availability'] == 'in_Stock',
               'searchableText':'${item['Name']} ${item['Description']} ${item['Brand']} ${item['Category']}',
             };
             AlgoliaList.add(algoliaobject);
           }
           print("print Algolia First Object ${AlgoliaList.first}");
            bool success = await sendDataToAlgoliaServer(AlgoliaList);
    if(success){
   await settings();
   Get.snackbar("Success", "Data is transfered and setting is configured correctly");
   return true;
}else{
  return false;
}

         }
       }
       catch(e){
         print("Data failed to transfer");
         return false;
       }
     }

     Future<bool> sendDataToAlgoliaServer(List<Map<String,dynamic>> listProducts )async {
       try{
       final url = 'https://$application_ID-dsn.algolia.net/1/indexes/$api_index/batch';


       final batchRequest = {
         'requests':[
           {'action':'clear'},
           ...listProducts.map((item) =>{
             'action':'addObject',
             'body':item
       }).toList()
         ]
       };

       final responce = await http.post(Uri.parse(url),
       headers: {
         'X-Algolia-API-Key':API_KEY,
         'X-Algolia-Application-Id':application_ID,
         'Content-Type':'application/json'
       },
       body: jsonEncode(batchRequest)
       );
       if(responce.statusCode == 200 || responce.statusCode == 201){
         var  data = jsonDecode(responce.body);
         print("Data to send to Algolia in batchRequest${data['taskID']}");
         return true;
       }
       else{
         print("Data is not transfered in batch and ${responce.statusCode} and responce body : ${responce.body}");
         return false;
       }}
           catch(e){
         print(e.toString());
         return false;
           }
     }


     Future<void> settings()async {
       try {
         final url = 'https://$application_ID-dsn.algolia.net/1/indexes/$api_index/settings';
         final setting = {
           'searchableAttributes': [
             'name',
             'brand',
             'category',
             'description',
             'searchableText'
           ],
           'attributesForFaceting': [
             'brand',
             'category',
             'color',
             'size',
             'availability',
             'priceRange',
             'inStock'
           ],
           'customRanking': ['desc(stock)', 'asc(price)'],
           'typoTolerance': true,
           'minWordSizefor1Typo': 4,
           'minWordSizefor2Typos': 8,
         };
         final responce = await http.put(Uri.parse(url),
             headers: {
               'X-Algolia-API-Key': API_KEY,
               'X-Algolia-Application-Id': application_ID,
               'Content-Type': 'application/json'
             },
             body: jsonEncode(setting)
         );
         if (responce.statusCode == 200) {
           print("settings are configured");
         }
         else {
           print("Settings are not configured ${responce.statusCode}");
           print("Settings are not configured ${responce.body}");

         }
       }
       catch(e){
         print("Error in setting in catch${e.toString()}");
       }
     }

       String priceRange(int price){
       if(price < 100) return 'Under 100';
       if(price < 500) return '100 - 500';
       if(price < 1000) return '500 - 1000';
       if(price < 5000) return '1000 - 5000';
      return "Over 5000";
     }

     void dispose(){
       searcher.dispose();
     }
}