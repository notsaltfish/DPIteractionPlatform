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
import java.util.List;

/**
 * Created by X on 2017/4/4.
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

    @RequestMapping(value = "/excelExceport/patient")
    public String patientExport(Page page,Patient patient,HttpServletRequest request
                                                ,HttpServletResponse response) throws  Exception{
        String path = request.getSession().getServletContext().getRealPath("/")+"excel/";

        InputStream is =  new FileInputStream(new File(path+"patientTemplate.xlsx"));
        Workbook wb = new XSSFWorkbook(is);//不需要再new  Workbook 直接使用这个对象就可以
        Sheet sh = wb.getSheetAt(0);

        List<Patient> data = patientService.select(page,patient);
        Row row = null;
        Cell cell = null;

        Patient patient1 = null;
        int colNum = 1;
        int rowNum = 2;

        for(int i=0;i<data.size();i++){
            colNum = 0;
            patient1 = data.get(i);
            row = sh.createRow(rowNum++);
            cell = row.createCell(colNum++);
            cell .setCellValue(patient1.getName());

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
            cell .setCellValue(patient1.getHpDate());

        }
      ByteArrayOutputStream out = new ByteArrayOutputStream();
        try {
            wb.write(out);
            out.close();
            DownloadUtil du = new DownloadUtil();
            du.download(out, response, "patientReport.xlsx");
            out.close();


        } catch (IOException e) {
            e.printStackTrace();
        }

        return  "/index.jsp";
    }

}
