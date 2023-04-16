import 'package:flutter/material.dart';
import 'package:omous/presentation/cards/destination_card.dart';
import 'package:omous/presentation/screens/destinations_detail_screen.dart';
import 'package:omous/utils/next_screen.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({super.key});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destinations'),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              nextScreen(
                  context,
                  DetailsPage(
                      tabData: null,
                      personData: null,
                      isCameFromPersonSection: true));
            },
            child: DestinationCard(
                title: 'Nisaa',
                cookTime: '123',
                rating: '123',
                thumbnailUrl: 'assets/images/nisa1.jpg'),
          );
        },
      ),
    );
  }
}
