import 'package:flutter/material.dart';
import 'package:real_estate_app/src/models/estate_model.dart';
import 'package:transparent_image/transparent_image.dart';

class EstateInfoWidget extends StatelessWidget {

  final EstateModel model;

  EstateInfoWidget(this.model);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Real estate info"),
      ),
        resizeToAvoidBottomPadding: false,
        body: _buildEstateCard(context, model)
    );
  }


  Widget _buildEstateCard(BuildContext context, EstateModel model) {
    return Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),

        child:  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              Container(
                height: 300.0,
                child:
                _buildPageController(model.photos),
              ),
              Container(
                margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 8.0)),
                    Text(
                      '${model.address.district}, улица ${model.address.street}',
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 8.0)),

                    Text(
                      '${model.roomCount}-к квартира, цена ${model.price} рублей',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child:Text(model.description),
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
