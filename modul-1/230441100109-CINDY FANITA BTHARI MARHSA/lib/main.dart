import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ======================= APP ROOT =======================

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/list': (context) => ListScreen(),
        '/detail': (context) => DetailScreen(),
      },
    );
  }
}

// ======================= HOME SCREEN =======================

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hi, User 👋',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  CircleAvatar(
                    radius: 24,
                    backgroundImage:
                        AssetImage('assets/images/Ellipse 1.png'),
                  ),
                ],
              ),
              SizedBox(height: 32),

              // HOT PLACES
              _buildSectionTitle(context, 'Hot Places'),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) => PlaceCard(
                    title: 'National Park Yosemite',
                    description: 'California',
                    isHorizontal: true,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // BEST HOTELS
              _buildSectionTitle(context, 'Best Hotels'),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => PlaceCard(
                    title: 'National Park Yosemite',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, doloribus. Eos, accusantium doloremque! Tenetur, sed.',
                    isHorizontal: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/list');
          },
          child: Text('See All', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}

// ======================= PLACE CARD =======================

class PlaceCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isHorizontal;

  const PlaceCard({
    required this.title,
    required this.description,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/detail'),
      child: Container(
        width: isHorizontal ? 260 : double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: isHorizontal
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/Rectangle 4.png',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          description,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/Rectangle 3.png',
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                // Batasin lebar teks biar gak ngulur
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        description,
                        style: TextStyle(fontSize: 13),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }
}

// ======================= DUMMY LIST SCREEN =======================

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Places'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => PlaceCard(
            title: 'National Park Yosemite',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, doloribus. Eos, accusantium doloremque! Tenetur, sed.',
            isHorizontal: false,
          ),
        ),
      ),
    );
  }
}

// ======================= DUMMY DETAIL SCREEN =======================

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'National Park Yosemite',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/Rectangle 4 (1).png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Lorem ipsum est donec non interdum amet phasellus egestas id dignissim in vestibulum augue ut a lectus rhoncus sed ullamcorper at vestibulum sed mus neque amet turpis placerat in luctus at eget egestas praesent congue semper in facilisis purus dis pharetra odio ullamcorper euismod a donec consectetur pellentesque pretium sapien proin tincidunt non augue turpis massa euismod quis lorem et feugiat ornare id cras sed eget adipiscing dolor urna mi sit a a auctor mattis urna fermentum facilisi sed aliquet odio at suspendisse posuere tellus pellentesque id quis libero fames blandit ullamcorper interdum eget placerat tortor cras nulla consectetur et duis viverra mattis libero scelerisque gravida egestas blandit tincidunt ullamcorper auctor aliquam leo urna adipiscing est ut ipsum consectetur id erat semper fames elementum rhoncus quis varius pellentesque quam neque vitae sit velit leo massa habitant tellus velit pellentesque cursus laoreet donec etiam id vulputate nisi integer eget gravida volutpat.',
              style: TextStyle(fontSize: 14, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

