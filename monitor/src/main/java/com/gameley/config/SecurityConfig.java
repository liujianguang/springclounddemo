//package com.gameley.config;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        /*if("dev".equals(env)){ //如果需要在开发服中免登录
//            http.authorizeRequests().antMatchers("*//**","*//**//*filters").permitAll();
//            http.csrf().disable();
//            http.httpBasic();
//            return;
//        }*/
//        http
//            .formLogin().loginPage("/login.html").loginProcessingUrl("/login").permitAll()
//            .and()
//            .logout().logoutUrl("/logout")
//            .and()
//            .authorizeRequests()
//            .antMatchers("/login.html", "/**/*.css", "/img/**", "/api/**","/health") //放开"/api/**"：为了给被监控端免登录注册
//            .permitAll()
//            .and()
//            .authorizeRequests().antMatchers("/**").authenticated();
//        http.csrf().disable();
//        http.httpBasic();
//
//    }
///*  @Autowired //也可以在application.yml文件中配置登录账号密码：security.user.name/password
//    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//        auth
//            .inMemoryAuthentication()
//            .withUser("svcAdmin").password("pw").roles("USER");
//    }*/
//}
