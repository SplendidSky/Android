package com.example.administrator.weatherbroadcast;

/**
 * Created by Administrator on 2016/11/23.
 */

public class Weather {
    private String date;
    private String weather_description;
    private String temperature;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    public String getWeather_description() {
        return weather_description;
    }

    public void setWeather_description(String weacher_description) {
        this.weather_description = weacher_description;
    }
}
