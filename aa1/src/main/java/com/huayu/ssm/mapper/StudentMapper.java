package com.huayu.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.huayu.ssm.bean.Grade;
import com.huayu.ssm.bean.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper extends BaseMapper<Student> {

    public IPage<Student> queryAll(Page<Student> page,@Param("name") String name,@Param("sex") String sex,@Param("cid") Integer cid);

    public Student queryById(int id);

    public List<Grade> queryAllGrade();

    public int queryCount();
}
