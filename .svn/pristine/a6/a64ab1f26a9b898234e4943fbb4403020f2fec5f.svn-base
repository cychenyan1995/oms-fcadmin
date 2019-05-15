package com.glsx.oms.fcadmin;

import org.oreframework.boot.main.AbsOreBootStarter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@ServletComponentScan
@EnableTransactionManagement
// @MapperScan("com.oms.boot.web.biz") 如果映射接口使用了@Mapper注解就不需要@MapperScan
public class OMSBootStarter extends AbsOreBootStarter
{
    
    @Override
    public void run(String[] args)
    {
        SpringApplication.run(OMSBootStarter.class, args);
    }
    
    public static void main(String[] args)
    {
        OMSBootStarter starter = new OMSBootStarter();
        starter.run(args);
    }
    
}
