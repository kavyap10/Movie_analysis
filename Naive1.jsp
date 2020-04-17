<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Movie Data Analysis</title>
<style type="text/css">
table, tr,th, td {
    border: 1px solid black;
    cellpadding=10px;
}
</style>
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%@ page import ="java.lang.Math"%>

<%

String csvFile = "D:/Naivefinal.csv";
		  FileInputStream fis = new FileInputStream(csvFile);
		  DataInputStream myInput = new DataInputStream(fis);
        String line = "";
        String cvsSplitBy = ",";
		String data[][]=new String[90][3];

        try {
			int i=0;
            
            while ((line = myInput.readLine()) != null) {

                // use comma as separator
                String[] soc= line.split(cvsSplitBy);
				data[i][0]=soc[2];
				data[i][1]=soc[10];
				data[i][2]=soc[11];
				
               i++;	

            }
			out.println("<table>");
			out.println("<tr><th>Language</th><th>Rating</th><th>Result</th></tr>");
			for(i=0;i<20;i++)
			{
				out.println("<tr><td>"+data[i][0]+"</td><td>"+data[i][1]+"</td><td>"+data[i][2]+"</td></tr>");
			}
			out.println("</table>");
			
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (myInput != null) {
                try {
                    myInput.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        
    
	%>
	<form action="http://localhost:8080/Proj1/Naive2.jsp">
	<br><br><br><br>
<h3>Choose from the following:</h3><br>
<table>
<tr><th>Language: &nbsp;&nbsp;</th>
<td><input type="radio" name="lang" value="1">en
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="lang" value="2">hi
</td></tr>
<tr><th>

Rating: &nbsp;&nbsp;</th><td>
<input type="radio" name="rating" value="1">1
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="rating" value="2">2
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="rating" value="3">3
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="rating" value="4">4
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="rating" value="5">5


</td></tr>

</table><br>
<input type="submit" value="Submit"><br>
 </form>
</body>
</html>