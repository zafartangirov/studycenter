<%@ page import="uz.pdp.demo9.studycenter.repo.GroupsRepo" %>
<%@ page import="uz.pdp.demo9.studycenter.Groups" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Groups</title>
</head>
<body>

<%
    List<Groups> groups = GroupsRepo.getAllGroups();
    String id = request.getParameter("id");

    String search = Objects.requireNonNullElse(request.getParameter("search"), "");
    int pagejon = Integer.parseInt(Objects.requireNonNullElse(request.getParameter("page"), "1"));
    if (id != null){
        groups = GroupsRepo.getGroupsList(Integer.parseInt(id), pagejon, search);
    }
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
        <th>Module</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Groups group : groups) {
    %>
    <tr>
        <td><%=group.getId()%>
        </td>
        <td><%=group.getName()%>
        </td>
        <td><%=group.getModule().getName()%>
        </td>
        <td>
            <div class="btn-group">
                <form action="Payment.jsp">
                    <input type="hidden" name="groupId" value="<%=group.getId()%>">
                    <button class="btn btn-dark">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                             class="lucide lucide-arrow-right">
                            <path d="M5 12h14"></path>
                            <path d="m12 5 7 7-7 7"></path>
                        </svg>
                        payments
                    </button>
                </form>
                <form action="Module.jsp?groupId=1">
                    <button class="btn btn-dark my - 2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                             class="lucide lucide-circle-arrow-left">
                            <circle cx="12" cy="12" r="10"></circle>
                            <path d="M16 12H8"></path>
                            <path d="m12 8-4 4 4 4"></path>
                        </svg>
                        back
                    </button>
                </form>
                <form action="Student.jsp">
                    <input type="hidden" name="groupId" value="<%=group.getId()%>">
                    <button class="btn btn-dark my-2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                             class="lucide lucide-arrow-right">
                            <path d="M5 12h14"></path>
                            <path d="m12 5 7 7-7 7"></path>
                        </svg>
                        students
                    </button>
                </form>
            </div>
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
        long count = GroupsRepo.count(search, Integer.parseInt(id));
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
