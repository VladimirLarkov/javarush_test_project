<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		table, th, td {
			border: 1px solid black;
			border-collapse: collapse;
		}
	</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Details</title>
</head>
<body>
	<%
		int pageNumber = (Integer) request.getAttribute("page");
		int totalPages = (Integer) request.getAttribute("totalPages");

		String previousPage = (pageNumber - 1) + "";
		if (Integer.parseInt(previousPage) < 0) {
			previousPage = "0";
		}

		String nextPage = (pageNumber + 1) + "";
		if (Integer.parseInt(nextPage) > totalPages) {
			nextPage = totalPages + "";
		}
		String previousPageUrl = "list?page=" + previousPage;
		String nextPageUrl = "list?page=" + nextPage;

		pageContext.setAttribute("previousPageUrl", previousPageUrl);
		pageContext.setAttribute("nextPageUrl", nextPageUrl);
		pageContext.setAttribute("totalPages", totalPages);
	%>

	<div align="center" style="margin:40px;">

		<div style="color: teal; font-size: 30px">Список пользователей</div>

		<c:if test="${!empty userList}">
			<table border="1" style="width:100%">
				<tr
					style="background-color: teal; color: white; text-align: center;"
					height="40px">

					<td>Имя</td>
					<td>Возраст</td>
					<td>isAdmin</td>
					<td>Дата Создания</td>

					<td>Редактировать</td>
					<td>Удалить</td>
				</tr>
				<c:forEach items="${userList}" var="user">
					<tr
						style="background-color: white; color: black; text-align: center;"
						height="30px">

						<td><c:out value="${user.name}" /></td>
						<td><c:out value="${user.age}" /></td>
						<td><c:out value="${user.admin}" /></td>
						<td><c:out value="${user.timestamp}" /></td>

						<td><a href="edit?id=${user.id}"><img src="/images/edit.png" alt="Редактировать"></a></td>
						<td><a href="delete?id=${user.id}"><img src="/images/delete.png" alt="Удалить"></a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

		<br/>
		<form action="search">
			<input type="text" name="name" value="Найти по имени..." onclick="this.value=''" /><br />
            <input type="image" src="/images/search.png" alt="Найти">
		</form>
		<br/>
		<form action="<c:url value="/form"/>" method="get"><input type="submit" value="Добавить пользователя"></form>

	</div>


	<table border="1" cellpadding="5" cellspacing="5">
        <tr>
		<td><a href="${pageScope.previousPageUrl}">&#8592;</a></td>

			<c:forEach var="i" begin="0" end="${totalPages}">
				<td><a href="${pageScope.page}/list?page=${i}">${i+1}</a></td>
			</c:forEach>

		<td><a href="${pageScope.nextPageUrl}">&#8594;</a></td>
        </tr>
	</table>
	
</body>
</html>
