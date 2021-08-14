package com.refernow;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class addReferral
 */
@WebServlet("/addReferral")
public class addReferral extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String connectionURL = "jdbc:mysql://localhost:3306/project_refernow";
		String user = "root";
		String pass = "keny@9180";
		int result = 0;
		
	    String name = request.getParameter("fname");
	    String c_name = request.getParameter("company");
	    String type = request.getParameter("jobtype");
	    String role = request.getParameter("role");
	    String descr = request.getParameter("desc");
	    String skill = request.getParameter("rskills");
	    PrintWriter out = response.getWriter();
        out.println("<h1>Welcome "+skill+"</h1>");
	    
	    Connection con = null;
	    
	    try
	    {
	    	 out.println("<p>inside Try1</p>");
	    	 Class.forName("com.mysql.cj.jdbc.Driver");
	    	
	    	 out.println("<p>inside Try2</p>");
		     con = DriverManager.getConnection(connectionURL, user, pass);
		     
		     out.println("<p>inside Try3</p>");
		     PreparedStatement ps = (PreparedStatement) con.prepareStatement("insert into referal(ref_name, comp_name,job_type,job_role,job_desc,skills) values(?,?,?,?,?,?)");
		     ps.setString(1, name);
		     ps.setString(2, c_name);
		     ps.setString(3, type);
		     ps.setString(4, role);
		     ps.setString(5, descr);
		     ps.setString(6, skill);
		     result=ps.executeUpdate();
	    	
	    }catch(Exception e)
	    {
	    	e.printStackTrace();
	    	
	    }
	    finally
	    {
	    	if(con != null){
				try{
					con.close();
				}
				catch(Exception e){
					e.printStackTrace();
				}
			}
	    	
	    }
	    String msg;
		if(result > 0){
	    	out.println("Preset Added");
	    }
		else{
			out.println(" Some Error Occurred");
		}
		
	}

}
