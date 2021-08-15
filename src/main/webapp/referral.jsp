<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import=" java.io.IOException"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>


<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/referral.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link rel="icon" type="image/png" href="./assets/favicon.png">
    <script src="jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="./js/referal.js" ></script>
    <title>ReferNow | Referrers</title>
</head>
<body>
<div id="blur">
        <nav>
            <a href="./index.html"><h1>ReferNow<i class="fas fa-briefcase"></i></h1></a>
            <ul>
              
                    <a href="#" onclick="toggle()">Update Profile<i class="fas fa-plus"></i></a>
                </div>

            </ul>
        </nav>
        <h2 align="center"> Referrers For You </h2>
        <div class="cards">
        
        
        





<% 

String connectionURL = "jdbc:mysql://localhost:3306/project_refernow";
String user = "root";
String pass = "keny@9180";
int result = 0;


String skill = request.getParameter("rskills");



Connection con = null;

try
{
	 
	 Class.forName("com.mysql.cj.jdbc.Driver");
	

		
     con =(Connection) DriverManager.getConnection(connectionURL, user, pass);

     Statement st = con.createStatement();
	
		ResultSet presets = st.executeQuery("select * from referal where skills like '%Management%' ");
		
		String rn,cn,jt,jr,jd,sk;
		String[] s;
		while(presets.next())
		{
			 rn = presets.getString("ref_name");
			 cn = presets.getString("comp_name");
			 jt = presets.getString("job_type");
			 jr = presets.getString("job_role");
			 jd = presets.getString("job_id");
			 sk = presets.getString("skills");
			s = sk.split(",");
			int i = presets.getInt("ref_id");
			
			%>
			<div class="card">
                <div class="profile-sidebar">
                    <img src="./assets/person-2.jpg" alt="person-1">
                    <ul class="social-list">
                        <li class="social-item"><a class="social-link" href=""><i class="fas fa-address-book"></i></a></li>
                        <li class="social-item"><a class="social-link" href=""><i class="fab fa-github-square"></i></a></li>
                        <li class="social-item"><a class="social-link" href=""><i class="fab fa-linkedin"></i></a></li>
                    </ul>
                </div>
                <div class="profile-main">
                    <h2 class="profile-name"><%=rn %></h2>
                    <p class="profile-position">Company Name: <%=cn %></p>
                    <p class="profile-referral">Job Role: <%=jr %></p>
                    <p class="profile-referral">Job Type: <%=jt %></p>
                    <p class="profile-referral">Job ID: <%=jd %> </p>
                    <p>Skills/Exp required <i class="fas fa-long-arrow-alt-down"></i></p>
                    <div class="profile-skills">
                    <%
                    for(String k: s)
                    {
                    	%>
                    	<p> <%=k %> </p>
                    	<%
                    	
                    }
                    %>
 </div>
                    
                    <div class="action-buttons">
                        <a href="#">Request</a>
                    </div>
                </div>
            </div>
            
                    	
                    
                    
                        
                        
                   
			
			   
			<%
		}
			}
			
     


catch(Exception e)
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


%>

</div>
    </div>
    <div id="popup">
        <a href="" onclick="toggle()"><i class="fas fa-times"></i></a>
        <form id="preset_form" action="addReferral" method="POST" >
            <label for="fname"> Name</label>
            <input type="text" id="fname" name="fname" placeholder="Your name..">

            <label for="company">Company Name</label>
            <input type="text" id="company" name="company" placeholder="Which company's referall?">
            
            <label for="jobtype">Job Type</label>
            <select id="jobtype" name="jobtype">
                <option value="intern">Internship</option>
                <option value="part time">Part Time</option>
                <option value="fulltime">Full time</option>
            </select>
            <label for="role">Job Role</label>
            <input type="text" id="role" name="role" placeholder="Job Role">
            <label for="desc">Job Description</label>

			<textarea id="desc" name="desc" rows="4" cols="50" placeholder="Insert job description and requirements">
			</textarea>
			<label for="rskills">Required Skills</label>

			<textarea id="rskills" name="rskills" rows="4" cols="50" placeholder="
			Add 2-3 comma seperated skills. For e.g. Html, CSS, JS">
			</textarea>	            
            
            <input type="submit" id="submit" value="Add Referral" >
        </form>
    </div>
    <script type="text/javascript">
        function toggle() {
            var blur = document.getElementById('blur');
            blur.classList.toggle('active');

            var popup = document.getElementById('popup');
            popup.classList.toggle('active');
        }
        
        let form1=$('preset_form');
        $(document).on('submit', '#preset_form', function(event){
          $.ajax({
              type: form1.attr('method'),
              url: form1.attr('action'),
              data:form1.serialize(),
              success:function(data)
              {
               alert("Referral Added!");
                location.reload();
              },
              error:function()
              {
                alert("Failed to add referral");
              }
            });
        //event.preventDefault();
        });

    </script>
</body>
</html>

