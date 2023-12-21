import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:abs_customer_sites/core/init_dio.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/presentation/admin_panel/skeleton/skeleton_page_admin.dart';
import 'package:abs_customer_sites/presentation/core/initial_page/initial_page.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/skeleton_page/skeleton_page.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uni_links/uni_links.dart';

import 'data/core/shared-prefrences/shared_prefrences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDir = await getApplicationDocumentsDirectory();
  // Hydarted bloc for caching the state of forms used in the app.
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: appDir,
  );
  // Forcing device to be used in portraitmode
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Setting up dependency injection
  setUpGetIt();
  // Setting up shared prefrences for saving user prefrences
  await getIt<UserPreferences>().init();
  // Intializng Dio with custom option to be used throughout the app
  initDio();
  runApp(MyApp());
}

bool _initialUriIsHandled = false;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Uri _initialUri;
  Uri _latestUri;
  Object _err;
  StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    _handleIncomingLinks(); /*  background  */
    _handleInitialUri();  /*start */
  }

  void _handleIncomingLinks() {
    // It will handle app links while the app is already started - be it in
    // the foreground or in the background.
    _sub = uriLinkStream.listen((Uri uri) {
      if (!mounted) return;
      print('got uri: $uri');
      setState(() {
        _latestUri = uri;
        _err = null;
      });
    }, onError: (Object err) {
      if (!mounted) return;
      print('got err: $err');
      setState(() {
        _latestUri = null;
        if (err is FormatException) {
          _err = err;
        } else {
          _err = null;
        }
      });
    });
  }

  Future<void> _handleInitialUri() async {
    // In this example app this is an almost useless guard, but it is here to
    // show we are not going to call getInitialUri multiple times, even if this
    // was a weidget that will be disposed of (ex. a navigation route change).
    if (!_initialUriIsHandled) {
      _initialUriIsHandled = true;
      try {
        final uri = await getInitialUri();
        if (uri == null) {
          print('no initial uri');
        } else {
          print('got initial uri: $uri');
        }
        if (!mounted) return;
        setState(() => _initialUri = uri);
      } on PlatformException {
        // Platform messages may fail but we ignore the exception
        print('falied to get initial uri');
      } on FormatException catch (err) {
        if (!mounted) return;
        print('malformed initial uri');
        setState(() => _err = err);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'abs Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InitialPage(),
    );
  }
}
