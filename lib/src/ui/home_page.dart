import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text('Las más recientes',
              style: Theme.of(context).textTheme.headline),
            ),
            SizedBox(height: 20.0),
            _buildPopularBattlesList(),
            SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text('Las más vistas',
                  style: Theme.of(context).textTheme.headline),
            ),
            SizedBox(height: 20.0),
            _buildRecentBattlesList(),
          ],
        )
    );
  }

  Widget _buildPopularBattlesList() {
    return StreamBuilder(
      stream: Firestore.instance.collection('battles').where('popularity', isGreaterThan: 1000).orderBy('popularity').orderBy('date', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        return Container(
            height: 150.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return _buildBattleItem(
                      context, snapshot.data.documents[index]);
                }));
      },
    );
  }

  Widget _buildRecentBattlesList() {
    return StreamBuilder(
      stream: Firestore.instance.collection('battles').orderBy('date', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        return Container(
            height: 150.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return _buildBattleItem(
                      context, snapshot.data.documents[index]);
                }));
      },
    );
  }

  Widget _buildBattleItem(BuildContext context, DocumentSnapshot document) {
    return Row(
      children: <Widget>[
        SizedBox(width: 25.0),
        Container(
          width: 250.0,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(document['poster_path']), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              new BoxShadow(
                  color: Colors.grey,
                  offset: new Offset(2.0, 2.0),
                  blurRadius: 8.0)
            ],
          ),
        ),
      ],
    );
  }
}
