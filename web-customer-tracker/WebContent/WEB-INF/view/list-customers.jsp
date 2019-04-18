<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Customer</title>

<link type="text/css"
	  rel="stylesheet"
	  href="${pageContext.request.contextPath}/resources/style.css"/>

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>
	
	<div id="contener">
		<div id ="conntent">
		
			<input type="button" value="Add Customer"
				   onclick="window.location.href='showFormForAdd'; return false; "
				   class="add-button"
			/>
		
			<table>
				<tr>
					<th>Id</th>
					<th>Id DB</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
					
				</tr>
				
				<c:set var="evenCount" value="${0}" /> 
				
				<c:forEach var="tempCustomer"  items="${customers}">
					<c:set var="evenCount" value="${evenCount+1}" /> 
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id }"></c:param>
					</c:url>
					
					<c:url var="deleteLink" value="/customer/deleteCustomer">
						<c:param name="customerId" value="${tempCustomer.id }"></c:param>
					</c:url>
					
					<tr>
						<td> ${evenCount} </td>
						<td> ${tempCustomer.id} </td>
						<td> ${tempCustomer.firstName} </td>
						<td> ${tempCustomer.lastName} </td>
						<td> ${tempCustomer.email} </td>
						<td><a href="${updateLink}">Update</a>
						|
						<a href="${deleteLink}"
						onclick="if(!(confirm('Are you sure you want to delete this customer'))) return false">Delete</a></td>
						
					</tr>
				
				</c:forEach>
			</table>
		
		</div>
	</div>

</body>

</html>