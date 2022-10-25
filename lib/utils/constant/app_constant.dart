import 'package:dfzagency/dfz.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> page = [
  {
    'page':  const UtamaPage(),
    'title': 'Home',
  },
  {
    'page':  ServicePage(),
    'title': 'Services',
  },
  {
    'page':  QrScanPage(),
    'title': 'Scan',
  },
  {
    // 'page': const OurCarePage(),
    'page':  const NotificationPage(),
    'title': 'Notification',
  },
  {
    'page':  const ProfilPage(),
    'title': 'Profile',
  }
];
