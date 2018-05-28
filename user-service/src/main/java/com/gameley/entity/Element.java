package com.gameley.entity;


import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.*;

import java.util.Date;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.activerecord.Model;
import com.gameley.entity.Element;
//import lombok.Data;



/**
 * 
 *
 * @author WWMXD
 * @email 309980030@qq.com
 * @date 2018-01-03 14:39:38
 */
//@Data
@TableName("element")
public class Element extends Model<Element> {
	private static final long serialVersionUID=1L;
    //
    @TableId(value="id", type= IdType.AUTO)
    private Integer id;

    //资源编码
    @TableField("code")
    private String code;

    //资源类型
    @TableField("type")
    private String type;

    //资源名称
    @TableField("name")
    private String name;

    //资源路径
    @TableField("uri")
    private String uri;

    //资源关联菜单
    @TableField("menu_id")
    private String menuId;

    //
    @TableField("parent_id")
    private String parentId;

    //资源树状检索路径
    @TableField("path")
    private String path;

    //资源请求类型
    @TableField("method")
    private String method;

    //描述
    @TableField("description")
    private String description;

    //
    @TableField("crt_time")
    private Date crtTime;

    //
    @TableField("crt_user")
    private String crtUser;

    //
    @TableField("crt_name")
    private String crtName;

    //
    @TableField("crt_host")
    private String crtHost;



	/**
	 * 设置：
	 */
	public void setId(Integer id) {
			this.id = id;
			}
	/**
	 * 获取：
	 */
	public Integer getId() {
			return id;
			}
	/**
	 * 设置：资源编码
	 */
	public void setCode(String code) {
			this.code = code;
			}
	/**
	 * 获取：资源编码
	 */
	public String getCode() {
			return code;
			}
	/**
	 * 设置：资源类型
	 */
	public void setType(String type) {
			this.type = type;
			}
	/**
	 * 获取：资源类型
	 */
	public String getType() {
			return type;
			}
	/**
	 * 设置：资源名称
	 */
	public void setName(String name) {
			this.name = name;
			}
	/**
	 * 获取：资源名称
	 */
	public String getName() {
			return name;
			}
	/**
	 * 设置：资源路径
	 */
	public void setUri(String uri) {
			this.uri = uri;
			}
	/**
	 * 获取：资源路径
	 */
	public String getUri() {
			return uri;
			}
	/**
	 * 设置：资源关联菜单
	 */
	public void setMenuId(String menuId) {
			this.menuId = menuId;
			}
	/**
	 * 获取：资源关联菜单
	 */
	public String getMenuId() {
			return menuId;
			}
	/**
	 * 设置：
	 */
	public void setParentId(String parentId) {
			this.parentId = parentId;
			}
	/**
	 * 获取：
	 */
	public String getParentId() {
			return parentId;
			}
	/**
	 * 设置：资源树状检索路径
	 */
	public void setPath(String path) {
			this.path = path;
			}
	/**
	 * 获取：资源树状检索路径
	 */
	public String getPath() {
			return path;
			}
	/**
	 * 设置：资源请求类型
	 */
	public void setMethod(String method) {
			this.method = method;
			}
	/**
	 * 获取：资源请求类型
	 */
	public String getMethod() {
			return method;
			}
	/**
	 * 设置：描述
	 */
	public void setDescription(String description) {
			this.description = description;
			}
	/**
	 * 获取：描述
	 */
	public String getDescription() {
			return description;
			}
	/**
	 * 设置：
	 */
	public void setCrtTime(Date crtTime) {
			this.crtTime = crtTime;
			}
	/**
	 * 获取：
	 */
	public Date getCrtTime() {
			return crtTime;
			}
	/**
	 * 设置：
	 */
	public void setCrtUser(String crtUser) {
			this.crtUser = crtUser;
			}
	/**
	 * 获取：
	 */
	public String getCrtUser() {
			return crtUser;
			}
	/**
	 * 设置：
	 */
	public void setCrtName(String crtName) {
			this.crtName = crtName;
			}
	/**
	 * 获取：
	 */
	public String getCrtName() {
			return crtName;
			}
	/**
	 * 设置：
	 */
	public void setCrtHost(String crtHost) {
			this.crtHost = crtHost;
			}
	/**
	 * 获取：
	 */
	public String getCrtHost() {
			return crtHost;
			}

	@Override
	protected Serializable pkVal() {
        return this.id;
	}


}