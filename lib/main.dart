import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/fbt.gif'), // GIF
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('images/img.jpg'),
                  radius: 70.0,
                ),
                const Text(
                  'Mondero, John Clark L.',
                  style: TextStyle(
                    fontFamily: 'Oswald', // Use Oswald font
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 350.0,
                  child: Divider(
                    thickness: 3.0,
                    color: Colors.redAccent,
                  ),
                ),
                const Text(
                  'BS in Computer Engineering',
                  style: TextStyle(
                    fontFamily: 'Oswald', // Use Oswald font
                    fontSize: 22.0,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 200.0,
                  child: Divider(
                    thickness: 1.0,
                    color: Colors.redAccent,
                  ),
                ),
                const Text(
                  'CPE-31',
                  style: TextStyle(
                    fontFamily: 'Oswald', // Use Oswald font
                    fontSize: 22.0,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 200.0,
                  child: Divider(
                    thickness: 1.0,
                    color: Colors.redAccent,
                  ),
                ),
                const Text(
                  '20 yrs old',
                  style: TextStyle(
                    fontFamily: 'Oswald', // Use Oswald font
                    fontSize: 22.0,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 200.0,
                  child: Divider(
                    thickness: 1.0,
                    color: Colors.redAccent,
                  ),
                ),
                CustomButton(
                  icon: Icons.facebook,
                  text: 'Facebook Link',
                  url: 'https://www.facebook.com/share/fKipshAev85tHNEZ/?mibextid=LQQJ4d',
                ),
                CustomButton(
                  icon: Icons.camera_alt_outlined,
                  text: 'Instagram Link',
                  url: 'https://www.instagram.com/clarky.mndr/',
                ),
                CustomButton(
                  icon: Icons.video_library_outlined,
                  text: 'YouTube Link',
                  url: 'https://www.youtube.com/@clarky4170',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final String url;

  const CustomButton({
    required this.icon,
    required this.text,
    required this.url,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.redAccent),
              const SizedBox(width: 15),
              Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Oswald', // Use Oswald font here too
                  fontSize: 22.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
