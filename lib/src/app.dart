import 'package:cash_crop/toplevel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import '../constants/routes.dart';
import '../screens/authentication/utils.dart';
import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
        animation: settingsController,
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            scaffoldMessengerKey: Utils.messengerKey,
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            // restorationScopeId: 'app',
            debugShowCheckedModeBanner: false,
            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],
            navigatorKey: navigatorKey,
            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.lightGrey,
              textTheme: TextTheme(
                bodyText2: GoogleFonts.poppins(),
                headline2: GoogleFonts.cookie()
                    .copyWith(color: Colors.white, fontSize: 70),
              ),
              primaryColor: AppColors.primaryGreen,
              accentColor: AppColors.secondaryLime,
            ),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            // onGenerateRoute: (RouteSettings routeSettings) {
            //   return MaterialPageRoute<void>(
            //     settings: routeSettings,
            //     builder: (BuildContext context) {
            //       switch (routeSettings.name) {
            //         case SettingsView.routeName:
            //           return SettingsView(controller: settingsController);
            //         case SampleItemDetailsView.routeName:
            //           return const SampleItemDetailsView();
            //         case SampleItemListView.routeName:
            //         default:
            //           return const SampleItemListView();
            //       }
            //     },
            //   );
            // home: SplashScreen(),
            home: TopLevel(),

            //   getPages: [
            // GetPage(
            //   name: AppRoutes.loginRoute,
            //   page: () => const LoginScreen(),
            //   title: 'Login',
            // ),
            // GetPage(
            //   name: AppRoutes.signupRoute,
            //   page: () => const SignupScreen(),
            //   title: 'Signup',
            // ),
            // GetPage(
            //   name: AppRoutes.verifyEmailRoute,
            //   page: () => const VerifyEmailScreen(),
            //   title: 'Verify Email',
            // ),
            // GetPage(
            //   name: AppRoutes.homeScreenRoute,
            //   page: () => const HomeScreen(),
            //   title: 'Home Page',
            // ),
            // GetPage(
            //   name: AppRoutes.mainScreen,
            //   page: () => const MainScreen(),
            //   title: 'Main Page',
            // ),
            // GetPage(
            //     name: AppRoutes.splashScreen,
            //     page: () => const SplashScreen(),
            //     title: 'Splash Screen'),
            // GetPage(
            //     name: AppRoutes.cartScreen,
            //     page: () => const CartScreen(),
            //     title: 'Cart Screen'),
            // GetPage(
            //   name: AppRoutes.orderPage,
            //   page: () => const OrderPage(),
            //   title: 'Orders Page',
            // ),
            // GetPage(
            //   name: AppRoutes.detailsScreen,
            //   page: () => const DetailsPage(),
            //   title: 'Details Screen',
            // ),
            // // GetPage(
            // //   name: AppRoutes.postScreen,
            // //   page: () => const PostScreen(),
            // //   title: 'Post Screen',
            // // ),
            // GetPage(
            //     name: AppRoutes.favoriteScreen,
            //     page: () => const FavoriteScreen(),
            //     title: 'Favorites Screen'),
            // GetPage(
            //     name: AppRoutes.accountScreen,
            //     page: () => const AccountPage(),
            //     title: "accountScreen"),
            // GetPage(
            //   name: AppRoutes.editScreen,
            //   page: () => EditScreen(),
            //   title: "Edit Screen",
            // ),
            // // GetPage(
            // //   name: AppRoutes.settingsScreen,
            // //   page: () => const SettingsPage(),
            // //   title: 'Settings Page',
            // // ),
            //   },
            // );
          );
        });
  }
}
