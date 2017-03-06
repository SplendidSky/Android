package com.example.administrator.birthdaymemo;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;
import java.util.List;

import static android.R.attr.name;

/**
 * Created by Administrator on 2016/11/16.
 */

public class myDB extends SQLiteOpenHelper {

    private static final String DB_NAME = "BirthdayMemo";
    private static final String TABLE_NAME = "Items";
    private static final int DB_VERSION = 1;

    public myDB(Context context, String name, SQLiteDatabase.CursorFactory factory, int version) {
        super(context, name, factory, version);
    }

    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        String CREATE_TABLE = "CREATE TABLE if not exists " + TABLE_NAME + " " +
                "(_id INTEGER PRIMARY KEY AUTOINCREMENT," +
                " name TEXT UNIQUE, birth TEXT, gift TEXT)";
        sqLiteDatabase.execSQL(CREATE_TABLE);
    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {

    }

    public boolean insert(Item item) {
        SQLiteDatabase db = getWritableDatabase();
        SQLiteDatabase check = getReadableDatabase();
        if (check.query(TABLE_NAME, new String[] { "name" }, "name=\"" +
                item.getName()+ '"', null, null, null, null).getCount() != 0)
            return false;
        ContentValues cv = new ContentValues();
        cv.put("name", item.getName());
        cv.put("birth", item.getBirth());
        cv.put("gift", item.getGift());
        db.insert(TABLE_NAME, null, cv);
        return true;
    }

    public long update(Item item) {
        SQLiteDatabase db = getWritableDatabase();
        ContentValues cv = new ContentValues();
        cv.put("birth", item.getBirth());
        cv.put("gift", item.getGift());
        return db.update(TABLE_NAME, cv, "_id=" + item.getId(), null);
    }


    private List<Item> ConvertToItem(Cursor cursor) {
        int resultCounts = cursor.getCount();
        if (resultCounts == 0 || !cursor.moveToFirst())
            return null;
        List<Item> items = new ArrayList<>();
        for (int i = 0; i < resultCounts; i++) {
            items.add(new Item());
            items.get(i).setId(cursor.getInt(0));
            items.get(i).setName(cursor.getString(cursor.getColumnIndex("name")));
            items.get(i).setBirth(cursor.getString(cursor.getColumnIndex("birth")));
            items.get(i).setGift(cursor.getString(cursor.getColumnIndex("gift")));
            cursor.moveToNext();
        }
        return items;
    }


    public List<Item> queryAll() {
        SQLiteDatabase db = getReadableDatabase();
        Cursor cursor = db.query(TABLE_NAME, null,
                null, null, null, null, null);
        return ConvertToItem(cursor);
    }

    public Item query(int id) {
        SQLiteDatabase db = getReadableDatabase();
        Cursor cursor = db.query(TABLE_NAME, null,
                "_id=" + id, null, null, null, null);
        try {
            return ConvertToItem(cursor).get(0);
        } catch (Exception e) {
            return null;
        }
    }

    public long delete(int id) {
        SQLiteDatabase db = getWritableDatabase();
        return db.delete(TABLE_NAME, "_id=" + id, null);
    }

}
