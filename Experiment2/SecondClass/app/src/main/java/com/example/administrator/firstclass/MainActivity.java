package com.example.administrator.firstclass;

import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

/**
 * Created by Administrator on 2016/9/14.
 */
public class MainActivity extends AppCompatActivity{
    @Override
    protected void onCreate(@Nullable Bundle saveInstanceState) {
        super.onCreate(saveInstanceState);
        setContentView(R.layout.layout);

        Button login_btn = (Button)findViewById(R.id.login_btn);
        Button register_btn = (Button)findViewById(R.id.register_btn);
        final RadioGroup radioGroup = (RadioGroup)findViewById(R.id.radioGroup);


        assert login_btn != null;
        assert register_btn != null;
        assert radioGroup != null;

        final AlertDialog.Builder alertDialog = new AlertDialog.Builder(this);
        alertDialog.setTitle("提示").setPositiveButton("确认", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        Toast.makeText(getApplicationContext(), "对话框\"确定\"按钮被点击", Toast.LENGTH_SHORT).show();
                    }
                }).setNegativeButton("取消", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                Toast.makeText(getApplicationContext(),"对话框\"取消\"按钮被点击", Toast.LENGTH_SHORT).show();
            }
        }).create();

        login_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText username_et = (EditText)findViewById(R.id.username_et);
                EditText password_et = (EditText)findViewById(R.id.password_et);
                assert username_et != null;
                String username = username_et.getText().toString();
                assert password_et != null;
                String password = password_et.getText().toString();
                Toast toast = Toast.makeText(MainActivity.this, "", Toast.LENGTH_SHORT);

                if (TextUtils.isEmpty(username)) {
                    toast.setText("用户名不能为空");
                    toast.show();
                }
                else if (TextUtils.isEmpty(password)) {
                    toast.setText("密码不能为空");
                    toast.show();
                }
                else if (username.equals("Android") && password.equals("123456")) {
                    alertDialog.setMessage("登录成功");
                    alertDialog.show();
                }
                else {
                    alertDialog.setMessage("登录失败");
                    alertDialog.show();
                }
            }
        });

        register_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int checked_btn_id = radioGroup.getCheckedRadioButtonId();
                RadioButton checked_btn = (RadioButton)findViewById(checked_btn_id);
                Toast.makeText(MainActivity.this, checked_btn.getText().toString() + "身份注册功能尚未开启", Toast.LENGTH_SHORT).show();
            }
        });

        radioGroup.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup group, int checkedId) {
                RadioButton checked_btn = (RadioButton)findViewById(checkedId);
                Toast.makeText(MainActivity.this, checked_btn.getText().toString() + "身份被选中", Toast.LENGTH_SHORT).show();
            }
        });

    }
}
