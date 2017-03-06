package com.example.administrator.sharedpreferences;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    LinearLayout linearLayout;
    EditText new_password;
    EditText confirm_password;
    Button ok;
    Button clear;
    Toast toast;
    SharedPreferences sharedPref;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        linearLayout = (LinearLayout)findViewById(R.id.layout);
        new_password = (EditText)findViewById(R.id.new_password);
        confirm_password = (EditText)findViewById(R.id.confirm_password);
        ok = (Button)findViewById(R.id.ok);
        clear = (Button)findViewById(R.id.clear);
        toast = Toast.makeText(MainActivity.this, "", Toast.LENGTH_SHORT);
        sharedPref = getApplicationContext().getSharedPreferences("MY_PREFERENCE", Context.MODE_PRIVATE);

        if (sharedPref.contains("PASSWORD")) {
            linearLayout.removeView(confirm_password);
            new_password.setHint("Password");
        }

        ok.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (!sharedPref.contains("PASSWORD")) {
                    if (new_password.getText().toString().isEmpty() || confirm_password.getText().toString().isEmpty()) {
                        toast.setText("Password can not be empty.");
                        toast.show();
                    } else if (!new_password.getText().toString().equals(confirm_password.getText().toString())) {
                        toast.setText("Password Mismatch.");
                        toast.show();
                    } else {
                        SharedPreferences.Editor editor = sharedPref.edit();
                        editor.putString("PASSWORD", new_password.getText().toString());
                        editor.commit();
                        Intent intent = new Intent(MainActivity.this, FileEditorActivity.class);
                        startActivity(intent);
                    }
                }
                else {
                    if (new_password.getText().toString().equals(sharedPref.getString("PASSWORD", null))) {
                        Intent intent = new Intent(MainActivity.this, FileEditorActivity.class);
                        startActivity(intent);
                    }
                    else {
                        toast.setText("Invalid Password.");
                        toast.show();
                    }
                }
            }
        });

        clear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new_password.setText("");
                if (!sharedPref.contains("PASSWORD"))
                    confirm_password.setText("");
            }
        });

    }
}
