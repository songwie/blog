<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:url value="/" var="home"></spring:url>

<!-- jquery 公用 -->
<script type="text/javascript" src="${home}resources/js/jquery-1.10.2.min.js"></script>

<!-- 工具 -->
<script type="text/javascript" src="${home}resources/js/common/format.js"></script>
<script type="text/javascript" src="${home}resources/js/common/json.js"></script>
<script type="text/javascript" src="${home}resources/js/xridate.js"></script>

    <link type="text/css" rel="stylesheet" href="${home}resources/css/shCore.css">
    <link type="text/css" rel="stylesheet" href="${home}resources/css/shThemeDefault.css">
    <link type="text/css" rel="stylesheet" href="${home}resources/css/shCoreDefault.css">
    <link type="text/css" rel="stylesheet" href="${home}resources/css/monokai.css">

    <script type="text/javascript" src="${home}resources/js/shCore.js"></script>
    <script type="text/javascript" src="${home}resources/js/shAutoloader.js"></script>
    <script type="text/javascript" src="${home}resources/js/highlight.pack.js"></script>

    <script type="text/javascript">
         //替换为span \t
        //hljs.tabReplace = '<span class="indent">\t</span>';-->
        hljs.configure({
          tabReplace: '    ', // 4 spaces
          //classPrefix: ''     // don't append class prefix
                              // … other options aren't changed
        })
        //hljs.initHighlighting();
        hljs.initHighlightingOnLoad();

        $('div.code').each(function(i, block) {
            //hljs.highlightBlock(block);
        });
    </script>

    <script type="text/javascript">
    //<![CDATA[
    function path()
      {
        var args = arguments,
            result = [];
        for(var i = 0; i < args.length; i++)
            result.push(args[i].replace('@', '/static/js/'));
        return result
      };
      SyntaxHighlighter.autoloader.apply(null, path(
        'applescript            @shBrushAppleScript.js',
        'actionscript3 as3      @shBrushAS3.js',
        'bash shell             @shBrushBash.js',
        'coldfusion cf          @shBrushColdFusion.js',
        'cpp c                  @shBrushCpp.js',
        'c# c-sharp csharp      @shBrushCSharp.js',
        'css                    @shBrushCss.js',
        'delphi pascal          @shBrushDelphi.js',
        'diff patch pas         @shBrushDiff.js',
        'erl erlang             @shBrushErlang.js',
        'groovy                 @shBrushGroovy.js',
        'java                   @shBrushJava.js',
        'jfx javafx             @shBrushJavaFX.js',
        'js jscript javascript  @shBrushJScript.js',
        'perl pl                @shBrushPerl.js',
        'php                    @shBrushPhp.js',
        'text plain             @shBrushPlain.js',
        'py python              @shBrushPython.js',
        'ruby rails ror rb      @shBrushRuby.js',
        'sass scss              @shBrushSass.js',
        'scala                  @shBrushScala.js',
        'sql                    @shBrushSql.js',
        'vb vbnet               @shBrushVb.js',
        'xml xhtml xslt html    @shBrushXml.js'
      ));
      SyntaxHighlighter.defaults['toolbar'] = false
      SyntaxHighlighter.defaults['gutter'] = true;
      //SyntaxHighlighter.config.stripBrs=false
      SyntaxHighlighter.config.bloggerMode = true;
      SyntaxHighlighter.config.strings.viewSource = "查看源码"
      SyntaxHighlighter.all();
      //
      </script>


