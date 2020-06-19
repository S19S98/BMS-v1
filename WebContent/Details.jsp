<%@page import="java.util.*" %>
<%@page import="com.swapnil.bean.BookBean" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	body{
	background: lightblue;
	margin: 0px;
	}
	header{
		background: coral;
		margin: 0px;
		color: white;
		text-align: center;
		padding: 1px;
	}
	.nav{
		background: darkblue;
		color: white;
		margin: 0px;
	}
	.nav ul{
		list-style-type: none;
		padding: 18px;
		margin: 0px;
		padding-top: 0px;
	}
	.nav ul li{
		display: inline;
		float: right;
		padding-right: 15px;
	
	}
	.greet{
		text-align: center;
	}
	.options ul{
		list-style-type: none;
		padding: 18px;
		margin-left: 170px;
		padding-top: 0px;
	}
	.options ul li{
		display: inline;
		float: left;
		padding-right: 20%;
		margin-top: 10px;
	}
	.options ul li a{
		text-decoration: none;
		border: black solid 1px;
		boder-radius: 5px;
		padding: 5px;
		background: blue;
		color: white;
	}
	.tbl{
		text-align: center;
		margin-top: 50px;
		margin-left: 30%;
		margin-right: 40%;
	}
	table, th, td {
	  border: 1px solid black;
	}
	footer{
		background: darkblue;
		color: yellow;
		padding: 2px;
		text-align: center;
		margin-top: 4%;
	}
</style>
</head>
<body>
	<% 
		String name = session.getAttribute("name").toString();
	%>
	<header>
		<h1> Book Management System </h1>
	</header>
	<div class="nav">
		<ul>
			<li> About Us </li>
			<li> CONTACT US </li>
			<li> HOME </li>
		</ul>
	</div>
	<div class="greet">
		<h1> Welcome <%= name %></h1>
		<p> This is an online platform where you can keep track of the books that you are reading, books that you have read already and also the
		books that you want to read in future. This space was created in order to encourage you to read more and more books and get acquainted with 
		habit of reading books. This organized and visually appealing wardrobe of books will motivate you to get started with a book and quickly 
		transfer it to the read section, you will have a healthy competition with your self. </p>
	</div>
	<div class="options">
		<ul>
			<li>
				<a href="ReadingServlet" class="btn btn-primary"> Reading </a>
			</li>
			<li>
				<a href="ReadServlet" class="btn btn-primary"> Read </a>
			</li>
			<li>
				<a href="ToBeReadServlet" class="btn btn-primary"> To Be Read </a>
			</li>
		</ul>
	</div>
	<div class="tbl">
		<table>
			<%
				List<BookBean> bookList = (List<BookBean>)request.getAttribute("bookList");
				if(bookList != null){
			%>
			<tr>
				<th> Book Name </th>
				<th> Author Name </th>
				<th> Publication </th>
			</tr>
			<%
				Iterator<BookBean> it = bookList.iterator();
				while(it.hasNext()){
					BookBean bean = it.next();
			%>
			<tr>
				<td> <%= bean.getBookName() %> </td>
				<td> <%= bean.getAuthorName() %> </td>
				<td> <%= bean.getPublication() %> </td>
			</tr>
			<%
				}
				}
			%>
		</table>
	</div>
	<footer style="margin-top: 40%">
		Copyright &copy; Swapnil 2020
	</footer>
</body>
</html>