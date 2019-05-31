import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EstateList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EstateListState();
  }
}

class EstateListState extends State<EstateList> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Real estate list"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("estates").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text("Error");
          else {
            if (!snapshot.hasData) return LinearProgressIndicator();
            return buildList(snapshot);
          }
        },
      ),
    );
  }
  Widget buildList(AsyncSnapshot<QuerySnapshot> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.documents.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(snapshot.data.documents[index].toString()),
        );
      }
    );
  }

}