import 'package:flutter/material.dart';
import 'package:pixelarticons/pixel.dart';
import 'package:seriousgame/z_globals/z8_font_manager.dart';

/// Tabbar widget for the bag overlay
TabBar getTabBar() {
  return const TabBar(
    labelColor: Colors.white38,
    labelStyle: TextStyle(
      fontSize: 8,
      fontFamily: FontFamily.pixelSansSerif,
    ),
    tabs: [
      Tab(
        icon: Icon(
          Pixel.addbox,
        ),
        text: "outils",
      ),
      Tab(
          icon: Icon(
            Pixel.calendarcheck,
          ),
          text: "calendrier"),
      Tab(
          icon: Icon(
            Pixel.bookopen,
          ),
          text: "scénarios"),
      Tab(
          icon: Icon(
            Pixel.contact,
          ),
          text: "contacts"),
      Tab(
        icon: Icon(
          Pixel.cart,
        ),
        text: "badges",
      )
    ],
  );
}
