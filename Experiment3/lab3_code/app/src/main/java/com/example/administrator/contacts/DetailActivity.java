package com.example.administrator.contacts;

import android.content.Intent;
import android.graphics.Color;
import android.media.Image;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class DetailActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.details);

        Contact contact = (Contact)getIntent().getParcelableExtra("contact");

        TextView name = (TextView)findViewById(R.id.name);
        TextView phone_number = (TextView)findViewById(R.id.phone_number);
        TextView attribution = (TextView)findViewById(R.id.attribution);
        TextView background = (TextView)findViewById(R.id.background);
        ImageView goback = (ImageView)findViewById(R.id.goback);
        ImageView message = (ImageView)findViewById(R.id.message);
        ImageView message_divider = (ImageView)findViewById(R.id.message_divider);
        ListView operationList = (ListView)findViewById(R.id.operations);
        final ImageView star = (ImageView)findViewById(R.id.star);

        assert goback != null;
        assert name != null;
        assert phone_number != null;
        assert attribution != null;
        assert background != null;
        assert message_divider != null;
        assert message != null;
        assert star != null;

        name.setText(contact.getName());
        phone_number.setText(contact.getPhone_number());
        attribution.setText("手机 " + contact.getAttribution());
        background.setBackgroundColor((Color.parseColor('#' + contact.getBackground_color())));

        goback.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

        star.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (star.getTag().toString().equals("0")) {
                    star.setBackground(getDrawable(R.mipmap.full_star));
                    star.setTag(1);
                }
                else {
                    star.setBackground(getDrawable(R.mipmap.empty_star));
                    star.setTag(0);
                }
            }
        });

        String[] operations = new String[] {"编辑联系人", "分享联系人", "加入黑名单", "删除联系人"};
        List<Map<String, Object>> data = new ArrayList<>();
        for (int i = 0; i < operations.length; i ++) {
            Map<String, Object> temp = new LinkedHashMap<>();
            temp.put("operation", operations[i]);
            data.add(temp);
        }
        SimpleAdapter simpleAdapter = new SimpleAdapter(this, data, R.layout.operations, new String[] {"operation"}, new int[] {R.id.operation});
        operationList.setAdapter(simpleAdapter);

    }
}
