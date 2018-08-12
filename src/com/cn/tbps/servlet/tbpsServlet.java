package com.cn.tbps.servlet;

import javax.servlet.http.HttpServlet;
import java.io.IOException;  
import java.io.PrintWriter;  

import javax.servlet.ServletContext;
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  


import net.sf.json.JSONArray;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cn.tbps.service.BidCompService;


public class tbpsServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = -6622190693024163304L;

	private BidCompService bidCompService;
	
	public BidCompService getBidCompService() {
		return bidCompService;
	}
	public void setBidCompService(BidCompService bidCompService) {
		this.bidCompService = bidCompService;
	}

	public ApplicationContext ctx;
	
	public tbpsServlet() {  
        super();  
    }  
    public void destroy() {  
        super.destroy(); // Just puts "destroy" string in log  
    }  
  
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        this.doPost(request, response);  
    }  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        response.setContentType("application/json;charset=utf-8");  
        request.setCharacterEncoding("utf-8");  
        PrintWriter out = response.getWriter();  

        String compname=new String(request.getParameter("compname").getBytes("iso-8859-1"),"UTF-8");
//        String compname=request.getParameter("compname");  
        System.out.println("request.compname:" + compname);
        
        ServletContext servletContext = request.getSession().getServletContext();
    	ctx= WebApplicationContextUtils.getWebApplicationContext(servletContext);
                  
    	JSONArray jsonarr= new JSONArray();
        
        bidCompService = (BidCompService)ctx.getBean("bidCompService");
        bidCompService.setCtx(ctx);    	
        // Get Saler's individual data
        if (!compname.equals("")){
            jsonarr = bidCompService.getCompNameData(compname);        	
        } 
        
        out.println(jsonarr.toString());  
        out.flush();  
        out.close();  
    }        
        
    public void init() throws ServletException {  
        // Put your code here  
    }  
 
}
