package com.example.administrator.mapsensor;

import android.Manifest;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ToggleButton;

import com.baidu.mapapi.SDKInitializer;
import com.baidu.mapapi.map.BaiduMap;
import com.baidu.mapapi.map.BitmapDescriptor;
import com.baidu.mapapi.map.BitmapDescriptorFactory;
import com.baidu.mapapi.map.MapStatus;
import com.baidu.mapapi.map.MapStatusUpdate;
import com.baidu.mapapi.map.MapStatusUpdateFactory;
import com.baidu.mapapi.map.MyLocationConfiguration;
import com.baidu.mapapi.map.MyLocationData;
import com.baidu.mapapi.map.TextureMapView;
import com.baidu.mapapi.model.LatLng;
import com.baidu.mapapi.utils.CoordinateConverter;

public class MainActivity extends AppCompatActivity {

    final int SENSOR_SHAKE = 0;
    boolean SHAKING = false;

    TextureMapView mMapView = null;
    SensorManager mSensorManager = null;
    Sensor mMagneticSensor = null;
    Sensor mAccelerometerSensor = null;
    LocationManager mLocationManager = null;
    Location mCurrentLocation = null;
    ToggleButton mToggleButton = null;
    CoordinateConverter mConverter = null;
    String provider = null;
    float mCurrentDirection = 0;

