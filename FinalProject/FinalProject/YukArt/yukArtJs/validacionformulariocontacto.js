
    const form = document.getElementById("form");
    const nameInput = document.getElementById("name");
    const emailInput = document.getElementById("email");
    const telefonoInput = document.getElementById("Telefono");
    const comentarioInput = document.getElementById("comentario");
    const warnings = document.getElementById("warnings");

    form.addEventListener("submit", function(event) {
        event.preventDefault();
        let valid = true;
        warnings.innerHTML = "";

      
        if (nameInput.value.trim() === "") {
            warnings.innerHTML += "<p>Por favor, introduzca su nombre</p>";
            valid = false;
        }

        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(emailInput.value)) {
            warnings.innerHTML += "<p>Por favor, introduzca un correo electrónico válido</p>";
            valid = false;
        }


        const telefonoPattern = /^\d{10}$/;
        if (!telefonoPattern.test(telefonoInput.value)) {
            warnings.innerHTML += "<p>Por favor, introduzca un número de teléfono de 10 dígitos</p>";
            valid = false;
        }

        if (comentarioInput.value.trim() === "") {
            warnings.innerHTML += "<p>Por favor, introduzca un comentario</p>";
            valid = false;
        }


        if (valid) {
            form.submit();
        }
    });

