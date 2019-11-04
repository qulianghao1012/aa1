package com.huayu.ssm.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.huayu.ssm.bean.Grade;
import com.huayu.ssm.bean.Student;
import com.huayu.ssm.mapper.StudentMapper;
import com.sun.glass.ui.Size;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service(value = "studentService")
public class StudentService extends ServiceImpl<StudentMapper,Student> {
    @Resource(name = "studentMapper")
    private StudentMapper studentMapper;

    /**
     * 查询所有
     * @param nowPage
     * @return
     */
    public IPage<Student> queryAll(Integer nowPage, Integer size,Student student){
        Page<Student> page = new Page<>(nowPage,size);
        studentMapper.queryAll(page,student.getName(),student.getSex(),student.getCid());
        return page;
    }



    public Student queryById(int id){
        return  studentMapper.queryById(id);
    }

    public List<Grade> queryAllGrade(){
       return studentMapper.queryAllGrade();
    }


    public void  deleteMore(int[] stuIds){
        for (int i =0;i<stuIds.length;i++){
            studentMapper.deleteById(stuIds[i]);
        }

    }

    /**
     * 获取总页数
     * @return
     */
    public int getTotalPage(){
        int allCol = studentMapper.queryCount();

        return allCol;
    }
}

