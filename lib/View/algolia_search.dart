import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:angolia_search_project/Algolia_Service/algolia_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAlgolia extends StatefulWidget {
  const SearchAlgolia({super.key});

  @override
  State<SearchAlgolia> createState() => _SearchAlgoliaState();
}

class _SearchAlgoliaState extends State<SearchAlgolia> {
  TextEditingController searchController = TextEditingController();
  late final AlgoliaServices algoliaServices;
  late final HitsSearcher searcher;
  bool loading = false;

  String seletedbrand = '';
  String seletedCategory = '';

  List<String> Brands = [
    'Garner, Boyle and Flynn',
    'Mueller Inc',
    'Lawson, Keller and Winters',
    'Gallagher and Sons',
    'Irwin LLC'
  ];
  List<String> Categories = ['Health & Wellness', 'Office Supplies','Cleaning Supplies','Automotive '];

  List<Map<String, dynamic>> searchList = [];

  @override
  void initState() {
    super.initState();
    algoliaServices = AlgoliaServices();
    searcher = algoliaServices.searchfinder;

    searcher.responses.listen((responce) {
      setState(() {
        loading = false;
      });
      searchList = responce.hits
          .map((hit) => Map<String, dynamic>.from(hit))
          .toList();
    });
    performSearch('');
  }

  void performSearch(String query) {
    setState(() {
      loading = true;
    });
    List<String> FilteredList = [];
    if (seletedbrand.isNotEmpty) FilteredList.add('brand:${seletedbrand}');
    if (seletedCategory.isNotEmpty)
      FilteredList.add('category:${seletedCategory}');

    searcher.applyState(
      (state) => state.copyWith(
        query: query,
        facetFilters: FilteredList.isNotEmpty ? FilteredList : <String>[],
        hitsPerPage: 50
      ),
    );
  }

  void FilterClean() {
    setState(() {
      seletedbrand = '';
      seletedCategory = '';
    });
    performSearch(searchController.text);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Products"),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            onPressed: () => FilterClean(),
            icon: Icon(Icons.clear_all),
            tooltip: 'Clear Filter',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search Here ...",
                prefix: Icon(Icons.search),
                suffix: searchController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          searchController.clear();
                          performSearch('');
                        },
                        icon: Icon(Icons.clear),
                      )
                    : null,
              ),
              onChanged: (value) {
                setState(() {});
                performSearch(value);
              },
            ),
          ),

          Container(
            height: 100,
            padding: EdgeInsets.all(16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: DropdownButton(
                    value: seletedbrand.isEmpty ? null : seletedbrand,
                    hint: Text("Brands"),
                    items: Brands.map(
                      (brand) =>
                          DropdownMenuItem(value: brand, child: Text(brand)),
                    ).toList(),

                    onChanged: (value) {
                      setState(() {
                        seletedbrand = value ?? '';
                      });
                      performSearch(searchController.text);
                    },
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: DropdownButton(
                    value: seletedCategory.isEmpty ? null : seletedCategory,
                    hint: Text("Category"),
                    items: Categories.map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ),
                    ).toList(),

                    onChanged: (value) {
                      setState(() {
                        seletedCategory = value ?? '';
                      });
                      performSearch(searchController.text);
                    },
                  ),
                ),


              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${searchList.length} products found",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          Expanded(
            child: loading
                ? Center(child: CircularProgressIndicator())
                : searchList.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Data is Not Found",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: searchList.length,
                    itemBuilder: (context, index) {
                      final product = searchList[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Card(
                          child: ListTile(
                            title: Text(product['name'] ?? " "),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Currency Type: ${product['currency']}  |   Price: ${product['price']}",
                                ),
                                SizedBox(height: 10),
                                Text("Brand : ${product['brand']}"),
                                SizedBox(height: 10),
                                Text("Category : ${product['category']}"),
                              ],
                            ),
                            trailing: Text("Stock : ${product['stock']}",style: TextStyle(fontSize: 16),),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    searcher.dispose();
    super.dispose();
  }
}
