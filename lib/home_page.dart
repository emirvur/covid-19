import 'package:covid/api_service.dart';
import 'package:covid/summary_model.dart';
import 'package:flutter/material.dart';

import 'country_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

Future<Summary> bilgi;
@override
  void initState() {
    super.initState();
    bilgi= Service.postService();
     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,  //Colors.blue.shade300 ,
      appBar: AppBar(title:Text("Covid-19 App"),actions: <Widget>[IconButton(icon: Icon(Icons.map)  ,onPressed: (){}  )],backgroundColor: Colors.transparent,),
              body: Container(

                   decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://www.developmentaid.org/api/frontend/cms/uploadedImages/2020/03/COVID19OUTBREAKWeekly-Review_blog_1.jpg'),
          fit: BoxFit.cover
        ) ,
      ),

                child: FutureBuilder<Summary>(
                  future:bilgi,
                  builder:(context,snapshot){
                    if(snapshot.hasError){
                       return Center(
                      child: CircularProgressIndicator(
                      ),
                    );
                    }
                   else if(snapshot.hasData){
                      if(snapshot.data!=null){
                      final summary=snapshot.data.global;
  return   Column(
            children: <Widget>[
             
                Container( width: MediaQuery.of(context).size.width,height: 100,color:Colors.transparent, child: Center(child: Text("GLOBAL ALANDA GÜNCEL VERİLER",textAlign: TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,fontWeight:FontWeight.bold ),))),
                Row(
                  children: <Widget>[
                    sayi_kutusu("Toplam Ölüm Sayısı",summary.totalDeaths),
                    sayi_kutusu("Toplam Hasta Sayısı",summary.totalConfirmed-summary.totalDeaths-summary.totalRecovered)
                  ],
                ),
                 Row(
                  children: <Widget>[
                    sayi_kutusu("Toplam İyileşen Sayısı",summary.totalRecovered),
                    sayi_kutusu("Toplam Vaka Sayısı",summary.totalConfirmed)
                  ],
                ),
                ExpansionTile(backgroundColor:Colors.transparent,leading: Icon(Icons.arrow_drop_down),title: Text("Covid Hakkında Sık Sorulan Sorular"),
                children: <Widget>[
                  Text("Belirtisiz olgular olabileceği bildirilmekle birlikte, bunların oranı bilinmemektedir. En çok karşılaşılan belirtiler ateş, öksürük ve nefes darlığıdır. Şiddetli olgularda zatürre, ağır solunum yetmezliği, böbrek yetmezliği ve ölüm gelişebilmektedir.")
                ],),
                 ExpansionTile(backgroundColor:Colors.transparent ,leading: Icon(Icons.arrow_drop_down),title: Text("Yeni Koronavirüs (COVID-19) kimleri daha fazla etkiler?"),
                children: <Widget>[
                  Text("Elde edilen veriler doğrultusunda ileri yaş ve eşlik eden hastalığı (astım, diyabet, kalp hastalığı gibi) olanlarda virüsün ağır hastalık oluşturma riski daha yüksektir. Bugünkü verilerle hastalığın %10-15 olguda ağır seyrettiği, yaklaşık %2 olguda da ölümle sonuçlandığı bilinmektedir")
                ],),
             Expanded(child: Container(
               padding: EdgeInsets.only(bottom:100.0),
               decoration: BoxDecoration(
                 border:Border.all(width: 1)
               ),
                /*  color:Colors.transparent,
                decoration: BoxDecoration(
                 image: DecorationImage(
                      image:NetworkImage('https://www.mapsofworld.com/images-mow/world-map.jpg'),
                      fit: BoxFit.cover)  )*/
                      child: SizedBox( width: double.infinity,
                                            child: FlatButton(onPressed: (){
                    Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>CountryPage(ummary: snapshot.data)));
                        }, child: Container(decoration:BoxDecoration(
                 border:Border.all(width: 3)),child: Text("Ülkelerin ayrıntılarına bakmak için buraya dokunun",textAlign: TextAlign.justify,style: TextStyle(fontStyle: FontStyle.italic,fontWeight:FontWeight.bold )))),
                      ),
                ))

            ],
          );

                    }
                   
                  
                    } 
                     else{
                      return Center(
                    child: CircularProgressIndicator(
                        ),
                  );
                    } }
        ),
              ),
      
      
    );
  }

  Widget sayi_kutusu(String yazi,int sayi) {
    return Center(
      child: Expanded(
              child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           border: Border.all(width:1),
           color: Colors.transparent
          ),
                  height: 100,
                  width: MediaQuery.of(context).size.width*0.45,
                 
                  child:Center(child: Text("$yazi: ${sayi.toString()}",textAlign: TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,fontWeight:FontWeight.bold ))),
                ),
      ),
    );
  }
}






















/*class MyHomePage extends StatefulWidget {
 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  Future <List<Post>> bilgi;
@override
  void initState() {
    super.initState();
    bilgi= Service.postService();
     }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: FutureBuilder<List<Post>>(future:bilgi,
     builder:(context,snapshot){
if (snapshot.hasError) {
                return Center(
                  child: CircularProgressIndicator(
                  ),
                );
              }
               if(snapshot.hasData){
                List<Post> classlist=snapshot.data;
        return  ListView.builder(itemCount: classlist.length,itemBuilder: (context,index){
              return ListTile(
                title:Text(classlist[index].title) ,
                subtitle:Text(classlist[index].body) ,
              ) ;

            });
              }
             else{ return Center(
                child: CircularProgressIndicator(
                    ),
              );
             }

     }  ),
    );
  }
}*/