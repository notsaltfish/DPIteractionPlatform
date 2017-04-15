package com.dpip.vo;
import java.util.List;

/**
 * Created by X on 2017-04-09.
 *统计图表类
 */
public class StatisticObject {
    private String title;
    List<StatisticValueObject> datas;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<StatisticValueObject> getDatas() {
        return datas;
    }

    public void setDatas(List<StatisticValueObject> datas) {
        this.datas = datas;
    }
}
