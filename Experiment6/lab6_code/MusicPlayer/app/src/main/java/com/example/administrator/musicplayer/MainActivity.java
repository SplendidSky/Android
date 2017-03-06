package com.example.administrator.musicplayer;

import android.annotation.TargetApi;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.icu.text.SimpleDateFormat;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.SeekBar;
import android.widget.TextView;

import org.w3c.dom.Text;

@TargetApi(Build.VERSION_CODES.N)
public class MainActivity extends AppCompatActivity {

    private MusicService musicService;
    private Button play_pause;
    private Button stop;
    private Button quit;
    private SeekBar progress;
    private ImageView photo;
    private TextView begin;
    private TextView end;
    private TextView state;
    private SimpleDateFormat time;
    private boolean flag = false;

    private Handler mHandle = new Handler();
    private Runnable mRunnable = new Runnable() {
        @Override
        public void run() {
            try {
                if (MusicService.mp.isPlaying())
                    photo.setRotation(photo.getRotation() + 1);
                progress.setProgress(MusicService.mp.getCurrentPosition());
                progress.setMax(MusicService.mp.getDuration());
                begin.setText(time.format(MusicService.mp.getCurrentPosition()));
                end.setText(time.format(MusicService.mp.getDuration()));
                mHandle.postDelayed(mRunnable, 50);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    };


    private ServiceConnection sc = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            musicService = ((MusicService.MyBinder) iBinder).getService();
        }

        @Override
        public void onServiceDisconnected(ComponentName componentName) {
            musicService = null;
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        time = new SimpleDateFormat("mm:ss");
        play_pause = (Button) findViewById(R.id.play_pause);
        stop = (Button) findViewById(R.id.stop);
        quit = (Button) findViewById(R.id.quit);
        progress = (SeekBar) findViewById(R.id.progress);
        photo = (ImageView) findViewById(R.id.photo);
        begin = (TextView) findViewById(R.id.begin);
        end = (TextView) findViewById(R.id.end);
        state = (TextView) findViewById(R.id.state);


        Intent intent = new Intent(this, MusicService.class);
        bindService(intent, sc, BIND_AUTO_CREATE);

        mHandle.post(mRunnable);

        play_pause.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (play_pause.getText().equals("PLAY")) {
                    musicService.play_pause();
                    play_pause.setText("PAUSE");
                    state.setText("PLAYING");
                } else {
                    musicService.play_pause();
                    play_pause.setText("PLAY");
                    state.setText("PAUSED");
                }

            }
        });

        stop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                musicService.stop();
                play_pause.setText("PLAY");
                state.setText("STOPPED");
            }
        });

        quit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                mHandle.removeCallbacks(mRunnable);
                unbindService(sc);
                finish();
            }
        });


        progress.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int i, boolean b) {
                if (flag == true)
                    MusicService.mp.seekTo(i);
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
                flag = true;
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                flag = false;
            }
        });

    }


}
