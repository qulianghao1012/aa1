package com.huayu.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.huayu.ssm.bean.Grade;
import com.huayu.ssm.bean.Student;
import com.huayu.ssm.service.StudentService;
import com.huayu.ssm.utils.LayuiData;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.xml.crypto.Data;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@Repository(value = "studentController")
@Scope(value = "prototype")
@RequestMapping("/stu")
public class StudentController {
    @Autowired
    private StudentService studentService;

    /**
     * 查询所有
     * @return
     */
    @RequestMapping(value = "/querystu.do")
    public String queryAll(Student student,Integer nowPage,Model model) {
        if(nowPage == null){
            nowPage = 1;
        }
        model.addAttribute("nowPage",nowPage);
        model.addAttribute("totalPage",studentService.getTotalPage());
        model.addAttribute("gradeList",studentService.queryAllGrade());
        //model.addAttribute("list",studentService.queryAll(student,nowPage ));
        return "/list.html";
    }

    /**
     * 去添加
     * @return
     */
    @RequestMapping(value = "/toAdd.do")
    public String toAdd(Model model){
        model.addAttribute("gradeList",studentService.queryAllGrade());
        return "addstu";
    }

    /**
     * 添加
     * @param student
     * @return
     */
    @RequestMapping(value = "/add.do")
    public String add(Student student){
        studentService.save(student);
        return "redirect:/stu/querystu.do";
    }

    /**
     * 去修改
     * @param stuno
     * @return
     */
    @RequestMapping(value = "/toUpdate.do")
    public String toUpdate(Model model,Integer stuno){
        model.addAttribute("gradeList",studentService.queryAllGrade());
        model.addAttribute("student",studentService.queryById(stuno));
        return "updatestu";
    }

    /**
     * 修改
     * @param student
     * @return
     */
    @RequestMapping(value = "/update.do")
    public String update(Student student){
        studentService.updateById(student);
        return "redirect:/stu/querystu.do";
    }

    /**
     * 删除
     * @param stuno
     * @return
     */
    @RequestMapping(value = "/delete.do")
    @ResponseBody
    public String delete(int stuno){
        String msg = "1";
        try {
            studentService.removeById(stuno);
        } catch (Exception e) {
            msg = "2";
            e.printStackTrace();
        }
        return msg;
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/deleteStus.do")
    @ResponseBody
    public String deleteStus(String ids){
        String msg = "1";
        try {
            studentService.removeByIds(Arrays.asList(ids.split(",")));
        } catch (Exception e) {
            msg = "2";
            e.printStackTrace();
        }
        return msg;
    }

    /**
     * 批量删除
     * @param stuIds
     * @return
     */
    @RequestMapping(value = "/deleteMore.do")
    public String delete(int[] stuIds){
        System.out.println(stuIds);
        studentService.deleteMore(stuIds);
        return "redirect:/stu/querystu.do";
    }

    /**
     * 查询所有
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "selectallstu.do")
    @ResponseBody
    private LayuiData selectAllStu(Integer page,Integer limit,Student student){
        System.out.println("名字——--"+student.getName());
        IPage<Student> iPage = new Page<>();
        iPage = studentService.queryAll(page,limit,student);
        LayuiData layuiData = new LayuiData();
        layuiData.setCode(0);
        layuiData.setMsg("");
        Long total = iPage.getTotal();
        layuiData.setCount(total.intValue());
        layuiData.setData(iPage.getRecords());
        return layuiData;
    }

    /**
     * 添加
     * @param stu
     * @return
     */
    @RequestMapping(value = "add1.do")
    @ResponseBody
    public String Add(Student stu){
        String sw="";
        try {
            studentService.save(stu);
            sw="1";
        } catch (Exception e) {
            sw="2";
            e.printStackTrace();
        }
        return sw;
    }

    /**
     * 修改
     * @param stu
     * @return
     */
    @RequestMapping(value = "update1.do")
    @ResponseBody
    public String update1(Student stu){
        String sw="";
        try {
            studentService.saveOrUpdate(stu);
            sw="1";
        } catch (Exception e) {
            sw="2";
            e.printStackTrace();
        }
        return sw;
    }

    /**
     * 异步查询班级列表
     * @return
     */
    @RequestMapping("queryAllCla.do")
    @ResponseBody
    public List<Grade> queryAllCla(){
       return  studentService.queryAllGrade();
    }

}
