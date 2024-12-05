<%@ page import="uz.pdp.demo9.studycenter.repo.StudentRepo" %>
<%@ page import="uz.pdp.demo9.studycenter.Student" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Add Payment</title>
</head>
<body>

<%
    Integer groupId = Integer.parseInt(request.getParameter("groupId"));
    List<Student> students = StudentRepo.getAllStudents();
%>

<div class="row">
    <div class="col-6 offset-3">
        <div class="card">
            <div class="card-header">
                Add payment
            </div>
            <div class="card-body">
                <form action="/add/payment" method="post">
                    <input type="hidden" name="groupId" value="<%=groupId%>">
                    <input class="form-control" type="number"
                           placeholder="Amount" name="amount">
                    <select class="form-control" name="studentId">
                        <option selected value="">Select student</option>
                        <%
                            for (Student student : students) {
                                if (student.getGroups().getId().equals(groupId)){
                        %>
                        <option value="<%=student.getId()%>"><%=student.getFullName()%>
                        </option>
                        <%
                                }
                            }
                        %>
                    </select>
                    <button class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>
