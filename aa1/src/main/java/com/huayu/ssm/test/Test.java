package com.huayu.ssm.test;

import com.huayu.ssm.bean.Student;
import com.huayu.ssm.mapper.StudentMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class Test {

    public static void main(String[] args){

        for (int i = 1; i <10 ; i++) {
            for (int j = 1; j <= i ; j++) {
                System.out.print(i+" * "+j+ "= "+i*j+"  ");
            }
            System.out.println();
        }
    }
}
