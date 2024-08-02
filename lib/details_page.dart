import 'package:animation/models/trip_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final TripModel trip;

  const DetailsPage({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
                child: Hero(
              tag: trip.image,
              child: Image.asset(
                'images/${trip.image}',
                height: 360,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            )),
            const SizedBox(height: 30),
            ListTile(
              title: Text(trip.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[800])),
              subtitle: Text(
                  '${trip.night} night stay for only \$${trip.price}',
                  style: const TextStyle(letterSpacing: 1)),
              trailing: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.grey[400],
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(18),
                child: Text('Details about the product or hotel',
                    style: TextStyle(color: Colors.grey[600], height: 1.4))),
          ],
        ));
  }
}
