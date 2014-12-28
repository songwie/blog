<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:url value="/" var="home"></spring:url>

    <header id="masthead" class="site-header" role="banner">
        <hgroup>
            <h1 class="site-title"><a href="" title="blog" rel="home"> 从零开始</a></h1>
            <h2 class="site-description"> 世界上有不绝的风景，我有不老的心情 。</h2>
        </hgroup>

        <nav id="site-navigation" class="main-navigation" role="navigation">
            <button class="menu-toggle">菜单</button>
            <a class="assistive-text" href="http://www.songwie.com/#content" title="Skip to content">Skip to content</a>
            <div class="nav-menu">
                <ul>
                    <li class="current_page_item">
                        <i class="fa fa-home fa-2x"></i>
                        <a href="${home}">主页</a>
                    </li>

                    <li class="page_item page-item-13">
                        <a href="${home}teachs">技术区</a>
                    </li>

                    <li class="page_item page-item-13">
                        <a href="${home}other">杂谈</a>
                    </li>

                    <li class="page_item page-item-8">
                        <a href="${home}aboutme">关于作者</a>
                    </li>

                </ul>
            </div>
        </nav><!-- #site-navigation -->

    </header>


