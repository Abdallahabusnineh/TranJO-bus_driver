import 'package:flutter/material.dart';

class AboutUsContent extends StatelessWidget {
  const AboutUsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(10, 80, 0, 0),
                  child: Text('About Us',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'Montserrat'),))
            ],
          ),
          SizedBox(height: 5),
          Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0,0),
              child: Text('Welcome to TransJo, your go-to solution for convenient and efficient bus tracking. we are passionate about enhancing your commuting experience through innovative technology.',style: TextStyle(fontSize: 20),)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  'Our Mission',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
            child: Text('Our mission is to revolutionize the way you navigate public transportation. We strive to provide reliable and real-time bus tracking services that empower you to plan your journeys with confidence and ease.',),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  'What We Offer?',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
            child: Text('Real-Time Tracking: Stay informed about the exact location and arrival times of buses in your area.',),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
            child: Text(' User-Friendly Interface: Our intuitive app makes it simple to navigate and access the information you need, right at your fingertips.',),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
            child: Text('Privacy and Security: We prioritize the privacy and security of your data, employing stringent measures to safeguard your information.',),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  'Our Team',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
            child: Text('Behind TransJo is a dedicated team of professionals committed to delivering a seamless and enjoyable user experience. From developers to customer support, our team works tirelessly to meet your needs and exceed your expectations.',),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  'Get in Touch',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
            child: Text('We value your feedback and are here to assist you every step of the way. Have a question, suggestion, or just want to say hello? Don\'t hesitate to reach out to us at "abusninehabdallah@gmail.com".Thank you for choosing TransJo for your commuting needs. We look forward to serving you!',),
          ),
          SizedBox(height: 80,)
        ],
      ),
    );
  }
}
