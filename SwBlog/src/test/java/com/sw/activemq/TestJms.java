package com.sw.activemq;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.env.Environment;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml")
@ActiveProfiles(profiles = "dev")
public class TestJms {

	@Autowired
	Environment env;

	@Autowired
	@Qualifier("queueMessageProducer")
	JmsProducer  queueJmsProducer;

	@Autowired
	@Qualifier("topicMessageProducer")
	JmsProducer topicJmsProducer;

	@Test
	public void testJms(){
		queueJmsProducer.send("{a:'ss'}");

		topicJmsProducer.send("{a:'ss'}");

    }
}
