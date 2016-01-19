package com.bab.facebook;


import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bab.dto.Buddy;

import sun.util.BuddhistCalendar;

public class MainMenu extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private String code="";

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		code=null;
		code = request.getParameter("code");
		if (code == null || code.equals("")) {
			throw new RuntimeException(
					"ERROR: Didn't get code parameter in callback.");
		}
		FBConnection fbConnection = new FBConnection();
		String accessToken = fbConnection.getAccessToken(code);

		FBGraph fbGraph = new FBGraph(accessToken);
		String graph = fbGraph.getFBGraph();
		Map<String, String> fbProfileData = fbGraph.getGraphData(graph);
		
	  code=null;
	  accessToken=null;
	  request.setAttribute("name", fbProfileData.get("name"));
	  request.setAttribute("email", fbProfileData.get("email"));
	  RequestDispatcher view = getServletContext().getRequestDispatcher("/LoginWithFb.jsp"); 
	  view.forward(request,response); 
					
					
	
	}

}
