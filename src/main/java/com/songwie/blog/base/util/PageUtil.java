package com.songwie.blog.base.util;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

public class PageUtil {

	Map<String, Object> page = new HashMap<String, Object>();

	public Map<String, Object> parsePage(String start,String limit,int total){
	    Map<String, Object> page = new HashMap<String, Object>();
        int pagetotal = limit.equals("1")?new BigDecimal(Math.floor(total/Integer.valueOf(limit))).intValue():
        	new BigDecimal(Math.floor(total/Integer.valueOf(limit))).intValue()+1;
        int has_prepage = !start.equals("0")&&pagetotal>1?1:0;
        int has_nextpage = new BigDecimal(Math.floor(Integer.valueOf(start)/Integer.valueOf(limit))).intValue()+1==pagetotal?0:1;
        int pre_start = Integer.valueOf(start)-Integer.valueOf(limit);
        int next_start = Integer.valueOf(start)+Integer.valueOf(limit);;
        int last_start = (pagetotal-1)*Integer.valueOf(limit);
        int curr_page = new BigDecimal(Math.floor(Integer.valueOf(start)/Integer.valueOf(limit))).intValue()+1;



        page.put("pagetotal", pagetotal);
        page.put("has_prepage", has_prepage);
        page.put("has_nextpage", has_nextpage);
        page.put("pre_start", pre_start);
        page.put("next_start", next_start);
        page.put("last_start", last_start);
        page.put("curr_page", curr_page);
        page.put("total", total);

        this.page = page;

	    return page;
	}

	public Map<String, Object> getPage() {
		return page;
	}

	public void setPage(Map<String, Object> page) {
		this.page = page;
	}


}
