package com.example.administrator.birthdaymemo;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.List;

/**
 * Created by Administrator on 2016/11/16.
 */

public class ItemsAdapter extends BaseAdapter {
    private List<Item> items;
    private Context context;

    public ItemsAdapter(Context context, List<Item> items) {
        this.context = context;
        this.items = items;
    }

    @Override
    public int getCount() {
        if (items == null)
            return 0;
        return items.size();
    }

    @Override
    public Object getItem(int i) {
        if (items == null)
            return null;
        return items.get(i);
    }

    @Override
    public long getItemId(int i) {
        return i;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        View convertView;
        ViewHolder viewHolder;

        if (view == null) {
            convertView = LayoutInflater.from(context).inflate(R.layout.item, null);
            viewHolder = new ViewHolder();
            viewHolder.name = (TextView) convertView.findViewById(R.id.name);
            viewHolder.birth = (TextView) convertView.findViewById(R.id.birth);
            viewHolder.gift = (TextView) convertView.findViewById(R.id.gift);
            convertView.setTag(viewHolder);
        }
        else {
            convertView = view;
            viewHolder = (ViewHolder) convertView.getTag();
        }

        viewHolder.name.setText(items.get(i).getName());
        viewHolder.birth.setText(items.get(i).getBirth());
        viewHolder.gift.setText(items.get(i).getGift());


        return convertView;
    }

    private class ViewHolder {
        public TextView name;
        public TextView birth;
        public TextView gift;
    }
}
