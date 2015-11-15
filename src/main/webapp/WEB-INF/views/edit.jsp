<%@ page language="java" contentType="text/html; charset=UTF-8"  
 pageEncoding="UTF-8"%>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>Edit User Details</title>  
</head>  
<body>
  <div align="center" style="margin:40px;">
   <div style="color: teal; font-size: 30px">Редактирование юзера</div>
  
  <c:url var="userRegistration" value="saveUser.html" />
  <form:form id="registerForm" modelAttribute="user" method="post"
   action="update">
   <table width="400px" height="150px">
    <tr>
     <td><form:label path="name">Имя</form:label></td>
     <td><form:input path="name" value="${userObject.name}" /></td>
     <td><form:input path="id" value="${userObject.id}" type="hidden" /></td>
    </tr>
    <tr>
     <td><form:label path="age">Возраст</form:label></td>
     <td><form:input path="age" value="${userObject.age}"/></td>
    </tr>
    <tr>
     <td><form:label path="admin">Админ</form:label></td>
        <td><form:select path="admin">
            <form:option value="true" label="- true -" />
            <form:option value="false" label="- false -" />
        </form:select></td>
    </tr>

    <tr>
     <td></td>
     <td><input type="submit" value="Обновить данные" />
     </td>
    </tr>
   </table>
  </form:form>
      <form style="margin-top:20px;" action="<c:url value="/list"/>" method="get">
          <input type="submit" value="Список пользователей">
      </form>
  </div>
  <%--<table>--%>
      <%--<thead>--%>
      <%--<tr>--%>
          <%--<th>Name</th>--%>
          <%--<th>Age</th>--%>
          <%--<th>isAdmin</th>--%>
          <%--<th></th>--%>
      <%--</tr>--%>
      <%--</thead>--%>
      <%--<tbody>--%>
      <%--<tr>--%>
          <%--<form:form action="${pageContext.request.contextPath}/edit" commandName="user" method="post">--%>
              <%--<form:hidden path="id"/>--%>
              <%--<td><form:input path="name"/></td>--%>
              <%--<td><form:input path="age"/></td>--%>
              <%--<td><form:checkbox path="admin"/></td>--%>
              <%--<td><input type="submit" value="Обновить данные"></td>--%>
          <%--</form:form>--%>
      <%--</tr>--%>
      <%--</tbody>--%>
  <%--</table>--%>

</body>  
</html>  