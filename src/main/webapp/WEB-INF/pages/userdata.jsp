<%@include file="../includes.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Details</title>
    <link rel="stylesheet" type="text/css" href="tablestyle.css" media="all">
</head>
<body>

<h1>User Details</h1>
<table class="tg">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>AGE</th>
        <th>ISADMIN</th>
        <th>CREATEDDATE</th>
    </tr>
    <tr>
        <td>${user.id}</td>
        <td>${user.userName}</td>
        <td>${user.userAge}</td>
        <td>${user.isAdmin}</td>
        <td>${user.createdDate}</td>
    </tr>
</table>
<br/>

<h2>Edit user.</h2>
<c:url var="editAction" value="/userdata.edit"/>
<form:form action="${editAction}" commandName="user">
    <table class="tg">
        <tr>
            <td>User ID</td>
            <td><form:input path="id" /></td>
        </tr>
        <tr>
            <td>User name</td>
            <td><form:input path="userName" /></td>
        </tr>
        <tr>
            <td>User Age</td>
            <td><form:input path="userAge" /></td>
        </tr>
        <tr>
            <td>User is admin?</td>
            <td><form:input path="isAdmin" /></td>
        </tr>
        <tr>
            <td>Created date</td>
            <td><form:input path="createdDate" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="<spring:message text="Edit User"/>"/>
            </td>
        </tr>
    </table>
</form:form>

<a href="/users"> Back to list of users.</a>
</body>
</html>
