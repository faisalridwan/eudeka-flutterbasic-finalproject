import 'package:community_material_icon/community_material_icon.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:cached_network_image/cached_network_image.dart';import 'package:community_material_icon/community_material_icon.dart';import 'package:url_launcher/url_launcher.dart';class About extends StatelessWidget {  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: AppBar(        backgroundColor: Colors.white,        leading: IconButton(          icon: Icon(Icons.arrow_back),          color: Colors.black,          onPressed: () {            Navigator.pop(context);          },        ),      ),      body: Container(        width: double.infinity,        child: Column(          mainAxisAlignment: MainAxisAlignment.start,          crossAxisAlignment: CrossAxisAlignment.center,          children: <Widget>[            Container(              margin: EdgeInsets.only(top: 20),              width: 200,              height: 200,              child: ClipOval(                child: CachedNetworkImage(                  fit: BoxFit.cover,                  imageUrl:                      'https://avatars3.githubusercontent.com/u/31500226?s=460&v=4',                ),              ),            ),            Container(                margin: EdgeInsets.only(top: 20),                child: Text(                  'FAISAL RIDWAN SIREGAR',                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),                )),            Container(                margin: EdgeInsets.only(top: 10),                child: Row(                  mainAxisAlignment: MainAxisAlignment.center,                  children: <Widget>[                    Container(                      child: IconButton(                        icon: Icon(CommunityMaterialIcons.github_circle, size: 40,),                        onPressed: () async {                          const url = 'https://github.com/faisalridwan';                          if (await canLaunch(url)) {                          await launch(url);                          } else {                          throw 'Could not launch $url';                          }                        },                      ),                    ),                  ],                )),          ],        ),      ),    );  }}