package com.example.administrator.sharedpreferences;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.view.StandaloneActionMode;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringReader;

/**
 * Created by Administrator on 2016/11/9.
 */
public class FileEditorActivity extends AppCompatActivity {
    Button save;
    Button load;
    Button clear;
    EditText notes;
    Toast toast;
    String FILE_NAME = "NOTES";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_file_editor);

        save = (Button)findViewById(R.id.save);
        load = (Button)findViewById(R.id.load);
        clear = (Button)findViewById(R.id.editor_clear);
        notes = (EditText)findViewById(R.id.notes);
        toast = Toast.makeText(FileEditorActivity.this, "", Toast.LENGTH_SHORT);

        save.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try (FileOutputStream fileOutputStream = openFileOutput(FILE_NAME, MODE_PRIVATE)) {
                    fileOutputStream.write(notes.getText().toString().getBytes());
                    toast.setText("Save successfully.");
                    toast.show();
                } catch (IOException ex) {
                    Log.e("TAG", "Fail to save file.");
                    toast.setText("Fail to save file");
                    toast.show();
                }
            }
        });

        load.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try (FileInputStream fileInputStream = openFileInput(FILE_NAME)) {
                    byte[] note = new byte[fileInputStream.available()];
                    fileInputStream.read(note);
                    notes.setText(new String(note));
                    toast.setText("Load successfully.");
                    toast.show();
                }
                catch (IOException ex) {
                    Log.e("TAG", "Fail to read file.");
                    toast.setText("Fail to load file.");
                    toast.show();
                }
            }
        });

        clear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                notes.setText("");
            }
        });
    }
}
