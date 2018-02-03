package com.example.patrickkorianski.adma_tut1;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class WordSelect extends AppCompatActivity {

    Button button;
    EditText inputField;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_word_select);

        // Initializing variables and Buttons
        button = (Button) findViewById(R.id.finishedButton);
        inputField = (EditText) findViewById(R.id.userTF);

        // Getting user input
        final Intent i = new Intent(WordSelect.this, FinishedSentence.class);

        //Going to display final sentence
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String name = inputField.getText().toString();
                i.putExtra("MY_INPUT", name);
                startActivity(i);
            }
        });

    }
}
