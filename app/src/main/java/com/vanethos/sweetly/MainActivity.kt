package com.vanethos.sweetly

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.View
import androidx.appcompat.app.AppCompatActivity


class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun goToShop(v: View) {
        Log.d("TAG", "YAY");
        //val defaultFlutter = FlutterActivity.createDefaultIntent(this)
        val defaultFlutter = Intent(this, FlutterSweetActivity::class.java)
        startActivity(defaultFlutter)
    }
}
