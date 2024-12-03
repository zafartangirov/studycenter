<%@ page import="uz.pdp.demo9.studycenter.repo.GroupsRepo" %>
<%@ page import="uz.pdp.demo9.studycenter.Groups" %>
<%@ page import="java.util.List" %>
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
    if (id != null){
       groups = GroupsRepo.getGroupsById(Integer.parseInt(id));
    }
%>

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
                <form action="Student.jsp">
                    <input type="hidden" name="groupId" value="<%=group.getId()%>">
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
                <form action="Module.jsp">
                    <button class="btn btn-dark">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                             class="lucide lucide-circle-arrow-left">
                            <circle cx="12" cy="12" r="10"/>
                            <path d="M16 12H8"/>
                            <path d="m12 8-4 4 4 4"/>
                        </svg>
                        back
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

</body>
</html>
