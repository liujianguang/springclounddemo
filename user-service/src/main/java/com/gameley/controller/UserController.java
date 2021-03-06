package com.gameley.controller;


import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.Condition;
import com.gameley.common.constant.RestCodeConstants;
import com.gameley.common.msg.BaseResponse;
import com.gameley.common.msg.ObjectRestResponse;
import com.gameley.common.util.Des;
import com.gameley.common.utils.vo.UserInfo;
import com.gameley.entity.User;
import com.gameley.gameleyauth.annotation.IgnoreUserToken;
import com.gameley.service.UserService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author WWMXD
 * @since 2018-01-03 14:39:38
 */

@RestController
@RequestMapping("user")
@IgnoreUserToken
public class UserController {
    @Autowired
    private UserService userService;
    @ApiOperation(value ="用户验证", httpMethod ="POST", response =UserInfo.class, notes ="用于登录验证")
    @RequestMapping(value = "validate", method = RequestMethod.POST)
    public UserInfo validate(@RequestParam("username") String username, @RequestParam("password") String password){
        String pass=Des.strEnc(password,"www","gameley","com");
        User user=userService.selectOne(Condition.create().eq("username",username).eq("password",pass));
        UserInfo userInfo=new UserInfo();
        userInfo.setId(String.valueOf(user.getId()));
        userInfo.setName(user.getUsername());
        return userInfo;

    }
    @ApiOperation(value = "获取用户" ,httpMethod ="POST")
    @RequestMapping("getUserName/{id}")
    public BaseResponse getUserName(@PathVariable(required = false) Integer id){
        List<User> users;
        if(id==0){
            users= userService.selectList(Condition.EMPTY);
        }else{
            users=userService.selectList(Condition.create().eq("id",id));
        }
        List<User> user=users.stream().map((User us)->{
            User u=new User();
            u.setId(us.getId());
            u.setRoleid(us.getRoleid());
            u.setUsername(us.getUsername());
            return u;
        }).collect(Collectors.toList());
        ObjectRestResponse objectRestResponse=new ObjectRestResponse();
        objectRestResponse.setData(user);
        objectRestResponse.setRel(true);
        return objectRestResponse;
    }
    @ApiOperation(value = "编辑用户权限" ,httpMethod ="POST")
    @RequestMapping("editUserRole")
    public BaseResponse editUserRole(@RequestBody JSONObject jsonObject){
        User user=new User();
        user.setId(jsonObject.getInteger("id"));
        user.setRoleid(jsonObject.getInteger("roleid"));
        Boolean flag=userService.updateById(user);
        if(flag){
            return new BaseResponse(200,"编辑成功");
        }else{
            return new BaseResponse(RestCodeConstants.EDIT_ERROR_CODE,"编辑失败");
        }

    }
	
}
