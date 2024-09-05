let btnLogin = document.querySelector('#btnLogin')

btnLogin.addEventListener('click', (e) => {
    window.location.href = "login.html";
})

let formRegistro = document.querySelector('#formRegister')
formRegistro.addEventListener('submit', (e) => {
    e.preventDefault()

    const nombre = document.querySelector("#nombre").value
    const telefono = document.querySelector("#telefono").value
    const correo = document.querySelector("#correo").value
    const password = document.querySelector("#password").value

    fetch('http://localhost:4000/register/registraUsuario', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ nombre, telefono, correo, password })
      })
      .then(response => {
        if (!response.ok) {
          throw new Error('No se pudo agregar la persona');
        }
        return response.json();
      })
      .then(data => {
        console.log('UsuarioAgregado');
        Swal.fire({
          icon: 'success',
          title: 'Persona Agregada',
          text: data.message
        });
        addForm.reset();
      })
      .catch(error => {
        Swal.fire({
          icon: 'error',
          title: 'Error',
          text: error.message
        });
      });
    
    const datosRegistro = JSON.parse(localStorage.getItem('datosRegistro')) || []
    const validaRegistro = datosRegistro.find(infoReg => infoReg.correo === correo)

    if(validaRegistro){
        Swal.fire({
            icon: 'error',
            title: 'Error de datos',
            text: 'El correo ingresado ya existe.',
        })
        return
    }
    datosRegistro.push({nombre,telefono,correo,password})
    localStorage.setItem('datosRegistro', JSON.stringify(datosRegistro))

    Swal.fire({
        icon: 'success',
        title: 'Registro exitoso',
        text: 'Tu registro se ha realizado con éxito',
    })
    .then(() => {
        window.location.href = 'login.html'
    })
    
})