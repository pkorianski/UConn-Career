package com.example.patrickkorianski.adma_madlibs;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class EasyLibFinal extends AppCompatActivity {

    TextView composed;
    Button home;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_easy_lib_final);
        Toast.makeText(getApplicationContext(), "Congrats! You made an Easy Lib!", Toast.LENGTH_LONG).show();

        composed = (TextView) findViewById(R.id.finalSentence);
        home = (Button) findViewById(R.id.homeButton);


        // Completing the sentence
        String sentence = composed.getText().toString()
                .replace("__________(1)", getIntent().getExtras().getString("Name"))
                .replace("__________(2)", getIntent().getExtras().getString("Noun"));
        composed.setText(sentence);

        // Going back home
        final Intent intent = new Intent(EasyLibFinal.this, MainMenu.class);
        home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(intent);
            }
        });





    }
}
