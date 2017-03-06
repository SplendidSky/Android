package com.example.administrator.firstclass;

import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.Snackbar;
import android.support.design.widget.TextInputEditText;
import android.support.design.widget.TextInputLayout;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
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

        login_btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                TextInputLayout username_til = (TextInputLayout)findViewById(R.id.more_username);
                TextInputLayout password_til = (TextInputLayout)findViewById(R.id.more_password);
                username_til.setErrorEnabled(false);
                password_til.setErrorEnabled(false);
                //assert username_til != null;
                String username =  username_til.getEditText().getText().toString();
                //assert username_til != null;
                String password =  password_til.getEditText().getText().toString();
                final Toast toast = Toast.makeText(MainActivity.this, "", Toast.LENGTH_SHORT);

                if (username.isEmpty()) {
                    username_til.setError("用户名不能为空");
                    username_til.setErrorEnabled(true);
                }
                else if (password.isEmpty()) {

                    password_til.setError("密码不能为空");
                    password_til.setErrorEnabled(true);

                }
                else if (username.equals("Android") && password.equals("123456")) {
                    View rootView = ((ViewGroup)findViewById(android.R.id.content)).getChildAt(0);
                    Snackbar snackbar = Snackbar.make(rootView, "登录成功", Snackbar.LENGTH_SHORT);
                    snackbar.setAction("按钮", new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            toast.setText("Snackbar的按钮被点击了");
                            toast.show();
                        }
                    })
                            .setActionTextColor(getResources().getColor(R.color.colorPrimary))
                            .show();
                    // 将提示文本的颜色改为白色
                    View view = snackbar.getView();
                    ((TextView) view.findViewById(R.id.snackbar_text)).setTextColor(getResources().getColor(R.color.primary_white));
                }
                else {
                    View rootView = ((ViewGroup)findViewById(android.R.id.content)).getChildAt(0);
                    Snackbar snackbar = Snackbar.make(rootView, "登录失败", Snackbar.LENGTH_SHORT);
                    snackbar.setAction("按钮", new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            toast.setText("Snackbar的按钮被点击了");
                            toast.show();
                        }
                    })
                            .setActionTextColor(getResources().getColor(R.color.colorPrimary))
                            .show();
                    // 将提示文本的颜色改为白色
                    View view = snackbar.getView();
                    ((TextView) view.findViewById(R.id.snackbar_text)).setTextColor(getResources().getColor(R.color.primary_white));
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
