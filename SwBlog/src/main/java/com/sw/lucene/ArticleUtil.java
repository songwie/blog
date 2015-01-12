package com.sw.lucene;
import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.TermVector;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Searcher;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

/**
* SearchLogic.java
* @version 1.0
* @createTime Lucene数据库检索
*/
public class ArticleUtil {
    private static Connection conn = null;
    private static Statement stmt = null;
    private static  ResultSet rs = null;
    private String searchDir = "E:\\Test\\Index";
    private static File indexFile = null;
    private static Searcher searcher = null;
    private static Analyzer analyzer = null;
    /** 索引页面缓冲 */
    private int maxBufferedDocs = 500;
    /**
    * 获取数据库数据
    * @return ResultSet
    * @throws Exception
    */
    public List<SearchBean> getResult(String queryStr) throws Exception {
        List<SearchBean> result = null;
        conn = JdbcUtil.getConnection();
        if(conn == null) {
            throw new Exception("数据库连接失败！");
        }
        String sql = "select id, title as title, article_content as content , article_type_id as type from tblog_article";
        try {
//stmt = conn.createStatement();
//rs = stmt.executeQuery(sql);
//this.createIndex(rs);   //给数据库创建索引,此处执行一次，不要每次运行都创建索引，以后数据有更新可以后台调用更新索引
            TopDocs topDocs = this.search(queryStr);
            ScoreDoc[] scoreDocs = topDocs.scoreDocs;
            result = this.addHits2List(scoreDocs);
        } catch(Exception e) {
            e.printStackTrace();
            throw new Exception("数据库查询sql出错！ sql : " + sql);
        } finally {
            if(rs != null) rs.close();
            if(stmt != null) stmt.close();
            if(conn != null) conn.close();
        }
        return result;
    }

/**
* 为数据库检索数据创建索引
* @param rs
* @throws Exception
*/
    private void createIndex(ResultSet rs) throws Exception {
        Directory directory = null;
        IndexWriter indexWriter = null;

        try {
            indexFile = new File(searchDir);
            if(!indexFile.exists()) {
                indexFile.mkdir();
            }
            directory = FSDirectory.open(indexFile);
            analyzer = new StandardAnalyzer(Version.LUCENE_30);

            indexWriter = new IndexWriter(directory, analyzer, true, IndexWriter.MaxFieldLength.UNLIMITED);
            indexWriter.setMaxBufferedDocs(maxBufferedDocs);
            Document doc = null;
            while(rs.next()) {
                doc = new Document();
                Field id = new Field("id", String.valueOf(rs.getInt("id")), Field.Store.YES, Field.Index.NOT_ANALYZED, TermVector.NO);
                Field title = new Field("title", rs.getString("title") == null ? "" : rs.getString("title"), Field.Store.YES,Field.Index.ANALYZED, TermVector.NO);
                Field content = new Field("content", rs.getString("content") == null ? "" : rs.getString("content"), Field.Store.YES,Field.Index.ANALYZED, TermVector.NO);

                doc.add(id);
                doc.add(title);
                doc.add(content);

                indexWriter.addDocument(doc);
            }

            indexWriter.optimize();
            indexWriter.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    /**
    * 搜索索引
    * @param queryStr
    * @return
    * @throws Exception
    */
    private TopDocs search(String queryStr) throws Exception {
        if(searcher == null) {
            indexFile = new File(searchDir);
            searcher = new IndexSearcher(FSDirectory.open(indexFile));
        }
        //searcher.setSimilarity(new IKSimilarity());
        QueryParser parser = new QueryParser(Version.LUCENE_30,"content",new StandardAnalyzer(Version.LUCENE_30));
        Query query = parser.parse(queryStr);

        TopDocs topDocs = searcher.search(query, searcher.maxDoc());
        return topDocs;
    }

    /**
    * 返回结果并添加到List中
    * @param scoreDocs
    * @return
    * @throws Exception
    */
    private List<SearchBean> addHits2List(ScoreDoc[] scoreDocs ) throws Exception {
        List<SearchBean> listBean = new ArrayList<SearchBean>();
        SearchBean bean = null;
        for(int i=0 ; i<scoreDocs.length; i++) {
            int docId = scoreDocs[i].doc;
            Document doc = searcher.doc(docId);
            bean = new SearchBean();
            bean.setId(doc.get("id"));
            bean.setTitle(doc.get("title"));
            bean.setContent(doc.get("content"));

            listBean.add(bean);
        }
        return listBean;
    }

    public static void main(String[] args) {
    	ArticleUtil logic = new ArticleUtil();
        try {
            Long startTime = System.currentTimeMillis();
            List<SearchBean> result = logic.getResult("java");
            int i = 0;
            for(SearchBean bean : result) {
                if(i == 10)
                    break;
                System.out.println("<a href='http://www.songwie.com/articlelist/"+bean.getId()+"'>"+ bean.getTitle() +"</a>" );
                i++;
            }

            System.out.println("searchBean.result.size : " + result.size());
            Long endTime = System.currentTimeMillis();
            System.out.println("查询所花费的时间为：" + (endTime-startTime)/1000+" 秒");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }
}