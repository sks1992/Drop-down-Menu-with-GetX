import 'package:eskool/core/constants.dart';
import 'package:eskool/ui/widgets/app_bar.dart';
import 'package:eskool/ui/widgets/description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../colors.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarView(title: "Contact Us"),
        backgroundColor: colorWhite,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Card(
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.asset("assets/rfis_contact_logo.png", fit: BoxFit.cover, width: 150,),
                    const SizedBox(height: 8),
                    const DescriptionText("Sy No. 417, Rampally (V)", fontSize: 12,),
                    const SizedBox(height: 2),
                    const DescriptionText("Keesara (M), Hyderabad.", fontSize: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const DescriptionText("+91-8688822222,", fontSize: 12,),
                          ),
                          onTap: () async => {
                            await _launchURL("tel:+918688822222"),
                          },
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const DescriptionText("+91-8125011235", fontSize: 12,),
                          ),
                          onTap: () async => {
                            await _launchURL("tel:+918125011235"),
                          },
                        ),
                      ],
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0,right: 8,bottom: 8, left: 8),
                        child: const DescriptionText("info@reqelfordinternationalschool.com", fontSize: 12,),
                      ),
                      onTap: () async => {
                        await _launchURL("mailto:info@reqelfordinternationalschool.com"),
                      },
                    ),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.asset("assets/play_contact_logo.png", fit: BoxFit.cover, width: 100,),
                    const SizedBox(height: 8),
                    const DescriptionText("Mahendra Hills"),
                    const SizedBox(height: 2),
                    const DescriptionText("H No. 259, Road No. 1,", fontSize: 12,),
                    const SizedBox(height: 2),
                    DescriptionText("Mahendra Hills, Secunderabad-500026.", fontSize: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const DescriptionText("+91-40-27734282,", fontSize: 12,),
                          ),
                          onTap: () async => {
                            await _launchURL("tel:04027734282"),
                          },
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const DescriptionText("+91-7093322649", fontSize: 12,),
                          ),
                          onTap: () async => {
                            await _launchURL("tel:+917093322649"),
                          },
                        ),

                      ],
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0,right: 8,bottom: 8, left: 8),
                        child: const DescriptionText("reqelplay@reqelfordinternationalschool.com", fontSize: 12,),
                      ),
                      onTap: () async => {
                        await _launchURL("mailto:reqelplay@reqelfordinternationalschool.com"),
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.asset("assets/play_contact_logo.png", fit: BoxFit.cover, width: 100,),
                    const SizedBox(height: 8),
                    const DescriptionText("Habsiguda"),
                    const SizedBox(height: 2),
                    DescriptionText("H No. 1-2-41/1, Street no. 3,", fontSize: 12,),
                    const SizedBox(height: 2),
                    DescriptionText("Kakatiya Nagar, Habsiguda,", fontSize: 12,),
                    const SizedBox(height: 2),
                    DescriptionText("Hyderabad - 500007.", fontSize: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const DescriptionText("+91-40-27151122,", fontSize: 12,),
                          ),
                          onTap: () async => {
                            await _launchURL("tel:04027151122"),
                          },
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const DescriptionText("+91-9177722522", fontSize: 12,),
                          ),
                          onTap: () async => {
                            await _launchURL("tel:+919177722522"),
                          },
                        ),
                      ],
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0,right: 8,bottom: 8, left: 8),
                        child: const DescriptionText("habsiguda@reqelfordinternationalschool.com", fontSize: 12,),
                      ),
                      onTap: () async => {
                        await _launchURL("mailto:habsiguda@reqelfordinternationalschool.com"),
                      },
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

  Future _launchURL(String url) async => await canLaunch(url)
      ? await launch(url)
      : Constants.showToast("Couldn't launch. Please try with manual options.");
}
