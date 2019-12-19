import 'package:cached_network_image/cached_network_image.dart';import 'package:finaltask_eudeka/data/api_provider.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:finaltask_eudeka/models/drink_name.dart';import 'package:flutter_spinkit/flutter_spinkit.dart';import 'about.dart';import 'detail.dart';class Home extends StatefulWidget {  @override  _HomeState createState() => _HomeState();}class _HomeState extends State<Home> {  ApiProvider provider = ApiProvider();  Future<DrinkName> drinkName;  @override  void initState() {    drinkName = provider.getDrinkName();    super.initState();  }  @override  Widget build(BuildContext context) {    return Scaffold(      bottomNavigationBar:          BottomNavigationBar(type: BottomNavigationBarType.fixed, items: [        BottomNavigationBarItem(          icon: new Icon(Icons.home),          title: new Text('Beranda'),        ),        BottomNavigationBarItem(          icon: new Icon(Icons.inbox),          title: new Text('Inbox'),        ),        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Akun'))      ]),      body: SingleChildScrollView(        child: Column(          children: <Widget>[            Container(              margin: EdgeInsets.only(top: 48),              child: Row(                children: <Widget>[                  Container(                      margin: EdgeInsets.only(left: 20, right: 15),                      child: Icon(                        Icons.account_circle,                        color: Colors.grey,                        size: 28,                      )),                  Expanded(                      child: Text(                    "FAISAL RIDWAN SIREGAR",                    style: TextStyle(fontWeight: FontWeight.bold),                  )),                  Container(                    margin: EdgeInsets.only(right: 10),                    child: Icon(                      Icons.recent_actors,                      color: Colors.grey,                      size: 25,                    ),                  ),                  Container(                    margin: EdgeInsets.only(left: 10, right: 15),                    child: PopupMenuButton<int>(                      onSelected: (value) {                        print('ONSELEC = $value');                        Navigator.of(context).push(                          MaterialPageRoute(                            builder: (BuildContext context) => About(),                          ),                        );                      },                      child: Icon(                        Icons.more_vert,                        color: Colors.grey,                      ),                      itemBuilder: (context) => [                        PopupMenuItem(                          value: 1,                          child: Text('About'),                        ),                      ],                    ),                  ),                ],              ),            ),            Stack(              children: <Widget>[                Container(                  margin: EdgeInsets.only(top: 15),                  height: 70,                  decoration: BoxDecoration(                      color: Colors.red,                      borderRadius: BorderRadius.only(                          topLeft: Radius.circular(15),                          topRight: Radius.circular(15))),                ),                Container(                  margin: EdgeInsets.only(top: 30, left: 20),                  child: Column(                    children: <Widget>[                      Row(                        children: <Widget>[                          Expanded(                              child: Column(                            crossAxisAlignment: CrossAxisAlignment.start,                            children: <Widget>[                              Container(                                child: Text(                                  'Rp 566',                                  style: TextStyle(                                      fontWeight: FontWeight.bold,                                      color: Colors.white),                                ),                              ),                              Row(                                children: <Widget>[                                  Text(                                    'Saldo Bonus 0',                                    style: TextStyle(                                        fontSize: 10, color: Colors.white),                                  ),                                  Container(                                      margin: EdgeInsets.only(left: 5),                                      child: Icon(                                        Icons.play_circle_filled,                                        color: Colors.white,                                        size: 18,                                      )),                                ],                              )                            ],                          )),                          Container(                              margin: EdgeInsets.only(right: 15),                              child: Icon(                                Icons.inbox,                                size: 30,                                color: Colors.white,                              )),                        ],                      )                    ],                  ),                ),              ],            ),            Padding(              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),              child: Divider(),            ),            Container(              margin: EdgeInsets.only(top: 20),              child: Row(                children: <Widget>[                  Expanded(                      child: Column(                    crossAxisAlignment: CrossAxisAlignment.start,                    children: <Widget>[                      Container(                          margin: EdgeInsets.only(left: 10, bottom: 5),                          child: Text(                            'Yuk yuk minum dulu, yuk!',                            style: TextStyle(fontWeight: FontWeight.bold),                          )),                      Container(                          margin: EdgeInsets.only(left: 10),                          child:                              Text('"Isi bensin" dulu sebelum beraktivitas')),                    ],                  )),                  Container(                      margin: EdgeInsets.only(bottom: 20, right: 10),                      child: Text('See All')),                ],              ),            ),            Container(              child: FutureBuilder(                future: drinkName,                builder: (BuildContext context, AsyncSnapshot snapshot) {                  if (snapshot.hasData) {                    DrinkName drink = snapshot.data;                    print(                        'NAMA DRINK :  ${drink.drinks[0].idDrink.toString()}');                    return Container(                      margin: EdgeInsets.only(top: 20),                      height: 220,                      child: ListView.builder(                        scrollDirection: Axis.horizontal,                        itemCount: snapshot.data.drinks.length,                        itemBuilder: (BuildContext context, int index) {                          print('${drink.drinks[index].strDrinkThumb}');                          return itemDrink(drink, index);                        },                      ),                    );                  } else if (snapshot.hasError) {                    print('Has Error Data : ${snapshot.hasError}');                    return Text('Error!!!');                  } else {                    print('Sedang loading....');                    return Center(child: SpinKitChasingDots(color: Colors.red));                  }                },              ),            ),            Padding(              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),              child: Divider(),            ),            Container(              width: double.infinity,              margin: EdgeInsets.only(top: 10, left: 15),              child: Text(                'Pasti Lebih Hemat',                style: TextStyle(fontWeight: FontWeight.bold),              ),            ),            Container(              margin: EdgeInsets.all(10),              child: Container(                margin: EdgeInsets.only(bottom: 5),                child: Column(                  children: <Widget>[                    Row(                      children: <Widget>[                        Column(                          children: <Widget>[                            Container(                              height: 124,                              width: 124,                              child: Card(                                child: Column(                                  mainAxisSize: MainAxisSize.max,                                  mainAxisAlignment: MainAxisAlignment                                      .center, // MAIN COLUM ATAS BAWAH --- ROW  KIRI KANAN & CROSS LAWANNYA                                  children: <Widget>[                                    Expanded(                                      child: Icon(Icons.favorite),                                    ),                                    Container(                                        margin: EdgeInsets.only(bottom: 10),                                        child: Text('Promosi')),                                  ],                                ),                              ),                            ),                          ],                        ),                        Column(                          children: <Widget>[                            Container(                              height: 124,                              width: 124,                              child: Card(                                child: Column(                                  mainAxisSize: MainAxisSize.max,                                  mainAxisAlignment: MainAxisAlignment                                      .center, // MAIN COLUM ATAS BAWAH --- ROW  KIRI KANAN & CROSS LAWANNYA                                  children: <Widget>[                                    Expanded(                                      child: Icon(Icons.favorite),                                    ),                                    Container(                                        margin: EdgeInsets.only(bottom: 10),                                        child: Text('Promosi')),                                  ],                                ),                              ),                            ),                          ],                        ),                        Column(                          children: <Widget>[                            Container(                              height: 124,                              width: 124,                              child: Card(                                child: Column(                                  mainAxisSize: MainAxisSize.max,                                  mainAxisAlignment: MainAxisAlignment                                      .center, // MAIN COLUM ATAS BAWAH --- ROW  KIRI KANAN & CROSS LAWANNYA                                  children: <Widget>[                                    Expanded(child: Icon(Icons.favorite)),                                    Container(                                        margin: EdgeInsets.only(bottom: 10),                                        child: Text('Promosi')),                                  ],                                ),                              ),                            ),                          ],                        ),                      ], //                    ),                    Row(                      children: <Widget>[                        Column(                          children: <Widget>[                            Container(                              height: 124,                              width: 124,                              child: Card(                                child: Column(                                  mainAxisSize: MainAxisSize.max,                                  mainAxisAlignment: MainAxisAlignment                                      .center, // MAIN COLUM ATAS BAWAH --- ROW  KIRI KANAN & CROSS LAWANNYA                                  children: <Widget>[                                    Expanded(                                      child: Icon(Icons.favorite),                                    ),                                    Container(                                        margin: EdgeInsets.only(bottom: 10),                                        child: Text('Promosi')),                                  ],                                ),                              ),                            ),                          ],                        ),                        Column(                          children: <Widget>[                            Container(                              height: 124,                              width: 124,                              child: Card(                                child: Column(                                  mainAxisSize: MainAxisSize.max,                                  mainAxisAlignment: MainAxisAlignment                                      .center, // MAIN COLUM ATAS BAWAH --- ROW  KIRI KANAN & CROSS LAWANNYA                                  children: <Widget>[                                    Expanded(                                      child: Icon(Icons.favorite),                                    ),                                    Container(                                        margin: EdgeInsets.only(bottom: 10),                                        child: Text('Promosi')),                                  ],                                ),                              ),                            ),                          ],                        ),                        Column(                          children: <Widget>[                            Container(                              height: 124,                              width: 124,                              child: Card(                                child: Column(                                  mainAxisSize: MainAxisSize.max,                                  mainAxisAlignment: MainAxisAlignment                                      .center, // MAIN COLUM ATAS BAWAH --- ROW  KIRI KANAN & CROSS LAWANNYA                                  children: <Widget>[                                    Expanded(child: Icon(Icons.favorite)),                                    Container(                                        margin: EdgeInsets.only(bottom: 10),                                        child: Text('Promosi')),                                  ],                                ),                              ),                            ),                          ],                        ),                      ], //                    ),                    Container(                        margin: EdgeInsets.only(top: 5), child: Divider()),                  ],                ),              ),            ),          ],        ),      ),    );  }  Widget itemDrink(DrinkName drink, int index) => InkWell(        onTap: () {          Navigator.of(context).push(            MaterialPageRoute(              builder: (BuildContext context) => DetailDrink(                drink: drink.drinks[index],              ),            ),          );        },        child: Container(          margin: EdgeInsets.only(left: 5),          width: 140,          child: Card(            shape: RoundedRectangleBorder(                borderRadius: BorderRadius.all(Radius.circular(5))),            child: Container(              child: Column(                crossAxisAlignment: CrossAxisAlignment.start,                children: <Widget>[                  Container(                    height: 150,                    width: 140,                    child: ClipRRect(                      borderRadius: BorderRadius.only(                          topRight: Radius.circular(5),                          topLeft: Radius.circular(5)),                      child: CachedNetworkImage(                        imageUrl: '${drink.drinks[index].strDrinkThumb}',                        imageBuilder: (context, imageProvider) => Container(                          width: 150,                          height: 360,                          decoration: BoxDecoration(                            image: DecorationImage(                              image: imageProvider,                              fit: BoxFit.cover,                            ),                          ),                        ),                      ),                    ),                  ),                  Expanded(                    child: Container(                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),                      child: Text(                        '${drink.drinks[index].strDrink.toString()}',                        textAlign: TextAlign.left,                        style: TextStyle(                            fontWeight: FontWeight.bold,                            fontSize: 13,                            color: Colors.grey[700]),                      ),                    ),                  ),                  Container(                    margin: EdgeInsets.only(left: 10, bottom: 8),                    child: Text(                      'Rp. ${drink.drinks[index].idDrink.toString()}',                      textAlign: TextAlign.left,                      style:                          TextStyle(fontWeight: FontWeight.w700, fontSize: 12),                    ),                  ),                ],              ),            ),          ),        ),      );}