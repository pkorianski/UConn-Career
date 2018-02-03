package com.example.patrickkorianski.adma_madlibs;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MedLibActivity extends AppCompatActivity {

    Button but;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_med_lib);

        // Button and Variables
        but = (Button) findViewById(R.id.medEnterButton);
        final Intent i = new Intent(MedLibActivity.this, MedLibSelection.class);


        but.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(i);
            }
        });
    }
}
