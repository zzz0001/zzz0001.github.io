<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#header {
	background-image: linear-gradient(#000033, #00FFFF);
    padding: 10px;
    text-align:center;
}

#nav {
	line-height: 30px;
	background-image: linear-gradient(to right,#00FFFF, #0099FF);
	height:490px;
	width: 100px;
	float: left;
	padding: 5px;
	margin:auto,auto;
}

#section {

	width: 1200px;
	hight: 1000px;
	float: left;
	padding: 10px;
}

#footer {
	background-image: linear-gradient(#CCFFCC, #FF9933);
	color: black;
	clear: both;
	text-align: center;
	height:10px;
	overflow:hidden;
}

.myclass div {
	padding-left: 42px;
	width: 150px;
	max-height: 100px;
	overflow: hidden;
	white-space: normal;
	display: inline-table;
	float:left;
}

.price2 {
	color: #070719;
	font-size:10px;
	padding-left:44px;
	width: 150px;
	height: 50px;
	overflow: hidden;
	position:relative;
	top:-12px;
}
.price {
	color: #ff0055;
	padding-left: 44px;
	width: 160px;
	overflow: hidden;
	position:relative;
	top:-32px;
}

.myclass {
	float: left;
	width: 150px;
	height:240px;
	margin-right: 40px;
}

.img {
	padding-left: 42px;
	height: 160px;
	width =: 160px;
}
.log{
	position:absolute;
	left: 1100px;
	top:80px;
}
.log1{
      border: 1px solid #f00;
      position:absolute;  
	  left: 1300px;
	  top:80px;
      background:#CC3300; 
      width: 40px;
      height: 20px;
      line-height: 20px;
      text-align: center; 
      border-radius: 6px; 
      font-size: 10px;
      color: white;
      text-decoration:none; 
}
.p1{
      font-size: 20px;
}
.href1{
      text-decoration:none; 
      color: blue;
}
.p2{
	position:absolute;
	left: 40px;
	top:20px;
	color:#FFFFCC;
	text-decoration:none; 
}
</style>
</head>

<body>
	<%	String name=request.getParameter("name"); %>
	<div id="header">
		<a class=p2 href="">返回主页</a>
		<h1>店铺主页</h1>
		<a class=log1 href="log.html">登录</a>
		<a class=log>用户名：<%=name %></a>
	</div>

	<div id="nav">
		<p class=p1>商品信息：</p> <br> <br> <br> 
		<a class=href1 href="input_goods.jsp?name=<%=name %>">添加商品</a><br><br>
	</div>
	<div id="section">
		<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?serverTimezone=UTC", "root","123456");
	Statement stmt = connect.createStatement(); 
	ResultSet rs = stmt.executeQuery("select * from goods where businessman_name='"+name+"'");
	while (rs.next())
 	{ 
		out.println("<div class=\"myclass\">");
		out.println("<img class=\"img\"src=\""+ rs.getString("goods_img") + " \" alt=\"无法加载!\" />" );
		out.println("<p class=\"price2\">"+ rs.getString("goods_introduce") + "</p>"); 
		out.println("<p class=\"price\">￥"+ rs.getString("goods_price") +" &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" + "<a href=\"shop_s/delete_goods?ID=" +rs.getString("goods_id")+" &name="+name+"\">" +"删除</a>"+ "</p>");
		out.println("</div>");
	 }
	stmt.close();
	connect.close();
	%>
	</div>
	<div id="footer"></div>
</body>
</html>
