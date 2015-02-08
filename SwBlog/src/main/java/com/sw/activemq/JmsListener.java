package com.sw.activemq;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JmsListener {
	protected Logger log = LoggerFactory.getLogger(getClass());

    public void onMessage(Object message) {
    	try {
    		String json = (String)message;
    		log.info("AcitvityMQ receive:"+json);


    	} catch (Exception e) {
			log.info("AcitvityMQ消息接受异常" + e.getMessage(), e);
		}
    }


}
