package com.example.patrickkorianski.adma_madlibs;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MedLibSelection extends AppCompatActivity {

    Button mButton;
    TextView w1, w2, w3, w4;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_med_lib_selection);

        // Initializing variables
        mButton = (Button) findViewById(R.id.medComposeButton);
        final Intent i = new Intent(MedLibSelection.this, MedLibFinal.class);
        w1 = (TextView) findViewById(R.id.w1ET);
        w2 = (TextView) findViewById(R.id.w2ET);
        w3 = (TextView) findViewById(R.id.w3ET);
        w4 = (TextView) findViewById(R.id.w4ET);

        mButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String x1 = w1.getText().toString();
                String x2 = w2.getText().toString();
                String x3 = w3.getText().toString();
                String x4 = w4.getText().toString();
                i.putExtra("Word1", x1);
                i.putExtra("Word2", x2);
                i.putExtra("Word3", x3);
                i.putExtra("Word4", x4);
                startActivity(i);
            }
        });

    }
}
