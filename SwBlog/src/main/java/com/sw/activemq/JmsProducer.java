package com.sw.activemq;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

public class JmsProducer {
	@Autowired
	@Qualifier("jmsTemplate")
	private JmsTemplate jmsTemplate;

	private Destination destination ;

	public void send( final String json){
		jmsTemplate.setDefaultDestination(destination);
		jmsTemplate.send(new MessageCreator(){
			@Override
			public Message createMessage(Session session) throws JMSException {
				return session.createObjectMessage( json );
			}
		});
	}

	public Destination getDestination() {
		return destination;
	}
	public void setDestination(Destination destination) {
		this.destination = destination;
	}

}
