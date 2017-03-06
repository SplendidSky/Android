package com.example.administrator.weatherbroadcast;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Handler;
import android.os.Message;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.Toast;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class MainActivity extends AppCompatActivity {

    private static final String url = "http://ws.webxml.com.cn/WebServices/WeatherWS.asmx/getWeather";
    private static final String userId = "e5d1a1cae75a4eb39cc1feac47c1a4ba";
    private Button search;
    private EditText keywords;
    private Toast toast;
    private TextView city_name;
    private TextView update_time;
    private TextView ugly_temperature;
    private TextView ugly_temperature_range;
    private TextView humidity;
    private TextView air_quality;
    private TextView wind;
    private ListView index;
    private static final int UPDATE_CONTENT = 0;
    private static final int QUERY_ERROR = 1;
    private RecyclerView recyclerView;
    private LinearLayout ugly_layout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        search = (Button)findViewById(R.id.search);
        keywords = (EditText)findViewById(R.id.keywords);
        recyclerView = (RecyclerView) findViewById(R.id.weather_horizontal);
        city_name = (TextView)findViewById(R.id.city);
        update_time = (TextView)findViewById(R.id.update_time);
        ugly_temperature = (TextView)findViewById(R.id.ugly_temperature);
        ugly_temperature_range = (TextView)findViewById(R.id.ugly_temperature_range);
        humidity = (TextView)findViewById(R.id.humidity);
        air_quality = (TextView)findViewById(R.id.air_quality);
        wind = (TextView)findViewById(R.id.wind);
        index = (ListView)findViewById(R.id.index);
        ugly_layout = (LinearLayout)findViewById(R.id.ugly_layout);

        LinearLayoutManager layoutManager = new LinearLayoutManager(getApplicationContext());
        layoutManager.setOrientation(LinearLayoutManager.HORIZONTAL);
        recyclerView.setLayoutManager(layoutManager);

        search.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                ConnectivityManager connectivityManager = (ConnectivityManager) getApplicationContext()
                        .getSystemService(CONNECTIVITY_SERVICE);
                NetworkInfo networkInfo = connectivityManager.getActiveNetworkInfo();
                if (!networkInfo.isAvailable()) {
                    toast = Toast.makeText(getApplicationContext(), "当前没有可用网络！", Toast.LENGTH_SHORT);
                    toast.show();
                }
                else {
                    sendRequestWithHttpURLConnection();
                }
            }
        });

    }

    private void sendRequestWithHttpURLConnection() {
        new Thread(new Runnable() {
            @Override
            public void run() {
                String city = keywords.getText().toString();
                HttpURLConnection connection = null;
                try {
                    Log.i("key", "Begin the connection");
                    connection = (HttpURLConnection) ((new URL(url.toString()).openConnection()));
                    connection.setRequestMethod("POST");
                    connection.setReadTimeout(8000);
                    connection.setConnectTimeout(8000);
                    DataOutputStream outputStream = new DataOutputStream(connection.getOutputStream());
                    Log.i("key", city);
                    String request = URLEncoder.encode(city, "utf-8");
                    outputStream.writeBytes("theCityCode=" + request + "&theUserID=" + userId);

                    connection.connect();

                    InputStream inputStream = connection.getInputStream();
                    BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
                    StringBuilder respone = new StringBuilder();
                    String line;

                    while ((line = reader.readLine()) != null)
                        respone.append(line);

                    Log.i("key", respone.toString());
                    List<String> strings = parseXMLWithPull(respone.toString());
                    for (int i = 0; i < strings.size(); i++) {
                        if (strings.get(i).contains("查询结果为空") || strings.get(i).contains("发现错误")) {
                            Message message = new Message();
                            message.what = QUERY_ERROR;
                            message.obj = strings.get(i);
                            handler.sendMessage(message);
                            return;
                        }
                    }

                    Message message = new Message();
                    message.what = UPDATE_CONTENT;
                    message.obj = strings;
                    handler.sendMessage(message);
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
                finally {
                    if (connection != null)
                        connection.disconnect();
                }
            }
        }).start();
    }

    private Handler handler = new Handler() {
        public void handleMessage(Message message) {
            switch (message.what) {
                case UPDATE_CONTENT:
                    List<String> strings = (List<String>)message.obj;
                    city_name.setText(strings.get(1));
                    update_time.setText(strings.get(3).split(" ")[1]);
                    ugly_temperature.setText(strings.get(4).split("；")[0].substring(7));
                    ugly_temperature_range.setText(strings.get(8));
                    humidity.setText(strings.get(4).split("；")[2]);
                    wind.setText(strings.get(4).split("；")[1]);
                    air_quality.setText(strings.get(5).split("。")[1]);
                    ugly_layout.setBackgroundColor(getResources().getColor(R.color.colorAccent));

                    String[] items = strings.get(6).split("。");
                    String[] index_type = { "紫外线指数", "感冒指数", "穿衣指数",
                            "洗车指数", "运动指数", "空气污染指数" };
                    List<String> index_details = new ArrayList<>();
                    for (int i = 0; i < items.length; i++) {
                        index_details.add(items[i].split("：")[1]);
                    }

                    List<Map<String, Object>> data = new ArrayList<>();
                    for (int i = 0; i < index_type.length; i++) {
                        Map<String, Object> temp = new LinkedHashMap<>();
                        temp.put("index_type", index_type[i]);
                        temp.put("index_details", index_details.get(i));
                        data.add(temp);
                    }
                    SimpleAdapter simpleAdapter = new SimpleAdapter(getApplicationContext(),
                            data, R.layout.index_item,
                            new String[] {"index_type", "index_details"},
                            new int[] {R.id.index_type, R.id.index_details});
                    index.setAdapter(simpleAdapter);

                    List<Weather> weatherList = new ArrayList<>();
                    for (int i = 0; i < 5; i++) {
                        Weather weather = new Weather();
                        String date = strings.get(7 + i * 5).split(" ")[0];
                        String weather_description = strings.get(7 + i * 5).split(" ")[1];
                        String temperature = strings.get(8 + i * 5);
                        weather.setDate(date);
                        weather.setWeather_description(weather_description);
                        weather.setTemperature(temperature);
                        weatherList.add(weather);
                    }
                    WeatherAdapter weatherAdapter = new WeatherAdapter(MainActivity.this, weatherList);
                    recyclerView.setAdapter(weatherAdapter);
                    break;
                case QUERY_ERROR:
                    toast = Toast.makeText(getApplicationContext(),(String)message.obj, Toast.LENGTH_SHORT);
                    toast.show();
                default:
                    break;
            }
        }
    };

    private List<String> parseXMLWithPull(String xml) {
        List<String> list = new ArrayList<>();
        try {
            XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
            XmlPullParser parser = factory.newPullParser();
            parser.setInput(new StringReader(xml));

            int eventType = parser.getEventType();
            while (eventType != XmlPullParser.END_DOCUMENT) {
                switch (eventType) {
                    case XmlPullParser.START_TAG:
                        if ("string".equals(parser.getName())) {
                            String str = parser.nextText();
                            list.add(str);
                        }
                    case XmlPullParser.END_TAG:
                        break;
                    default:
                        break;
                }
                eventType = parser.next();
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
