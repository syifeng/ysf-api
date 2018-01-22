package com.ds.api.entity.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

@Configuration
@MapperScan(basePackages = "com.ds.api.entity.mapper",sqlSessionTemplateRef = "apiSqlSessionTemplate")
public class ApiDataSourceConfig {

    @Primary
    @Bean
    @ConfigurationProperties("ds.api.jdbc.api")
    public DataSourceProperties apiDataSourceProperties() {
        return new DataSourceProperties();
    }

    @Primary
    @Bean(name = "apiDataSource")
    @ConfigurationProperties(prefix = "ds.api.jdbc.api")
    public DataSource apiDataSource() {
        return apiDataSourceProperties().initializeDataSourceBuilder().build();
    }

    @Primary
    @Bean(name = "apiSqlSessionFactory")
    public SqlSessionFactory apiSqlSessionFactory(@Qualifier("apiDataSource")DataSource dataSource) throws Exception{
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        bean.setTypeAliasesPackage("com.ds.api.entity.model");
        bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath*:api-mapping/*.xml"));
        bean.setConfigLocation(new DefaultResourceLoader().getResource("classPath:mybatis-config.xml"));
        return bean.getObject();
    }

    @Primary
    @Bean(name = "apiTransactionManager")
    public DataSourceTransactionManager apiTransactionManager(@Qualifier("apiDataSource")DataSource dataSource){
        return new DataSourceTransactionManager(dataSource);
    }

    @Primary
    @Bean(name = "apiSqlSessionTemplate")
    public SqlSessionTemplate apiSqlSessionTemplate(@Qualifier("apiSqlSessionFactory")SqlSessionFactory sqlSessionFactory) throws Exception{
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}
