package com.gameley.monitor;


import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;


@EnableDiscoveryClient
@EnableAdminServer
@SpringBootApplication
public class MonitorApplication {

	public static void main(String[] args) {
		SpringApplication.run(MonitorApplication.class, args);
	}

//	@Profile("insecure")
//	@Configuration
//	public static class SecurityPermitAllConfig extends WebSecurityConfigurerAdapter {
//		@Override
//		protected void configure(HttpSecurity http) throws Exception {
//			http.authorizeRequests().anyRequest().permitAll()//
//					.and().csrf().disable();
//		}
//	}

//	@Profile("secure")
//	@Configuration
//	public static class SecuritySecureConfig extends WebSecurityConfigurerAdapter {
//		private final String adminContextPath;
//
//		public SecuritySecureConfig(AdminServerProperties adminServerProperties) {
//			this.adminContextPath = adminServerProperties.getContextPath();
//		}
//
//		@Override
//		protected void configure(HttpSecurity http) throws Exception {
//			// @formatter:off
//			SavedRequestAwareAuthenticationSuccessHandler successHandler = new SavedRequestAwareAuthenticationSuccessHandler();
//			successHandler.setTargetUrlParameter("redirectTo");
//
//			http.authorizeRequests()
//					.antMatchers(adminContextPath + "/assets/**").permitAll()
//					.antMatchers(adminContextPath + "/login").permitAll()
//					.anyRequest().authenticated()
//					.and()
//					.formLogin().loginPage(adminContextPath + "/login").successHandler(successHandler).and()
//					.logout().logoutUrl(adminContextPath + "/logout").and()
//					.httpBasic().and()
//					.csrf().ignoringAntMatchers("/instances/**").disable();
//			// @formatter:on
//		}
//	}



}
