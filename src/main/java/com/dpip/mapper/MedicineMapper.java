package com.dpip.mapper;

import com.dpip.po.Medicine;

import java.util.List;

/**
 * Created by X on 2017/4/4.
 */
public interface MedicineMapper {

  public   List<Medicine> selectByName(Medicine medicine);

  public int  getCount(Medicine medicine);

     public int update(Medicine medicine);

    public int  add(Medicine medicine);

    public int delete(Medicine medicine);
}
