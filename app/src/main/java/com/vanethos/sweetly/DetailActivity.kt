package com.vanethos.sweetly

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.activity_detail.*

class DetailActivity : AppCompatActivity() {
    lateinit var name : String
    lateinit var country : String
    lateinit var image : String


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_detail)
        val intent = intent;
        name = intent.getStringExtra("name")
        country = intent.getStringExtra("country")
        image = intent.getStringExtra("image")
        title = "A Sweet Treat!"
        nameView.text = name
        countryView.text = country
        Picasso.get().load(image).resize(200,200).centerCrop().into(imageView);
    }

}
