package com.refernow;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addStudent
 */
@WebServlet("/addStudent")
public class addStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String connectionURL = "jdbc:mysql://localhost:3306/project_refernow";
		String user = "root";
		String pass = "keny@9180";
		int result = 0;
		
	    String name = request.getParameter("lname");
	    String status = request.getParameter("status");
	    String lin = request.getParameter("linkedin");
	    String git = request.getParameter("git");
	    String email = request.getParameter("email");
	    String sskill = request.getParameter("sskills");
	    PrintWriter out = response.getWriter();
        
	    
	    Connection con = null;
	    
	    try
	    {
	    	 out.println("<p>inside Try1</p>");
	    	 Class.forName("com.mysql.cj.jdbc.Driver");
	    	
	    	 out.println("<p>inside Try2</p>");
		     con = DriverManager.getConnection(connectionURL, user, pass);
		     
		     out.println("<p>inside Try3</p>");
		     PreparedStatement ps = (PreparedStatement) con.prepareStatement("insert into seekers('name', 'status', 'skill', 'linkedin', 'github', 'email','s_id') values (?,?,?,?,?,?,?)");
		     ps.setString(1, name);
		     ps.setString(2, status);
		     ps.setString(3, sskill);
		     ps.setString(4, lin);
		     ps.setString(5, git);
		     ps.setString(6, email);
		     ps.setInt(7, 1234);

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
	    	out.println("Profile Added");
	    }
		else{
			out.println(" Some Error Occurred");
		}
		
	}

	}


