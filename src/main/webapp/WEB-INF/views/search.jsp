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
<title>Search User</title>  
</head>  
<body>
<div align="center" style="margin:40px;">
  
  <div style="color: teal; font-size: 30px">Поиск юзеров</div>
  
  <c:if test="${!empty userList}">  
   <table border="1" bgcolor="black" width="600px">  
    <tr  
     style="background-color: teal; color: white; text-align: center;"  
     height="40px">  
       
     <td>Имя</td>
     <td>Возраст</td>
     <td>isAdmin</td>  
     <td>Дата создания</td>
       
     <td>Редактировать</td>
     <td>Улалить</td>
    </tr>  
    <c:forEach items="${userList}" var="user">  
     <tr  
      style="background-color: white; color: black; text-align: center;"  
      height="30px">  
        
      <td><c:out value="${user.name}" />  
      </td>  
      <td><c:out value="${user.age}" />  
      </td>  
       <td><c:out value="${user.admin}" />  
      </td>  
      <td><c:out value="${user.timestamp}" />  
      </td>

      <td><a href="edit?id=${user.id}"><img src="/images/edit.png" alt="Редактировать"></a></td>
      <td><a href="delete?id=${user.id}"><img src="/images/delete.png" alt="Удалить"></a></td>
     </tr>  
    </c:forEach>  
   </table>  
  </c:if>

<br/>
  <form action="<c:url value="/form"/>" method="get"><input type="submit" value="Добавить пользователя"></form>
 </div>
</body>  
</html>  