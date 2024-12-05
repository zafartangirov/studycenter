<%@ page import="uz.pdp.demo9.studycenter.repo.GroupsRepo" %>
<%@ page import="uz.pdp.demo9.studycenter.Groups" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Add student</title>
</head>
<body>

<%
    String id = request.getParameter("groupId");
    Groups groups = GroupsRepo.getAllGroups().stream().filter(item -> item.getId().equals(Integer.parseInt(id))).findFirst().orElseThrow();
%>

<div class="row">
    <div class="col-6 offset-3">
        <div class="card">
            <div class="card-header">
                Add student for <%=groups.getName()%>
            </div>
            <div class="card-body">
                <form action="/student/add" method="post">
                    <input class="form-control" type="text" placeholder="FullName" name="fullName">
                    <input type="hidden" name="groupId" value="<%=groups.getId()%>">
                    <button class="btn btn-success my-2">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
