import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:couldai_user_app/attraction_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Attraction> attractions = [
    Attraction(
      name: 'Gardaland',
      description: 'Il parco divertimenti numero uno in Italia.',
      imageUrl:
          'https://www.bigliettilandia.it/wp-content/uploads/2023/03/Gardaland-Park-biglietti-%20scontati.webp',
    ),
    Attraction(
      name: 'Mirabilandia',
      description: 'Vivi il divertimento nel cuore della Romagna.',
      imageUrl:
          'https://www.bigliettilandia.it/wp-content/uploads/2023/03/mirabilandia-biglietti-scontati.webp',
    ),
    Attraction(
      name: 'Disneyland Paris',
      description: 'La magia Disney ti aspetta a Parigi.',
      imageUrl:
          'https://www.bigliettilandia.it/wp-content/uploads/2023/04/disneyland-paris-biglietti.webp',
    ),
    Attraction(
      name: 'Leolandia',
      description: 'Il parco a tema per bambini vicino a Bergamo.',
      imageUrl:
          'https://www.bigliettilandia.it/wp-content/uploads/2023/03/leolandia-biglietti-scontati.webp',
    ),
    Attraction(
      name: 'Zoomarine',
      description: 'Un mondo di avventure tra delfini e leoni marini.',
      imageUrl:
          'https://www.bigliettilandia.it/wp-content/uploads/2023/03/zoomarine-biglietti-scontati.webp',
    ),
    Attraction(
      name: 'Cinecittà World',
      description: 'Il parco divertimenti del cinema e della TV a Roma.',
      imageUrl:
          'https://www.bigliettilandia.it/wp-content/uploads/2023/03/cinecitta-world-biglietti-scontati.webp',
    ),
    Attraction(
      name: 'Acquario di Genova',
      description: 'Scopri le meraviglie del mondo marino.',
      imageUrl:
          'https://www.bigliettilandia.it/wp-content/uploads/2023/03/acquario-genova-biglietti-scontati.webp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bigliettilandia Attrazioni'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: attractions.length,
        itemBuilder: (context, index) {
          final attraction = attractions[index];
          return Card(
            margin: const EdgeInsets.all(10.0),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CachedNetworkImage(
                  imageUrl: attraction.imageUrl,
                  height: 200,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        attraction.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        attraction.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
