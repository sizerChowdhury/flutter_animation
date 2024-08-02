import 'package:animation/details_page.dart';
import 'package:animation/models/trip_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripList extends StatefulWidget {
  const TripList({super.key});

  @override
  State<TripList> createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  List<TripModel> tripList = [];
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _addTrips();
  }

  void _addTrips() {
    List<TripModel> trips = [
      TripModel(
        title: 'Beach Paradise',
        price: '350',
        night: '3',
        image: 'beach.png',
      ),
      TripModel(
        title: 'City Break',
        price: '400',
        night: '5',
        image: 'city.png',
      ),
      TripModel(
        title: 'Ski Adventure',
        price: '750',
        night: '2',
        image: 'ski.png',
      ),
      TripModel(
        title: 'Space Blast',
        price: '600',
        night: '4',
        image: 'space.png',
      ),
    ];
    trips.forEach((TripModel trip) {
      tripList.add(trip);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: _listKey,
      itemCount: tripList.length,
      itemBuilder: (context, index) {
        return _buildTile(tripList[index]);
      },
    );
  }

  Widget _buildTile(TripModel value) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              tripModel: value,
            ),
          ),
        );
      },
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _tripHeadline(value),
          _subHeadline(value),
        ],
      ),
      leading: _leadingImage(value),
      trailing: Text('\$${value.price}'),
    );
  }

  _tripHeadline(TripModel value) {
    return Text(
      '${value.night} nights',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.blue[300],
      ),
    );
  }

  _subHeadline(TripModel value) {
    return Text(
      value.title,
      style: TextStyle(
        fontSize: 20,
        color: Colors.grey[600],
      ),
    );
  }

  _leadingImage(TripModel value) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        'images/${value.image}',
        height: 50.0,
      ),
    );
  }
}
