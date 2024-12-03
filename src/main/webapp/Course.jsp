<%@ page import="uz.pdp.demo9.studycenter.repo.CourseRepo" %>
<%@ page import="uz.pdp.demo9.studycenter.Course" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Courses</title>
</head>
<body>

<%
    List<Course> courses = CourseRepo.getAllCourses();
%>

<table class="table">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Course course : courses) {
    %>
    <tr>
        <td><%=course.getId()%>
        </td>
        <td><%=course.getName()%>
        </td>
        <td>
            <form action="Module.jsp">
                <input type="hidden" name="id" value="<%=course.getId()%>">
                <button class="btn btn-dark">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="lucide lucide-arrow-right">
                        <path d="M5 12h14"></path>
                        <path d="m12 5 7 7-7 7"></path>
                    </svg>
                    go
                </button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
