package com.example.administrator.broadcast;

import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

/**
 * Created by Administrator on 2016/10/19.
 */
public class DynamicActivity extends AppCompatActivity {

    DynamicReceiver dynamicReceiver = new DynamicReceiver();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dynamic_layout);
        getSupportActionBar().hide();

        final Button register_unregister = (Button)findViewById(R.id.register_unregister);
        Button send = (Button)findViewById(R.id.send);
        final EditText editText = (EditText)findViewById(R.id.edit_text);

        register_unregister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (register_unregister.getTag().toString().equals("register")) {
                    IntentFilter dynamic_filter = new IntentFilter();
                    dynamic_filter.addAction("DYNAMICACTION");
                    registerReceiver(dynamicReceiver,dynamic_filter);
                    register_unregister.setTag("unregister");
                    register_unregister.setText("Unregister Broadcast");
                }
                else {
                    unregisterReceiver(dynamicReceiver);
                    register_unregister.setTag("register");
                    register_unregister.setText("Register Broadcast");
                }
            }
        });

        send.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(register_unregister.getTag().toString().equals("unregister")) {
                    Intent intent = new Intent("DYNAMICACTION");
                    Bundle bundle = new Bundle();
                    bundle.putString("msg", editText.getText().toString());
                    intent.putExtras(bundle);
                    sendBroadcast(intent);
                }
            }
        });

    }
}