package com.example.administrator.musicplayer;

import android.app.Notification;
import android.app.Service;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Binder;
import android.os.Handler;
import android.os.IBinder;
import android.support.annotation.Nullable;

/**
 * Created by Administrator on 2016/11/2.
 */
public class MusicService extends Service {
    public static MediaPlayer mp = new MediaPlayer();

    public MusicService() {
        try {
            mp.setDataSource("/data/K.Will-Melt.mp3");
            mp.prepare();
            mp.setLooping(true);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void play_pause() {
        if (mp.isPlaying())
            mp.pause();
        else
            mp.start();
    }

    public void stop() {
        mp.stop();
        try {
            mp.prepare();
            mp.seekTo(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public IBinder binder = new MyBinder();

    public class MyBinder extends Binder {
        MusicService getService() {
            return MusicService.this;
        }
    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return binder;
    }

    @Override
    public void onCreate() {
        super.onCreate();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        if (mp != null) {
            mp.stop();
            mp.reset();
        }
    }

}
