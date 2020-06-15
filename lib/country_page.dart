import 'package:covid/search.dart';
import 'package:covid/summary_model.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {

      final ummary;
   CountryPage({@required this.ummary});
  @override
  _CountryPageState createState() => _CountryPageState();


}

class _CountryPageState extends State<CountryPage> {


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("ülkelerin son durumu"),backgroundColor: Colors.red.shade500,
            actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){

            showSearch(context: context, delegate: Search(widget.ummary.countries));

          },)
        ],
      ),
      body: ListView.builder(itemCount:widget.ummary.countries.length, itemBuilder: (BuildContext context, int index) { 
        return ListTile(
          title:Text("${widget.ummary.countries[index].country}"),
           subtitle:Text("${widget.ummary.countries[index].totalDeaths}")
           //ontap metodu yapılıp basılan ulkenın verileri pasta dilim grafigi seklinde gösterliebilr showbottom.. ya da alertdialog sayesınde
        );
       } ,)
      
    );
  }
}