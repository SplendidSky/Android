package com.example.administrator.broadcast;

import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.RemoteViews;

/**
 * Created by Administrator on 2016/10/26.
 */
public class Widget extends AppWidgetProvider {

    @Override
    public void onUpdate(Context context, AppWidgetManager appWidgetManager, int[] appWidgetIds) {
        super.onUpdate(context, appWidgetManager, appWidgetIds);
        RemoteViews rv = new RemoteViews(context.getPackageName(), R.layout.widget);
        Intent clickInt = new Intent(context, MainActivity.class);
        PendingIntent pi = PendingIntent.getActivity(context, 0, clickInt, 0);
        rv.setOnClickPendingIntent(R.id.widget_img, pi);
        appWidgetManager.updateAppWidget(appWidgetIds, rv);
    }

    @Override
    public void onReceive(Context context, Intent intent) {
        AppWidgetManager mgr = AppWidgetManager.getInstance(context);
        RemoteViews rv = new RemoteViews(context.getPackageName(), R.layout.widget);
        Bundle bundle = intent.getExtras();

        if (intent.getAction().equals("STATICACTION")) {
            rv.setImageViewResource(R.id.widget_img, bundle.getInt("fruit_img"));
            rv.setTextViewText(R.id.wiget_text, bundle.getString("fruit_name"));
            mgr.updateAppWidget(new ComponentName(context, Widget.class), rv);
        }

        super.onReceive(context, intent);
    }
}
