import 'package:cash_crop_version1/Screens/Account%20Screen/account.dart';
import 'package:cash_crop_version1/Screens/Edit%20Screen/edit_screen.dart';
import 'package:cash_crop_version1/Screens/FavouritesScreen/favourites.dart';
import 'package:cash_crop_version1/Screens/Home/splash_screen.dart';
//import 'package:cash_crop_version1/Screens/authentication/loginSignUp/login_siginin.dart';
//import 'package:cash_crop_version1/Screens/authentication/loginSignUp/login_siginin.dart';
import 'package:cash_crop_version1/constants/constants.dart';
import 'package:cash_crop_version1/screens/authentication/Signup/signup_screen.dart';
import 'package:cash_crop_version1/screens/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/CartScreen/cartscreen.dart';
import '../Screens/DetailsScreen/details_screen.dart';
import '../Screens/OrdersScreen/Orders.dart';
import '../Screens/PostScreen/post_screen.dart';
import '../constants/routes.dart';
import '../screens/authentication/Login/login.dart';
//import '../screens/authentication/loginSignUp/login_siginin.dart';
import '../screens/authentication/verify/verify_email.dart';
//import '../screens/authentication/loginSignUp/login_siginin.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.

    return GetMaterialApp(
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
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
          headline2:
              GoogleFonts.cookie().copyWith(color: Colors.white, fontSize: 70),
        ),
        primaryColor: AppColors.primaryGreen,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: AppColors.secondaryLime),
      ),
      // darkTheme: ThemeData.dark(),

      // Define a function to handle named routes in order to support
      // Flutter web url navigation and deep linking.

      home: const SplashScreen(),

      getPages: [
        GetPage(
          name: AppRoutes.loginRoute,
          page: () => const LoginScreen(),
          title: 'Login',
        ),
        GetPage(
          name: AppRoutes.signupRoute,
          page: () => const SignupScreen(),
          title: 'Signup',
        ),
        GetPage(
          name: AppRoutes.verifyEmailRoute,
          page: () => const VerifyEmailScreen(),
          title: 'Verify Email',
        ),
        GetPage(
          name: AppRoutes.homeScreenRoute,
          page: () => const HomePage(),
          title: 'Home Page',
        ),
        GetPage(
            name: AppRoutes.splashScreen,
            page: () => const SplashScreen(),
            title: 'Splash Screen'),
        GetPage(
            name: AppRoutes.cartScreen,
            page: () => const CartScreen(),
            title: 'Cart Screen'),
        GetPage(
          name: AppRoutes.orderPage,
          page: () => const OrderPage(),
          title: 'Orders Page',
        ),
        GetPage(
          name: AppRoutes.detailsScreen,
          page: () => const DetailsPage(),
          title: 'Details Screen',
        ),
        GetPage(
          name: AppRoutes.postScreen,
          page: () => const PostScreen(),
          title: 'Post Screen',
        ),
        GetPage(
            name: AppRoutes.favoriteScreen,
            page: () => FavoriteScreen(),
            title: 'Favorites Screen'),
        GetPage(
            name: AppRoutes.accountScreen,
            page: () => AccountPage(),
            title: "accountScreen"),
        GetPage(
          name: AppRoutes.editScreen,
          page: () => EditScreen(),
          title: "Edit Screen",
        ),
      ],
    );
  }
}
