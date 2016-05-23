
<%@include file="../includes.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Table of Users</title>
    <link rel="stylesheet" type="text/css" href="tablestyle.css" media="all">
</head>
<body>
<h1>Main form CRUDapp.</h1>
<h3>Add User</h3>
<c:url var="addAction" value="users/add"/>
<form:form action="${addAction}" commandName="user">
  <table class="tg">
    <tr>
      <td>
        <form:label path="userName">
          <spring:message text="userName"/>
        </form:label>
      </td>
      <td>
        <form:input path="userName"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="userAge">
          <spring:message text="userAge"/>
        </form:label>
      </td>
      <td>
        <form:input path="userAge"/>
      </td>
    </tr>
    <tr>
      <td>
        <form:label path="isAdmin">
          <spring:message text="isAdmin"/>
        </form:label>
      </td>
      <td>
        <form:input path="isAdmin"/>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <c:if test="${empty user.userName}">
          <input type="submit" value="<spring:message text="Add User"/>"/>
        </c:if>
      </td>
    </tr>
  </table>
</form:form>
<c:url var="searchAction" value="/user.search"/>
<h3>Search user by ID.</h3>
<form:form action="${searchAction}" commandName="user">
   <table class="tg">
     <tr>
       <td>User Id</td>
       <td><form:input path="id"/></td>
       <td><input type="submit" value="<spring:message text="search"/>"></td>
     </tr>
   </table>
</form:form>
<h3>List of users</h3>
<c:if test="${!empty listUsers}">
  <table class="tg">
    <tr>
      <th>ID</th>
      <th>NAME</th>
      <th>AGE</th>
      <th>ISADMIN</th>
      <th>CREATEDDATE</th>
      <th>Edit</th>
      <th>Remove</th>
    </tr>
    <c:forEach items="${listUsers}" var="user">
      <tr>
        <td>${user.id}</td>
        <td>${user.userName}</td>
        <td>${user.userAge}</td>
        <td>${user.isAdmin}</td>
        <td>${user.createdDate}</td>
        <td><a href="<c:url value='/userdata/${user.id}'/>">Edit</a></td>
        <td><a href="<c:url value='/remove/${user.id}'/>">Remove</a></td>
      </tr>
    </c:forEach>
  </table>
</c:if>
<br/>
<div id="pagination">

  <c:url value="/users" var="prev">
    <c:param name="page" value="${page-1}"/>
  </c:url>
  <c:if test="${page > 1}">
    <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
  </c:if>

  <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
    <c:choose>
      <c:when test="${page == i.index}">
        <span>${i.index}</span>
      </c:when>
      <c:otherwise>
        <c:url value="/users" var="url">
          <c:param name="page" value="${i.index}"/>
        </c:url>
        <a href='<c:out value="${url}" />'>${i.index}</a>
      </c:otherwise>
    </c:choose>
  </c:forEach>
  <c:url value="/users" var="next">
    <c:param name="page" value="${page + 1}"/>
  </c:url>
  <c:if test="${page + 1 <= maxPages}">
    <a href='<c:out value="${next}" />' class="pn next">Next</a>
  </c:if>
</div>

</body>
</html>
