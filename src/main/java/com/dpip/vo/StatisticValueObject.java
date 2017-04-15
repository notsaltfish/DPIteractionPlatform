package com.dpip.vo;

/**
 * Created by X on 2017-04-09.
 * 统计图表的类 就是一个键值对对象
 */
public class StatisticValueObject {
    private String name;
    private Double value;

    public String getName() {
        return name;
    }

    public   StatisticValueObject(){

    }

    public   StatisticValueObject(String name,Double value){

        this.setValue(value);
        this.setName(name);

    }


    public void setName(String name) {
        this.name = name;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }
}
