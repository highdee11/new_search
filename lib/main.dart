import 'package:flutter/material.dart';
import 'package:newsapp/core/config/light_theme_config.dart';
import 'package:newsapp/core/services/notification_service.dart';
import 'package:newsapp/features/news_search/screens/content_search_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          navigatorKey: NotificationService.navState,
          title: 'News App',
          theme: ThemeConfig.lightTheme,
          home: ContentSearchScreen(),
          debugShowCheckedModeBanner: false,
        );
      }
    );
  }
}
