package com.songwie.blog.base;

/**
 * 公用异常处理类
 * @author user
 *
 */
public class BlogException extends RuntimeException{
	static final long serialVersionUID = -7034897190745766939L;

    public BlogException() {
        super();
    }
    public BlogException(String message) {
        super(message);
    }
    public BlogException(String message, Throwable cause) {
        super(message, cause);
    }
    public BlogException(Throwable cause) {
        super(cause);
    }
}
