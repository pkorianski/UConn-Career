package com.example.patrickkorianski.adma_madlibs;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainMenu extends AppCompatActivity {

    Button easy, med, hard, instruct;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_menu);

        // Main Menu Buttons
        easy = (Button) findViewById(R.id.easyLibButton);
        med = (Button) findViewById(R.id.medLibButton);
        hard = (Button) findViewById(R.id.hardLibButton);
        instruct = (Button) findViewById(R.id.instructButton);

        // Intent for Easy Lib
        final Intent intE = new Intent(MainMenu.this, EasyLibActivity.class);
        easy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(intE);
            }
        });

        // Intent for Med Lib
        final Intent intM = new Intent(MainMenu.this, MedLibActivity.class);
        med.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(intM);
            }
        });


        // Intent for Hard Lib
        final Intent intH = new Intent(MainMenu.this, HardLibActivity.class);
        hard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(intH);
            }
        });


        // Intent for Instruct Lib
        final Intent intI = new Intent(MainMenu.this, InstructLibActivity.class);
        instruct.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(intI);
            }
        });





    }
}