    Handler mHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            switch (msg.what) {
                case SENSOR_SHAKE:
                    if (!SHAKING) {
                        SHAKING = true;
                        AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
                        builder.setTitle("BUG反馈")
                                .setMessage("发送邮件给开发者")
                                .setPositiveButton("是", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialogInterface, int i) {
                                        Intent data = new Intent(Intent.ACTION_SENDTO);
                                        data.setData(Uri.parse("mailto:530415489@qq.com"));
                                        data.putExtra(Intent.EXTRA_SUBJECT, "MapSensor BUG反馈");
                                        data.putExtra(Intent.EXTRA_TEXT, "我在使用 MapSensor 的时候遇到了 BUG");
                                        startActivity(Intent.createChooser(data, "发送邮件"));
                                        SHAKING = false;
                                    }
                                })
                                .setNegativeButton("否", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialogInterface, int i) {
                                        SHAKING = false;
                                    }
                                }).create().show();
                    }
                    break;
            }
        }

    };

    LocationListener mLocationListener = new LocationListener() {
        @Override
        public void onLocationChanged(Location location) {
            mCurrentLocation = location;
            mConverter.from(CoordinateConverter.CoordType.GPS);
            mConverter.coord(new LatLng(mCurrentLocation.getLatitude(),
                    mCurrentLocation.getLongitude()));
            LatLng desLatLng = mConverter.convert();
            MyLocationData.Builder data = new MyLocationData.Builder();
            data.latitude(desLatLng.latitude);
            data.longitude(desLatLng.longitude);
            data.direction(mCurrentDirection);
            mMapView.getMap().setMyLocationData(data.build());
            MapStatus mMapStatus = new MapStatus.Builder().target(desLatLng).build();
            MapStatusUpdate mMapStatusUpdate = MapStatusUpdateFactory.newMapStatus(mMapStatus);
            mMapView.getMap().setMapStatus(mMapStatusUpdate);
            mToggleButton.setChecked(true);
        }

        @Override
        public void onStatusChanged(String s, int i, Bundle bundle) {

        }

        @Override
        public void onProviderEnabled(String s) {
        }

        @Override
        public void onProviderDisabled(String s) {

        }
    };

    SensorEventListener mSensorEventListener = new SensorEventListener() {

        float[] accValues = null;
        float[] magValues = null;

        @Override
        public void onSensorChanged(SensorEvent sensorEvent) {
            switch (sensorEvent.sensor.getType()) {
                case Sensor.TYPE_ACCELEROMETER:
                    accValues = sensorEvent.values;
                    float x = accValues[0];
                    float y = accValues[1];
                    float z = accValues[2];
                    int medumValue = 19;
                    if (Math.abs(x) > medumValue || Math.abs(y) > medumValue || Math.abs(z) > medumValue) {
                        Message message = new Message();
                        message.what = SENSOR_SHAKE;
                        mHandler.sendMessage(message);
                    }
                    break;
                case Sensor.TYPE_MAGNETIC_FIELD:
                    magValues = sensorEvent.values;
                    break;
                default:
                    break;
            }

            float[] R = new float[9];
            float[] values = new float[3];

            if (accValues != null && magValues != null) {
                SensorManager.getRotationMatrix(R, null, accValues, magValues);
                SensorManager.getOrientation(R, values);

                mConverter.from(CoordinateConverter.CoordType.GPS);
                mConverter.coord(new LatLng(mCurrentLocation.getLatitude(), mCurrentLocation.getLongitude()));
                LatLng desLatLng = mConverter.convert();
                MyLocationData.Builder data = new MyLocationData.Builder();
                data.latitude(desLatLng.latitude);
                data.longitude(desLatLng.longitude);
                float direction = (float) Math.toDegrees(values[0]) + 180;
                data.direction(direction);
                mMapView.getMap().setMyLocationData(data.build());

                mCurrentDirection = direction;
            }
        }

        @Override
        public void onAccuracyChanged(Sensor sensor, int i) {
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SDKInitializer.initialize(getApplicationContext());
        setContentView(R.layout.activity_main);

        mMapView = (TextureMapView) findViewById(R.id.bmapView);
        mSensorManager = (SensorManager) getSystemService(SENSOR_SERVICE);
        mMagneticSensor = mSensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD);
        mAccelerometerSensor = mSensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        mLocationManager = (LocationManager) getSystemService(LOCATION_SERVICE);
        mToggleButton = (ToggleButton) findViewById(R.id.tb_center);
        mConverter = new CoordinateConverter();

        Criteria criteria = new Criteria();
        criteria.setAccuracy(Criteria.ACCURACY_FINE);
        criteria.setAltitudeRequired(false);
        criteria.setBearingRequired(false);
        criteria.setCostAllowed(true);

        provider = mLocationManager.getBestProvider(criteria, true);

        mLocationManager.requestLocationUpdates(provider, 0, 0, mLocationListener);

        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION)
                != PackageManager.PERMISSION_GRANTED &&
                ActivityCompat.checkSelfPermission(this,
                        Manifest.permission.ACCESS_COARSE_LOCATION)
                        != PackageManager.PERMISSION_GRANTED) {
            // TODO: Consider calling
            //    ActivityCompat#requestPermissions
            // here to request the missing permissions, and then overriding
            //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
            //                                          int[] grantResults)
            // to handle the case where the user grants the permission. See the documentation
            // for ActivityCompat#requestPermissions for more details.
            return;
        }
        mCurrentLocation = mLocationManager.getLastKnownLocation(provider);

        Bitmap bitmap = Bitmap.createScaledBitmap(BitmapFactory.decodeResource(getResources(),
                R.mipmap.pointer), 100, 100, true);
        BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromBitmap(bitmap);

        mMapView.getMap().setMyLocationEnabled(true);
        MyLocationConfiguration configuration = new MyLocationConfiguration(
                MyLocationConfiguration.LocationMode.NORMAL, true, bitmapDescriptor);
        mMapView.getMap().setMyLocationConfigeration(configuration);

        if (mCurrentLocation != null) {
            mConverter.from(CoordinateConverter.CoordType.GPS);
            mConverter.coord(new LatLng(mCurrentLocation.getLatitude(), mCurrentLocation.getLongitude()));
            LatLng desLatLng = mConverter.convert();
            MyLocationData.Builder data = new MyLocationData.Builder();
            data.latitude(desLatLng.latitude);
            data.longitude(desLatLng.longitude);
            data.direction(mCurrentDirection);
            mMapView.getMap().setMyLocationData(data.build());
            MapStatus mMapStatus = new MapStatus.Builder().target(desLatLng).build();
            MapStatusUpdate mMapStatusUpdate = MapStatusUpdateFactory.newMapStatus(mMapStatus);
            mMapView.getMap().setMapStatus(mMapStatusUpdate);
        }

        mMapView.getMap().setOnMapTouchListener(new BaiduMap.OnMapTouchListener() {
            @Override
            public void onTouch(MotionEvent motionEvent) {
                switch (motionEvent.getAction()) {
                    case MotionEvent.ACTION_MOVE:
                        mToggleButton.setChecked(false);
                        break;
                    default:
                        break;
                }
            }
        });

        mToggleButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (mToggleButton.isChecked()) {
                    mConverter.from(CoordinateConverter.CoordType.GPS);
                    mConverter.coord(new LatLng(mCurrentLocation.getLatitude(),
                            mCurrentLocation.getLongitude()));
                    LatLng desLatLng = mConverter.convert();
                    MapStatus mMapStatus = new MapStatus.Builder().target(desLatLng).build();
                    MapStatusUpdate mMapStatusUpdate = MapStatusUpdateFactory.newMapStatus(mMapStatus);
                    mMapView.getMap().setMapStatus(mMapStatusUpdate);
                }
            }
        });
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        //在activity执行onDestroy时执行mMapView.onDestroy()，实现地图生命周期管理
        mMapView.onDestroy();
    }

    @Override
    protected void onResume() {
        super.onResume();
        //在activity执行onResume时执行mMapView. onResume ()，实现地图生命周期管理
        mMapView.onResume();

        mSensorManager.registerListener(mSensorEventListener, mMagneticSensor,
                SensorManager.SENSOR_DELAY_GAME);
        mSensorManager.registerListener(mSensorEventListener, mAccelerometerSensor,
                SensorManager.SENSOR_DELAY_GAME);
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION)
                != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this,
                Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            // TODO: Consider calling
            //    ActivityCompat#requestPermissions
            // here to request the missing permissions, and then overriding
            //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
            //                                          int[] grantResults)
            // to handle the case where the user grants the permission. See the documentation
            // for ActivityCompat#requestPermissions for more details.
            return;
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        //在activity执行onPause时执行mMapView. onPause ()，实现地图生命周期管理
        mMapView.onPause();

        mSensorManager.unregisterListener(mSensorEventListener);
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION)
                != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this,
                Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            // TODO: Consider calling
            //    ActivityCompat#requestPermissions
            // here to request the missing permissions, and then overriding
            //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
            //                                          int[] grantResults)
            // to handle the case where the user grants the permission. See the documentation
            // for ActivityCompat#requestPermissions for more details.
            return;
        }
        mLocationManager.removeUpdates(mLocationListener);
    }
}
