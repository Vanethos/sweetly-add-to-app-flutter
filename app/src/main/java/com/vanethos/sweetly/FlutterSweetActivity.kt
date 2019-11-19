package com.vanethos.sweetly

import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache


class FlutterSweetActivity : FlutterActivity() {
    override fun provideFlutterEngine(context: Context): FlutterEngine? {
        return  FlutterEngineCache.getInstance().get(ENGINE_ID)!!
    }
}