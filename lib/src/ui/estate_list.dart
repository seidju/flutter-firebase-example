import 'package:flutter/material.dart';
import 'package:real_estate_app/src/models/estate_model.dart';
import 'package:real_estate_app/src/ui/estate_info.dart';
import 'package:real_estate_app/src/blocs/estate_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class EstateListWidget extends StatefulWidget {
  final EstateListState state;

  EstateListWidget(this.state);

  @override
  State<EstateListWidget> createState() {
    return state;
  }
}

class EstateListState extends State<EstateListWidget> {

  EstateBloc bloc;
  EstateListState(this.bloc);

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Real estate list"),
      ),
      body: StreamBuilder<List<EstateModel>>(
        stream: bloc.loadEstates(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text("$snapshot");
          else {
            if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
            return buildList(snapshot);
          }
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<EstateModel>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,

      itemBuilder: (context, index) {
        final item = snapshot.data[index];

        return new GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => EstateInfoWidget(item)));
          },
          child: _buildEstateCard(context, item)
        );
      }
    );
  }

  Widget _buildEstateCard(BuildContext context, EstateModel model) {
    return Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),

        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 226.0,
                child:
                _buildPageController(model.photos),
              ),
              Container(
                margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                height: 70.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '${model.address.district}, улица ${model.address.street}',
                    ),
                    Divider(
                      height: 0.5,
                      color: Colors.black38,
                    ),
                    Text(
                      '${model.roomCount}-к квартира, цена ${model.price} рублей',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget _buildPageController(List<String> photos) {
    final controller = PageController(
      initialPage: 0
    );
    return PageView(
      controller: controller,
      children: List.of(photos.map((photo) => _buildImage(photo)))
    );
  }

  Widget _buildImage(String photoUrl) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Center(
          child: CircularProgressIndicator()
        ),
        FadeInImage.memoryNetwork(
          fit: BoxFit.cover,
          placeholder: kTransparentImage,
          image: photoUrl
        )
      ],
    );
  }
}