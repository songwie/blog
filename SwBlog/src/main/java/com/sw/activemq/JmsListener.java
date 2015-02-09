package com.sw.activemq;

import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JmsListener implements MessageListener{
	protected Logger log = LoggerFactory.getLogger(getClass());

	@Override
	public void onMessage(Message message) {
		try {
			if(message instanceof ObjectMessage){
				ObjectMessage msg = (ObjectMessage)message;
				String json = (String) msg.getObject();
				log.info("AcitvityMQ type:"+msg.getJMSType());
	    		log.info("AcitvityMQ receive:"+json);
				log.info("AcitvityMQ receive:" + message);
			}


    	} catch (Exception e) {
			log.info("AcitvityMQ消息接受异常" + e.getMessage(), e);
		}

	}


}
