package com.fueled.code_test_flutter

import android.os.Bundle
import android.os.Build
import androidx.core.view.WindowCompat
import androidx.core.splashscreen.SplashScreen.Companion.installSplashScreen
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {

        /** Handle the splash screen transition.
         * Do not remove installSplashScreen
         * as this is required for the splash
         * to show up properly
         */
        val splashScreen = installSplashScreen()

        // Aligns the Flutter view vertically with the window.
        WindowCompat.setDecorFitsSystemWindows(getWindow(), false)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            // Disable the Android splash screen fade out animation to avoid
            // a flicker before the similar frame is drawn in Flutter.
            splashScreen.setOnExitAnimationListener { splashScreenView -> splashScreenView.remove() }
        }

        super.onCreate(savedInstanceState)
    }
}
