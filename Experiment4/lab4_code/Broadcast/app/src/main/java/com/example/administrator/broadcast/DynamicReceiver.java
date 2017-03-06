package com.example.administrator.broadcast;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.graphics.BitmapFactory;
import android.os.Bundle;

/**
 * Created by Administrator on 2016/10/19.
 */
public class DynamicReceiver extends BroadcastReceiver{
    @Override
    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("DYNAMICACTION")) {
            Bundle bundle = intent.getExtras();

            NotificationManager manager = (NotificationManager) context
                    .getSystemService(Context.NOTIFICATION_SERVICE);
            Notification.Builder builder = new Notification.Builder(context);

            builder.setContentTitle("动态广播")
                    .setContentText(bundle.getString("msg"))
                    .setLargeIcon(BitmapFactory.decodeResource(context.getResources(), R.mipmap.dynamic))
                    .setSmallIcon(R.mipmap.dynamic);

            Intent mIntent = new Intent(context, MainActivity.class);
            PendingIntent mPendingIntent = PendingIntent.getActivity(context, 0, mIntent, 0);
            builder.setContentIntent(mPendingIntent);
            Notification notification = builder.build();
            manager.notify(0, notification);
        }
    }
}
