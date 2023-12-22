const btnResumen = document.getElementById("btnResumen");
const inputCategoria = document.getElementById("inputCategoria");
const inputCantidad = document.getElementById("inputCantidad");
const inputNombre = document.getElementById("inputNombre");
const inputApellido = document.getElementById("inputApellido");
const inputEmail = document.getElementById("inputEmail");

btnResumen.addEventListener("click",(e)=>{    
    nombreCategoria = inputCategoria.value;

    // Validar inputs
    if((inputNombre.value == '')
        ||(inputApellido.value == '')
        ||(!inputEmail.value.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/))
        ||(inputCantidad.value <= 0)
        ||(inputCategoria.value == ""))
        return;

    let categoria = {
        'Estudiante' : 80,
        'Trainee': 50,
        'Junior': 15
    };

    let precioTotal = 200 * Math.abs(inputCantidad.value);
    let precioConDescuento = precioTotal - (precioTotal * (categoria[nombreCategoria] / 100));

	document.getElementById("precio").value = precioConDescuento;
    document.getElementById("precioTotal").innerText = precioConDescuento;
    document.getElementById("btnComprar").style.display = "block";
});