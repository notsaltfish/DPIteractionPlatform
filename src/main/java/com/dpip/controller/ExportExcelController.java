package com.dpip.controller;


import com.dpip.po.Patient;
import com.dpip.service.AdminService;
import com.dpip.service.DepartmentService;
import com.dpip.service.DoctorService;
import com.dpip.service.PatientService;
import com.dpip.util.DownloadUtil;

import com.dpip.util.Page;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by X on 2017/4/4.
 * 导出excel的数据controller
 */
@Controller
public class ExportExcelController {

    @Autowired
    private PatientService patientService;
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private DepartmentService departmentService;

    /**
     * 点击前台的导出excel 然后 导出excel表格
     * @param page 需要导出第几页数据
     * @param patient 需要导出的病人的信息
     * @param request
     * @param response 将导出变成流 输出出去
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/excelExceport/patient")
    public void patientExport(Page page,Patient patient,HttpServletRequest request
                                                ,HttpServletResponse response) throws  Exception{
        //获取当前的项目绝对路径
        String path = request.getSession().getServletContext().getRealPath("/")+"excel/";
        //获取要导出的excel模板信息
        InputStream is =  new FileInputStream(new File(path+"patientTemplate.xlsx"));
        //兴建一个工作簿 也就是excel
        Workbook wb = new XSSFWorkbook(is);//不需要再new  Workbook 直接使用这个对象就可以
        //创建一个sheet
        Sheet sh = wb.getSheetAt(0);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        //获取需要导出的患者数据
        List<Patient> data = patientService.select(page,patient);
        Row row = null;
        Cell cell = null;

        Patient patient1 = null;
        int colNum = 1;
        int rowNum = 2;

        for(int i=0;i<data.size();i++){
            colNum = 0;
            patient1 = data.get(i);
            //用sheet创建一行
            row = sh.createRow(rowNum++);
            //再用行创建一个单元格
            cell = row.createCell(colNum++);
            //单元格设置患者的值
            cell .setCellValue(patient1.getName());
//下面类似
            cell = row.createCell(colNum++);
            cell .setCellValue(patient1.getSex());

            cell = row.createCell(colNum++);
            cell .setCellValue(patient1.getAge());


            cell = row.createCell(colNum++);
            cell .setCellValue(patient1.getPhone());

            cell = row.createCell(colNum++);
            cell .setCellValue(patient1.getDepartmentName());

            cell = row.createCell(colNum++);
            cell .setCellValue(patient1.getIcdName());

            cell = row.createCell(colNum++);
            cell .setCellValue(patient1.getStatus());

            cell = row.createCell(colNum++);
            cell .setCellValue(  format.format(patient1.getHpDate()));

        }
        //将excel变成流输出到前端
      ByteArrayOutputStream out = new ByteArrayOutputStream();
        try {
            //将excel写到字节输出流
            wb.write(out);
            out.close();
            //使用专门封装的下载工具传输IO流
            DownloadUtil du = new DownloadUtil();
            du.download(out, response, "patientReport.xlsx");


        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
