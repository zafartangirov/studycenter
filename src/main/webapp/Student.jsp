<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.demo9.studycenter.Student" %>
<%@ page import="uz.pdp.demo9.studycenter.repo.StudentRepo" %>
<%@ page import="uz.pdp.demo9.studycenter.Payment" %>
<%@ page import="uz.pdp.demo9.studycenter.repo.PaymentRepo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Students</title>
</head>
<body>

<%
    List<Payment> payments = PaymentRepo.getAllPayments();
    String groupId = request.getParameter("groupId");
    if (groupId != null) {
        payments = PaymentRepo.getStudentsAndPayments(Integer.parseInt(groupId));
    }
%>

<table class="table">
    <thead>
    <tr>
        <th>Full name</th>
        <th>Total payment</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Payment payment : payments) {
    %>
    <tr>
        <td><%=payment.getStudent().getFullName()%>
        </td>
        <td><%=payment.getAmount()%>
        </td>
        <td>
            <div class="btn btn-group">
                <form action="AddPayment.jsp">
                    <input type="hidden" name="studentId" value="<%=payment.getStudent().getId()%>">
                    <input type="hidden" name="groupId" value="<%=groupId%>">
                    <button class="btn btn-dark">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                             class="lucide lucide-plus">
                            <path d="M5 12h14"></path>
                            <path d="M12 5v14"></path>
                        </svg>
                        Add payment
                    </button>
                </form>
                <form action="Groups.jsp">
                    <button class="btn btn-dark">
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
