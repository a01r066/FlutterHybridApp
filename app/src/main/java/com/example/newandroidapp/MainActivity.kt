package com.example.newandroidapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity;

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        launchVieZ()
//        startActivity(
//            FlutterActivity.createDefaultIntent(this)
//        )
    }

    private fun launchVieZ(){
        val myButton = findViewById<Button>(R.id.myButton)
        myButton.setOnClickListener {
//            Toast.makeText(this, "Launch VieZ", Toast.LENGTH_SHORT).show()
            startActivity(
                FlutterActivity.createDefaultIntent(this)
            )
        }
    }
}