import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fade',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Barber> barbers = [
    Barber(
      name: 'Fade BarberShop',
      imageUrl: 'assets/images/barber2.jpg',
      description: 'Berpengalaman 10 Tahun dalam bidang',
    ),
    Barber(
      name: 'Awal Agung',
      imageUrl: 'assets/images/barber1.jpg',
      description: 'Berpengalaman 10 Tahun dalam bidang.',
    ),
    Barber(
      name: 'Mike Johnson',
      imageUrl: 'assets/images/barber3.jpg',
      description: 'Expert in classic cuts and shaves.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barbershop App'),
      ),
      body: ListView.builder(
        itemCount: barbers.length,
        itemBuilder: (context, index) {
          final barber = barbers[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(barber.imageUrl),
              ),
              title: Text(barber.name),
              subtitle: Text(barber.description),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BarberDetailPage(barber: barber),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Barber {
  final String name;
  final String imageUrl;
  final String description;

  Barber({
    required this.name,
    required this.imageUrl,
    required this.description,
  });
}

class BarberDetailPage extends StatelessWidget {
  final Barber barber;

  BarberDetailPage({required this.barber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(barber.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(barber.imageUrl),
            ),
            SizedBox(height: 16),
            Text(
              barber.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8),
            Text(
              barber.description,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
