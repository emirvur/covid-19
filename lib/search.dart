import 'package:flutter/material.dart';



class Search extends SearchDelegate{

  final List countryList;

  Search(this.countryList);

  @override
  List<Widget> buildActions(BuildContext context) {
   return [
     IconButton(icon: Icon(Icons.clear), onPressed: (){
       query='';

     })
   ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    final suggestionList
         =
           query.isEmpty?
           countryList:
           countryList.where((element) => element.country.toString().toLowerCase().startsWith(query)).toList();

   return ListView.builder(
       itemCount: suggestionList.length,
       itemBuilder: (context,index){
     return Card(
       child: Container(
         height: 130,
         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
         child: Row(
           children: <Widget>[
             Container(
               width: 200,
               margin: EdgeInsets.symmetric(horizontal: 10),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text(
                     suggestionList[index].country,
                     style: TextStyle(fontWeight: FontWeight.bold),
                   ),
                   Text(
                    "Toplam ölüm sayısı${suggestionList[index].totalDeaths.toString()}",
                   ),
                    Text(
                   "bugun ölen sayısı ${  suggestionList[index].newDeaths.toString()}",
                   ),
                    Text(
                   "toplam vaka sayısı ${  suggestionList[index].totalConfirmed.toString()}",
                   ),
                    Text(
                   "bugunkü vaka sayısı${  suggestionList[index].newConfirmed.toString()}",
                   ),

                 ],
               ),
             ),
            
           ],
         ),
       ),
     );
   });
  }

}