<%@ page import="uz.pdp.demo9.studycenter.repo.StudentRepo" %>
<%@ page import="uz.pdp.demo9.studycenter.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.demo9.studycenter.repo.GroupsRepo" %>
<%@ page import="uz.pdp.demo9.studycenter.Groups" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Student</title>
</head>
<body>

<%
    List<Student> students = StudentRepo.getAllStudents();
    String id = request.getParameter("groupId");

    String search = Objects.requireNonNullElse(request.getParameter("search"), "");
    int pagejon = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("page"), "1"));

    if (id != null) {
        students = StudentRepo.getStudentsList(Integer.parseInt(id), pagejon, search);
    }
%>

<form action="AddStudent.jsp" method="post">
    <input type="hidden" name="groupId" value="<%=id%>">
    <button class="btn btn-dark">Add student</button>
</form>

<div class="w-25 p-4">
    <form action="">
        <div class="input-group">
            <input name="search" class="form-control" type="text" placeholder="Search...">
            <button class="btn btn-dark">Search</button>
        </div>
    </form>
</div>

<div class="w-25 p-4">
    <form action="Report.jsp">
        <button class="btn btn-dark">Report</button>
    </form>
</div>

<hr>

<div class="p-3">
<table class="table">
    <thead>
    <tr>
        <th>Id</th>
        <th>FullName</th>
        <th>Groups</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Student student : students) {
    %>
    <tr>
        <td><%=student.getId()%>
        </td>
        <td><%=student.getFullName()%>
        </td>
        <td><%=student.getGroups().getName()%>
        </td>
        <td>
            <form action="Groups.jsp">
                <button class="btn btn-dark">Back</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</div>


<%
    if (id != null){
        long count = StudentRepo.count(search, Integer.parseInt(id));
        int pageCount = (int) Math.ceil(count / 10.0);
        for (int i = 1; i <= pageCount; i++) {
%>

<a href="?page=<%=i%>&search=<%=search%>&<%=id%>" class="btn btn-dark"><%=i%>
</a>

<%
        }
    }
%>

</body>
</html>
