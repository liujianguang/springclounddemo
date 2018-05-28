package com.gameley.common.LogConfig.parser;

import com.baomidou.mybatisplus.service.IService;
import com.gameley.common.EnableGameleyLog;
import com.gameley.common.util.SpringUtil;

import java.util.Map;

/**
 * 基础解析类
 * 单表编辑时可以直接使用id来查询
 * 如果为多表复杂逻辑，请自行编写具体实现类
 * @author lw
 * @date 2018-03-02
 */
public class DefaultContentParse implements ContentParser {
    @Override
    public Object getResult(Map<String,Object> feildValues, EnableGameleyLog enableGameleyLog) {
        if(!feildValues.containsKey("id")){
            throw new RuntimeException("未解析到id值，请检查前台传递参数是否正确");
        }
        Object result= feildValues.get("id");
        Integer id=0;
        if(result instanceof String){
            id= Integer.parseInt((String) result);

        }else if(result instanceof Integer){
            id= (Integer) result;
        }
        IService service= null;
        Class cls=enableGameleyLog.serviceclass();
        service = (IService) SpringUtil.getBean(cls);

        return  service.selectById(id);
    }


}
