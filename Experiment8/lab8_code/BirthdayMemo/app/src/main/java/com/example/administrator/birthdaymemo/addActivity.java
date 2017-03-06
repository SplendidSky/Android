package com.example.administrator.birthdaymemo;

import android.content.Intent;
import android.os.Bundle;
import android.renderscript.Script;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

/**
 * Created by Administrator on 2016/11/16.
 */

public class addActivity extends AppCompatActivity {

    Button add;
    EditText name;
    EditText birth;
    EditText gift;
    myDB db;
    Toast toast;

    private static final String DB_NAME = "BirthdayMemo";
    private static final String TABLE_NAME = "Items";
    private static final int DB_VERSION = 1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.new_info);

        add = (Button) findViewById(R.id.add_add);
        name = (EditText) findViewById(R.id.add_name);
        birth = (EditText) findViewById(R.id.add_birth);
        gift = (EditText) findViewById(R.id.add_gift);
        toast = Toast.makeText(getApplicationContext(), "", Toast.LENGTH_SHORT);

        db = new myDB(getApplicationContext(), DB_NAME, null, DB_VERSION);

        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (name.getText().toString().isEmpty()) {
                    toast.setText("名字为空，请完善");
                    toast.show();
                }
                else {
                    boolean success = db.insert(new Item(name.getText().toString(),
                            birth.getText().toString(), gift.getText().toString()));
                    if (success) {
                        Intent intent = new Intent(addActivity.this, MainActivity.class);
                        startActivity(intent);
                    }
                    else {
                        toast.setText("名字重复啦，请核查");
                        toast.show();
                    }
                }
            }
        });


    }
}