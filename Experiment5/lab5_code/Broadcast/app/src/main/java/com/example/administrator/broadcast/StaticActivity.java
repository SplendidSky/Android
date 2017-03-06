package com.example.administrator.broadcast;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.SimpleAdapter;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/10/19.
 */
public class StaticActivity extends AppCompatActivity {

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.static_layout);
        getSupportActionBar().hide();

        List<Map<String, Object>> data = new ArrayList<>();
        final String[] fruitsName = new String[] {"Apple", "Banana", "Cherry", "Coco", "Kiwi",
                "Orange", "Pear", "Strawberry", "Watermelon"};
        final int[] fruitsImg = new int[] { R.mipmap.apple, R.mipmap.banana, R.mipmap.cherry,
                R.mipmap.coco, R.mipmap.kiwi, R.mipmap.orange, R.mipmap.pear,
                R.mipmap.strawberry, R.mipmap.watermelon };
        for (int i = 0; i < fruitsName.length; i++) {
            Map<String, Object> temp = new LinkedHashMap<>();
            temp.put("name", fruitsName[i]);
            temp.put("image", fruitsImg[i]);
            data.add(temp);
        }

        ListView fruit_list = (ListView)findViewById(R.id.fruit_list);
        SimpleAdapter simpleAdapter = new SimpleAdapter(this, data, R.layout.item,
                new String[] {"name", "image"},
                new int[] {R.id.fruit_name, R.id.fruit_img});
        fruit_list.setAdapter(simpleAdapter);

        fruit_list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Intent intent = new Intent("STATICACTION");
                Bundle bundle = new Bundle();
                bundle.putString("fruit_name", fruitsName[i]);
                bundle.putInt("fruit_img", fruitsImg[i]);
                intent.putExtras(bundle);
                sendBroadcast(intent);
            }
        });


    }
}
