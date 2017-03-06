package com.example.administrator.broadcast;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.graphics.BitmapFactory;
import android.media.Image;
import android.os.Bundle;

/**
 * Created by Administrator on 2016/10/19.
 */
public class StaticReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        Bundle bundle = intent.getExtras();

        NotificationManager manager = (NotificationManager) context
                .getSystemService(Context.NOTIFICATION_SERVICE);
        Notification.Builder builder = new Notification.Builder(context);

        builder.setContentTitle("静态广播")
                .setContentText(bundle.getCharSequence("fruit_name"))
                .setLargeIcon(BitmapFactory.decodeResource(context.getResources(),
                        bundle.getInt("fruit_img")))
                .setSmallIcon(bundle.getInt("fruit_img"));

        Intent mIntent = new Intent(context, MainActivity.class);
        PendingIntent mPendingIntent = PendingIntent.getActivity(context, 0, mIntent, 0);
        builder.setContentIntent(mPendingIntent);
        Notification notification = builder.build();
        manager.notify(0, notification);
    }
}
