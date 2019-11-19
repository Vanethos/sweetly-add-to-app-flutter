package com.vanethos.sweetly

import android.os.Bundle
import android.util.Log
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterActivity


class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun goToShop(v: View) {
        Log.d("TAG", "YAY");
        val defaultFlutter = FlutterActivity.createDefaultIntent(this)
        startActivity(defaultFlutter)
    }
}
