<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="cac.conexion.sql.MySQLConexion"%>
<%@ page import="java.sql.*"%>
<%
	MySQLConexion sql = new MySQLConexion();
	Connection cn = sql.connect();
	
	String name = request.getParameter("nombre");
	String lastname = request.getParameter("apellido");
	String email = request.getParameter("mail");
	String quantity = request.getParameter("cantidad");
	String category = request.getParameter("categoria");
	String price = request.getParameter("precio");
	
	//debug purposes 
	//out.println(name + lastname + email + quantity + category);
	
	String query = "INSERT INTO tickets (nombre,apellido,mail,cantidad,categoria) VALUES('" + name + "','" + lastname + "','" + email + "','" + quantity + "','" + category + "')";
	try{
		Statement stm = cn.createStatement();
		stm.executeUpdate(query);
		System.out.println("Data loaded");
	}
	catch(Exception e){
		e.printStackTrace();
		System.out.println("ERROR loading data");
	}	
	%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trabajo Codo A Codo - Compra realizada!</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/custom.css">
</head>
<body>
    <div class="container p-4">
        <div class="row">
            <div class="justify-content-center d-flex">
                <div class="card w-50">
                    <div class="card-body p-2">
                        <h3 class="card-title m-2">Resumen de compra</h3>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Nombre completo: <% out.println(name + " " + lastname); %> </li>
                        <li class="list-group-item">Mail: <% out.println(email); %></li>
                        <li class="list-group-item">Cantidad: <% out.println(quantity); %></li>
                        <li class="list-group-item">Categoria: <% out.println(category); %></li>
                    </ul>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md">
                            <div class="d-grid">
                                <h5 class="mt-1"><strong>Total:</strong> $<% out.println(price); %></h5>
                            </div>
                            </div>
                            <div class="col-md">
                            <div class="d-grid">
                                <a href="../index.html" class="btn btn-green" id="btnResumen">
                                	Volver al inicio
                                </a>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

