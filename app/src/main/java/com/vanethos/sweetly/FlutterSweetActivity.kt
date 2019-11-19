package com.vanethos.sweetly

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.plugin.common.MethodChannel


class FlutterSweetActivity : FlutterActivity() {
    override fun provideFlutterEngine(context: Context): FlutterEngine? {
        val engine = FlutterEngineCache.getInstance().get(ENGINE_ID)!!
        MethodChannel(
            engine.dartExecutor,
            "com.vanethos.sweetly/flutter"
        ).setMethodCallHandler { call, _ ->
            when (call.method) {
                "goToDetail" -> {
                    startActivity(Intent(this, DetailActivity::class.java))
                }
            }
        }

        return engine
    }
}