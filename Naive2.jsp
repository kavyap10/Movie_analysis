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
			int lang[][]=new int[1][2];
			lang[0][0]=0; //en
			lang[0][1]=1; //hi
			int rating[][]=new int[1][5];
			rating[0][0]=0; //1
			rating[0][1]=1; //2
			rating[0][2]=2; //3
			rating[0][3]=3; //4
			rating[0][4]=4; //5
			
			int result[][]=new int[1][2];
			result[0][0]=0; //hit
			result[0][1]=1; //flop
			for(i=0;i<20;i++)
			{
				
				if(data[i][0].equals("en"))
					lang[0][0]++;
				else 
					lang[0][1]++;
				
				if(data[i][1].equals("1"))
					rating[0][0]++;
				else if(data[i][1].equals("2"))
					rating[0][1]++;
				else if(data[i][1].equals("3"))
					rating[0][2]++;
				else if(data[i][1].equals("4"))
					rating[0][3]++;
				else
					rating[0][4]++;
			
				if(data[i][2].equals("flop"))
					result[0][1]++;
				else
					result[0][0]++;
			}
			
			int lan=Integer.parseInt(request.getParameter("lang"))-1;
			String la= " ";
			switch(lan)
			{
				case 0: la=new String("en");
						break;
				case 1: la=new String("hi");
						break;
			}				
			int ra=Integer.parseInt(request.getParameter("rating"))-1;
			String r= " ";
			switch(ra)
			{
				case 0: r=new String("1");
						break;
				case 1: r=new String("2");
						break;
				case 2: r=new String("3");
						break;
				case 3: r=new String("4");
				break;
				case 4: r=new String("5");
				break;
			}
			
			int c1=0,c2=0,c3=0,c4=0;
			for(i=0;i<20;i++)
			{
				if(data[i][0].equals(la)&&data[i][2].equals("hit"))
					c1++;
				if(data[i][1].equals(r)&&data[i][2].equals("hit"))
					c2++;
				if(data[i][0].equals(la))
					c3++;
				if(data[i][1].equals(r))
					c4++;
				
			}
			int d1=0,d2=0;
			for(i=0;i<20;i++)
			{
				if(data[i][0].equals(la)&&data[i][2].equals("flop"))
					d1++;
				if(data[i][1].equals(r)&&data[i][2].equals("flop"))
					d2++;
				
			}
			
			float p_s_y=((float)result[0][0])/((float)20);
			float p_s_n=((float)result[0][1])/((float)20);
			float gn=((float)c1)/((float)c3);
			float ngn=((float)d1)/((float)c3);
			float edc=((float)c2)/((float)c4);
			float nedc=((float)d2)/((float)c4);
			
		
			float hit,flop;
			try{
				hit=p_s_y*gn*edc;
			}
			catch(Exception exp)
			{
				out.println(exp);
				hit=0;
			}
			out.println("<br><br>Probability of the movie being a hit:"+hit+"<br>");
			try{
				flop=p_s_n*ngn*nedc;
			}
			catch(Exception exp)
			{
				out.println(exp);
				flop=0;
			}
			out.println("Probability of the movie being flop: "+flop+"<br>");
			if(hit>flop)
				out.println("<br><b>The movie is a hit.</b>");
			else
				out.println("<br><b>The movie is a flop.</b>");	
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
</body>
</html>