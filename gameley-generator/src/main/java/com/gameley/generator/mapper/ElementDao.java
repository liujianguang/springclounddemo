package com.gameley.generator.mapper;

import com.gameley.common.mapper.SuperMapper;
import com.gameley.generator.entity.Element;

/**
 *
 * 
 *
 * @author WWMXD
 * @email 309980030@qq.com
 * @date 2018-01-02 16:21:36
 */
public interface ElementDao extends SuperMapper<Element> {
    public int deleteAll();

}