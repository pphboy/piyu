package com.pipihao.piyu.piyubackground.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.scrypt.SCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/20 9:32
 */
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {


    @Autowired
    private DataSource dataSource;

    /**
     * 说实话，我并不知道这个加密是否可逆<br>
     * 但Security自带的加密应该安全更高<br>
     * 但这里我没有使用加盐<br>
     *    有需要自己改表并加盐吧,按理来说后台这种东西，不可能在外网吧
     * @return
     */
    @Bean
    public PersistentTokenRepository persistentTokenRepository(){
        JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
        jdbcTokenRepository.setDataSource(dataSource);
//        jdbcTokenRepository.setCreateTableOnStartup(true); //自动创建保存信息的表
        return jdbcTokenRepository;
    }



    @Autowired
    private UserDetailsService userDetailsService;

    private static final SCryptPasswordEncoder bCryptPasswordEncoder = new SCryptPasswordEncoder();

    @Bean
    PasswordEncoder passwordEncoder(){
        return new SCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        /*配置UserDetailsService与密码的加密器*/
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/js/**","/css/**","/fonts/**","/images/**","/lib/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        /*配置403错误界面*/
        /*因为只有404界面，但想了一下，没有权限，给个404也行，但参数是403*/
        http.exceptionHandling().accessDeniedPage("/error.html");
        /*配置登出*/
        http.logout().logoutUrl("/logout").logoutSuccessUrl("/login").permitAll();
        /*配置登录的路径*/
        http.authorizeRequests()
            .antMatchers("/about","/**.html").permitAll() //不拦截的路径
            .antMatchers("/admin/**").hasAnyRole("ADMIN")
            .antMatchers("/bg/**").hasAnyRole("ADMIN,BGUSER")
                .anyRequest().authenticated()
            .and()
                .formLogin()
                .loginPage("/login") //登录界面
                .loginProcessingUrl("/doLogin")
                .defaultSuccessUrl("/")
                .permitAll()
            .and().
                rememberMe().tokenRepository(persistentTokenRepository())
                .tokenValiditySeconds(432000) //设置自动登录的时间 单位秒
                .userDetailsService(userDetailsService);

            http.headers().frameOptions().sameOrigin(); // 关闭X-Frame-Options
            /**
             *
             * 注： 此处默认开启了CSRF
             *
             * */
    }
}
