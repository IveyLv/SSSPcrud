package com.Ivey.sssp.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SSSPTest {

    private ApplicationContext ctx;

    {
        ctx = new ClassPathXmlApplicationContext("spring-config.xml");
    }

    @Test
    public void test() {

    }
}
