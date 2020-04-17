<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Movie Data Analysis</title>
<style type="text/css">
table, tr,th,td {
    border: 1px solid black;
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

String csvFile = "D:/final1.csv";
BufferedReader br = null;
Scanner sc=new Scanner(System.in);
String line = "";
double sum = 0.0; 
int count=0,i;


    br = new BufferedReader(new FileReader(csvFile));
	
	String[] mov = line.split(",");


	double a[]=new double[24];
	double b[]=new double[24];

	//float s[]=new float[14];
	mov = line.split(",");
	//line=br.readLine();
	//System.out.println(l);
	i=0;
	while((line=br.readLine())!=null)
	{
		
	
			mov = line.split(",");
		a[i]=Float.parseFloat(mov[5]);
		b[i]=Float.parseFloat(mov[8]);
		
		
		i++;
		//System.out.println(s[i][j]+"\t");
		}
		//System.out.println("\n");			i++;
	
		out.println("<table>");
		out.println("<tr><th>Popularity</th><th> Vote_average</th></tr>");

	for(i=0;i<24;i++)
	{
		out.println("<tr>");
		out.println("<td>");
			out.println(a[i]);
			out.println("</td>");
					out.println("<td>");
			out.println(b[i]);
			out.println("</td>");
					out.println("</tr>");
	}
	out.println("</table>");

	double a_sum=0.0;
	double b_sum=0.0;
	for(i=0;i<24;i++)
	{
		a_sum=a_sum+a[i];
		b_sum=b_sum+b[i];
	}
	
	double a_mean=a_sum/24;
	double b_mean=b_sum/24;
	out.println("Mean:"+a_mean);
	out.println("<br><br>");
	double w1=0.0,w1_num,w1_den;
	double a_a[]=new double[24];
	double b_b[]=new double[24];
	double c_c[]=new double[24];
	for(i=0;i<24;i++)
	{
		a_a[i]=a[i]-a_mean;
		b_b[i]=b[i]-b_mean;
		c_c[i]=(a[i]-a_mean)*(a[i]-a_mean);
	}

	for(i=0;i<24;i++)
	{
		w1=w1 +((a_a[i]*b_b[i])/c_c[i]);
		
	}
	out.println("W1:"+w1);
	out.println("<br><br>");
	double w0;
	w0=b_mean-(w1*a_mean);
	out.println("W0 : "+w0);
	out.println("<br><br>");
	


%>
<form action="http://localhost:8080/Proj1/Reg2.jsp">
Enter runtime:<br>
<input type="text" name="rt">

<input type="submit" value="Submit"><br>


 </form>
</body>
</html>