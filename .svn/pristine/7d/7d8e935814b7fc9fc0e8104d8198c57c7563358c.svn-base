
package com.glsx.oms.fcadmin.biz;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.glsx.oms.fcadmin.framework.config.StaticProperty;

@Controller
class IndexController
{
    @Autowired
    private StaticProperty staticProperty;
    
    @RequestMapping("/")
    public String index(Map<String, Object> model)
    {
        model.put("cdnPath", staticProperty.getResource());
        return "index";
    }
}