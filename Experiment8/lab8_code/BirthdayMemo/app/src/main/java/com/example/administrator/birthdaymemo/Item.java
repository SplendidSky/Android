package com.example.administrator.birthdaymemo;

import java.security.PublicKey;

/**
 * Created by Administrator on 2016/11/16.
 */

public class Item {
    private String name;
    private String birth;
    private String gift;
    private int _id;

    public Item() {}
    public Item(int id, String name, String birth, String gift) {
        this._id = id;
        this.name = name;
        this.birth = birth;
        this.gift = gift;
    }
    public Item(String name, String birth, String gift) {
        this.name = name;
        this.birth = birth;
        this.gift = gift;
    }

    public String getName() { return name; };
    public String getBirth() { return birth; };
    public String getGift() { return gift; };
    public int getId() { return _id; }

    public void setName(String name) { this.name = name; };
    public void setBirth(String birth) { this.birth = birth; };
    public void setGift(String gift) { this.gift = gift; }
    public void setId(int id) { this._id = id; }
}
