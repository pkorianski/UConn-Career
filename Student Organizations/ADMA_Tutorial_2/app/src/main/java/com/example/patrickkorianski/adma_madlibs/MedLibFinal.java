package com.example.patrickkorianski.adma_madlibs;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class MedLibFinal extends AppCompatActivity {

    Button medHome;
    TextView medSent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_med_lib_final);
        Toast.makeText(getApplicationContext(), "Congrats! You made an Medium Lib!", Toast.LENGTH_LONG).show();

        // Initialize variables
        medHome = (Button) findViewById(R.id.medHome);
        medSent = (TextView) findViewById(R.id.medSentTV);
        final Intent i = new Intent(MedLibFinal.this, MainMenu.class);

        // Retrieving previous inputed words
        String w1 = getIntent().getExtras().getString("Word1");
        String w2 = getIntent().getExtras().getString("Word2");
        String w3 = getIntent().getExtras().getString("Word3");
        String w4 = getIntent().getExtras().getString("Word4");

        String sentence = medSent.getText().toString()
                .replace("_________(1)", w1)
                .replace("___(2)", w2)
                .replace("_________(3)", w3)
                .replace("_________(4)", w4);

        medSent.setText(sentence);

        // Go Back Home
        medHome.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(i);
            }
        });





    }
}
