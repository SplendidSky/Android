package com.example.administrator.contacts;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.List;

/**
 * Created by Administrator on 2016/10/10.
 */



public class ContactsAdapter extends BaseAdapter {

    private List<Contact> contacts;
    private Context context;

    public ContactsAdapter(Context context, List<Contact> contacts) {
        this.context = context;
        this.contacts = contacts;
    }

    @Override
    public int getCount() {
        if (contacts == null)
            return 0;
       return contacts.size();
    }

    @Override
    public Object getItem(int position) {
       if (contacts == null)
           return null;
        return contacts.get(position);
    }

    @Override
    public long getItemId(int position) {
       return position;
    }

    @Override
    public View getView(int position, View view, ViewGroup parent) {
        View convertView;
        ViewHolder viewHolder;

        if (view == null) {
            convertView = LayoutInflater.from(context).inflate(R.layout.contact, null);
            viewHolder = new ViewHolder();
            viewHolder.first_letter = (TextView) convertView.findViewById(R.id.first_letter);
            viewHolder.name = (TextView) convertView.findViewById(R.id.name);
            convertView.setTag(viewHolder);
        }
        else {
            convertView = view;
            viewHolder = (ViewHolder) convertView.getTag();
        }

        viewHolder.first_letter.setText(contacts.get(position).getName().substring(0, 1).toUpperCase());
        viewHolder.name.setText(contacts.get(position).getName());

        return convertView;
    }

    private class ViewHolder {
        public TextView first_letter;
        public TextView name;
    }
}
