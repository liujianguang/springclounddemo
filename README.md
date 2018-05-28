###  **Spring Cloud 项目脚手架** 
自动生成测试网址：http://dota2info.cn/index

(如需修改配置，只需修改config-repo中的generator.xml，项目会采用springcloud-bus来进行动态更新)

 **技术栈** 
1. Spring Boot
1. MySQL
1. Spring Cloud
1. Mybatis
1. Mybatis-Plus
1. Swagger2

 **项目介绍** 

持久层采用mybatis持久化，使用MyBatis-Plus优化，减少sql开发量；

前台代码采用elementui,对单表的增删改查页面（包含分页）可以通过脚手架一键生成，简化90%的代码开发；

日志记录目前采用logback，后续会使用elk，对日志进行统计分析；

Druid数据库连接池，监控数据库访问性能，统计SQL的执行性能；

后台采用springboot-admin进行监控；

swagger生成接口文档；

**初步搭建，还在修改** 

 **前台页面（初步测试开发）**
![登录界面](https://gitee.com/uploads/images/2018/0118/183152_ec0b7742_1463938.png "深度截图_选择区域_20180118183119.png")
![输入图片说明](https://gitee.com/uploads/images/2018/0314/094403_fea3dfa6_1463938.png "深度截图_选择区域_20180314094343.png")

![输入图片说明](https://gitee.com/uploads/images/2018/0222/105501_ee6d8996_1463938.png "深度截图_选择区域_20180222105059.png")

![zipkin链式追踪界面](https://gitee.com/uploads/images/2018/0222/105333_639fd6b1_1463938.png "深度截图_选择区域_20180222105112.png")

![springboot admin](https://gitee.com/uploads/images/2018/0222/105354_4bfae20e_1463938.png "深度截图_选择区域_20180222105124.png")

![输入图片说明](https://gitee.com/uploads/images/2018/0105/192313_5b896fbe_1463938.png "前端UI.png")

 **前台安装步骤（需要安装node.js）**
1. cd web
1. npm install 
1. npm run dev

 _QQ群_
点击链接加入群聊【spring cloud(adplatform)】：https://jq.qq.com/?_wv=1027&k=5IChqC1
![输入图片说明](https://gitee.com/uploads/images/2018/0327/175748_2175a1d0_1463938.png "深度截图_选择区域_20180327175656.png") 

 **更新内容**

_#2018-02-01_ 

  _增加elk docker镜像，目前可以导入nginx的日志，进行分析。elk-kafka 为后边数据统计导入做准备_  

_#2018-02-09_ 

  _增加elasticsearch记录日志（后续会删除，继续使用logback，用filebeat导入到elasticsearch中）_  

  _增加zipin链式追踪，存储到elasticsearch中_

  _本地使用elk版本为6.1.1_  

 _#2018-02-22_ 

 _调整日志格式，重新使用logback记录日志（详见：  http://blog.csdn.net/qq_36752632/article/details/79348146  ）_

 _增加springboot admin监控_

 _完善elk docker镜像，使用filebeat监控日志，logstash grok进行日志解析，最后存入elaticseach_
   
   _#2017-03-08_

  _升级至springboot 2.0版本（1.5.5版本见分支）_

   _springcloud改为Finchley.M8版本_

   _监控改用最新的2.0测试版，展示图：_

 ![输入图片说明](https://gitee.com/uploads/images/2018/0307/193702_898efe5d_1463938.png "深度截图_选择区域_20180307192527.png")    

