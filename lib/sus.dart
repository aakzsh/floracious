import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Sus extends StatefulWidget {
  @override
  _SusState createState() => _SusState();
}

class _SusState extends State<Sus> {
  static String ytId = "0Y0Z13egaYU";

  //initialize youtube
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: ytId,
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 80.0, 10.0, 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Title(
                  color: Colors.greenAccent,
                  child: Text(
                    '5 Tips for sustainable Gardening',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 15.0,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
                  child: Column(
                    children: [
                      Text(
                        '1. Practice Organic Gardening ',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Going organic is an important part of sustainable gardening. Using fewer chemicals in your garden is more ecologically sound.',
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ],
                  ),
                ),
                elevation: 4,
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
                  child: Column(
                    children: [
                      Text(
                        '2. Mulch Your Landscape ',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Not only is mulching a great way to prevent weeds from springing up in your garden, but it also helps hold moisture in the soil. In areas with watering restrictions, this is especially important. Add a 2 to 3-inch layer of the mulch of your choice to your garden beds and around landscape plants. ',
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ],
                  ),
                ),
                elevation: 4,
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
                  child: Column(
                    children: [
                      Text(
                        '3. Plant Natives ',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        ' Sustainable plants are those that are indigenous to your region, also called natives. These plants take less work, usually require less water, and thrive better than other perennials because they are already suited to your climate, rainfall, and soil types. ',
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ],
                  ),
                ),
                elevation: 4,
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
                  child: Column(
                    children: [
                      Text(
                        '4. Lose Your Lawn',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'A gorgeous, green, and weed-free lawn uses a lot of resources. Water and fertilizer are needed to keep most lawns looking in top shape. You can have more sustainable landscaping by reducing the area planted in grass and replacing it with easy-care perennial ornamental grasses, low-growing shrubs, or groundcovers.',
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ],
                  ),
                ),
                elevation: 4,
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
                  child: Column(
                    children: [
                      Text(
                        '5. Water Less ',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Using less water is an important element of sustainability, especially in areas where water is scarce and restricted. Xeriscaping, a method of gardening and landscaping that reduces the need for watering, incorporates a wide variety of attractive drought-tolerant shrubs and perennials. ',
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ],
                  ),
                ),
                elevation: 4,
              ),
              SizedBox(
                height: 20.0,
              ),
              YoutubePlayer(
                controller: _controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
