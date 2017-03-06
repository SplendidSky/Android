package com.example.administrator.contacts;

import android.content.DialogInterface;
import android.content.Intent;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        String[] names = new String[] { "Aaron", "Elvis", "David", "Edwin", "Frank", "Joshua", "Ivan", "Mark", "Joseph", "Phoebe"};
        String[] phone_numbers = new String[] { "17715523654", "18825653224", "15052116654", "18854211875", "13955188541", "13621574410", "15684122771", "17765213579", "13315466578", "17895466428"};
        String[] attributions = new String[] {"江苏苏州电信", "广东揭阳移动", "江苏无锡移动", "山东青岛移动", "安徽合肥移动", "江苏苏州移动", "山东烟台联通", "广东珠海电信", "河北石家庄电信", "山东东营移动"};
        String[] background_colors = new String[] {"BB4C3B", "c48d30", "4469b0", "20A17B"};

        final List<Contact> contactList = new ArrayList<>();

        for (int i = 0; i < 10; i++) {
            contactList.add(new Contact(names[i], phone_numbers[i], attributions[i], background_colors[i % 4]));
        }

        ListView listView = (ListView) findViewById(R.id.contacts_list);
        final ContactsAdapter contactsAdapter = new ContactsAdapter(getApplicationContext(), contactList);
        listView.setAdapter(contactsAdapter);

        final AlertDialog.Builder deleteAlert = new AlertDialog.Builder(this);
        deleteAlert.setTitle("删除联系人");

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent = new Intent(MainActivity.this, DetailActivity.class);
                Bundle bundle = new Bundle();
                bundle.putParcelable("contact", contactList.get(position));
                intent.putExtras(bundle);
                startActivity(intent);
            }
        });

        listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> parent, View view, final int position, long id) {
                deleteAlert.setMessage("确认删除联系人" + contactList.get(position).getName() + "?")
                .setPositiveButton("确认", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        contactList.remove(position);
                        contactsAdapter.notifyDataSetChanged();
                    }
                }).setNegativeButton("取消", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                    }
                }).create().show();
                return true;
            }
        });
    }
}
