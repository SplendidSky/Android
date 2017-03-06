package com.example.administrator.birthdaymemo;

import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.provider.ContactsContract;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.ListViewCompat;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class MainActivity extends AppCompatActivity {

    Button add;
    ListView item_list;
    TextView name;
    EditText birth;
    EditText gift;
    TextView num;
    List<Item> items;
    ItemsAdapter itemsAdapter;
    private static final String DB_NAME = "BirthdayMemo";
    private static final String TABLE_NAME = "Items";
    private static final int DB_VERSION = 1;
    myDB db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        add = (Button) findViewById(R.id.add_item);
        item_list = (ListView) findViewById(R.id.items);


        db = new myDB(getApplicationContext(), DB_NAME, null, DB_VERSION);
        items = db.queryAll();

        if (items != null) {
            itemsAdapter = new ItemsAdapter(getApplicationContext(), items);
            item_list.setAdapter(itemsAdapter);
        }

        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, addActivity.class);
                startActivity(intent);
            }
        });

        item_list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, final int ii, long l) {
                LayoutInflater factory = LayoutInflater.from(MainActivity.this);
                View view1 = factory.inflate(R.layout.dialoglayout, null);
                AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
                builder.setView(view1);

                name = (TextView) view1.findViewById(R.id.update_name);
                birth = (EditText) view1.findViewById(R.id.update_birth);
                gift = (EditText) view1.findViewById(R.id.update_gift);
                num = (TextView) view1.findViewById(R.id.update_number);

                name.setText(items.get(ii).getName());
                birth.setText(items.get(ii).getBirth());
                gift.setText(items.get(ii).getGift());

                Cursor c = getContentResolver().query(
                        ContactsContract.CommonDataKinds.Phone.CONTENT_URI, null,
                        ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME + "=\""
                                + name.getText().toString() + '"', null, null);
                String number = new String();
                while (c != null && c.moveToNext()) {
                    number += c.getString(c.getColumnIndex(
                            ContactsContract.CommonDataKinds.Phone.NUMBER)) + " ";
                }
                num.setText(number);
                c.close();

                builder.setPositiveButton("确认修改", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        db.update(new Item(items.get(ii).getId(), name.getText().toString(),
                                birth.getText().toString(), gift.getText().toString()));
                        items.get(ii).setName(name.getText().toString());
                        items.get(ii).setBirth(birth.getText().toString());
                        items.get(ii).setGift(gift.getText().toString());
                        itemsAdapter.notifyDataSetChanged();
                    }
                }).setNegativeButton("放弃修改", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {

                    }
                }).create().show();
            }
        });

        item_list.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> adapterView, View view, final int ii, long l) {
                AlertDialog.Builder deleteAlert = new AlertDialog.Builder(MainActivity.this);
                deleteAlert.setMessage("是否删除?")
                        .setPositiveButton("是", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialogInterface, int i) {
                                db.delete(items.get(ii).getId());
                                items.remove(ii);
                                itemsAdapter.notifyDataSetChanged();
                            }
                        }).setNegativeButton("否", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {

                    }
                }).create().show();
                return true;
            }
        });

    }
}
