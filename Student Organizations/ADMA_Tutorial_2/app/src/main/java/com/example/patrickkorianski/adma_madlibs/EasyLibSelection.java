package com.example.patrickkorianski.adma_madlibs;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import org.w3c.dom.Text;

public class EasyLibSelection extends AppCompatActivity {

    Button comp;
    TextView name, noun;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_easy_lib_selection);

        //Creating buttons
        name = (TextView) findViewById(R.id.nameTF);
        noun = (TextView) findViewById(R.id.nounTF);
        comp = (Button) findViewById(R.id.composeButton);

        //Go to Composed Sentence
        final Intent intent = new Intent(EasyLibSelection.this, EasyLibFinal.class);
        comp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String nam = name.getText().toString();
                String non = noun.getText().toString();
                intent.putExtra("Name", nam);
                intent.putExtra("Noun", non);
                startActivity(intent);
            }
        });


    }
}
