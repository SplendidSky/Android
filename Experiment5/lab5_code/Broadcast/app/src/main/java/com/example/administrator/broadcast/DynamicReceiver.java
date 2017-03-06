package com.example.administrator.broadcast;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.widget.RemoteViews;

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

            AppWidgetManager mgr = AppWidgetManager.getInstance(context);
            RemoteViews rv = new RemoteViews(context.getPackageName(), R.layout.widget);
            rv.setImageViewResource(R.id.widget_img, R.mipmap.dynamic);
            rv.setTextViewText(R.id.wiget_text, bundle.getString("msg"));
            mgr.updateAppWidget(new ComponentName(context, Widget.class), rv);
        }
    }
}
