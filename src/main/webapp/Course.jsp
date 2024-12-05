<%@ page import="uz.pdp.demo9.studycenter.repo.CourseRepo" %>
<%@ page import="uz.pdp.demo9.studycenter.Course" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Courses</title>
</head>
<body>

<%
    String search = Objects.requireNonNullElse(request.getParameter("search"), "");
    int pagejon = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("page"), "1"));
    List<Course> courses = CourseRepo.getCourseList(pagejon, search);
%>

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
</div>

<%
    long count = CourseRepo.count(search);
    int pageCount = (int) Math.ceil(count / 10.0);
    for (int i = 1; i <= pageCount; i++) {
%>

<a href="?page=<%=i%>&search=<%=search%>" class="btn btn-dark"><%=i%>
</a>

<%
    }
%>

</body>
</html>
