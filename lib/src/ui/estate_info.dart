import 'package:flutter/material.dart';
import 'package:real_estate_app/src/models/estate_model.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                      '${model.address.district}, улица ${model.address.street}',
                      ),
                    ),
                    Text(
                      '${model.roomCount}-к квартира, цена ${model.price} рублей',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 8.0),

                    RaisedButton(
                      onPressed: () => launch("tel://${model.phone}"),
                      color: Colors.green,
                      child: Text(
                        model.phone,
                        style: TextStyle(fontSize: 20.0, color: Colors.black),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)
                      ),
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
