package com.example.administrator.contacts;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * Created by Administrator on 2016/10/10.
 */
public class Contact implements Parcelable{
    private String name;
    private String phone_number;
    private String attribution;
    private String background_color;

    public Contact() {}

    public Contact(String name, String phone_number, String attribution, String background_color) {
        this.name = name;
        this.phone_number = phone_number;
        this.attribution = attribution;
        this.background_color = background_color;
    }


    public String getName() {
        return  name;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public String getAttribution() {
        return attribution;
    }

    public String getBackground_color() {
        return background_color;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(name);
        dest.writeString(phone_number);
        dest.writeString(attribution);
        dest.writeString(background_color);
    }

    public static final Parcelable.Creator<Contact> CREATOR = new Creator<Contact>() {

        @Override
        public Contact createFromParcel(Parcel source) {
            Contact contact = new Contact();
            contact.name = source.readString();
            contact.phone_number = source.readString();
            contact.attribution = source.readString();
            contact.background_color = source.readString();
            return contact;
        }

        //供反序列化本类数组时调用的
        @Override
        public Contact[] newArray(int size) {
            return new Contact[size];
        }
    };
}

