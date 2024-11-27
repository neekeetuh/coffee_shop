package com.example.coffee_shop

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("7dd43329-2427-41e2-b1e6-df91fa244363")
        MapKitFactory.setLocale("ru_RU")
        super.configureFlutterEngine(flutterEngine)
    }
}
