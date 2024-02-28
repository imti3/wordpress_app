import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '/config/config.dart';

class DeveloperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ডেভেলপার',style: TextStyle(fontFamily: 'Manrope',fontWeight: FontWeight.bold,fontSize: 18),),
        centerTitle: true,

      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(Config.dev),
            ),


            SizedBox(height: 20),
            Text(
              'মোঃ ইমতিয়াজুল ইসলাম',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'যোগাযোগ করুন',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.red[300]),
            ),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialLinkButton(
                      icon: Icons.facebook,
                      onPressed: () {
                        _launchURL('https://www.facebook.com/imtiajulislam2');
                      },
                    ),
                    SocialLinkButton(
                      icon: Icons.phone,
                      onPressed: () {
                        _launchURL('tel:+8801819511469');
                        },
                    ),
                    SocialLinkButton(
                      icon: Icons.email,
                      onPressed: () {
                        _launchURL('mailto:faar5489@gmail.com');
                      },
                    ),
                    SocialLinkButton(
                      icon: (FontAwesome.whatsapp),
                      onPressed: () {
                        _launchURL('https://wa.me/+8801819511469');
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'বিস্তারিত:',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'আসসালামুআলাইকুম আমি মোঃ ইমতিয়াজুল ইসলাম । আমি একজন কম্পিউটার ইঞ্জিনিয়ার এবং প্রোগ্রামিং নিয়ে কাজ করতে ভালোবাসি। আমার জন্মস্থান ফেনী জেলা। এপসে কোন প্রকার সমস্যা বা কোন ফিচার স্বম্মন্ধে জানাতে চাইলে আমাকে জানান। ',
                      style: TextStyle(fontSize: 14,fontFamily: 'Manrope'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}



class SocialLinkButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SocialLinkButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: 30,
      color: Color(0xff364ab3),
    );
  }
}