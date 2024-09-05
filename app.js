const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const app = express();

// Configuración de CORS
app.use(cors());


const PORT = 4000; // Puerto específico

// Configurar la conexión a la base de datos MySQL
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'playsports'
});

// Conectar a la base de datos
connection.connect((err) => {
  if (err) {
    console.error('Error al conectar a la base de datos:', err);
    return;
  }
  console.log('Conexión a la base de datos MySQL establecida');
});

// Middleware para parsear JSON
app.use(express.json());

// Ruta para agregar una nueva persona
app.post('/register/registraUsuario', (req, res) => {
    const { nombre, telefono, correo, password} = req.body;
    connection.query('INSERT INTO usuario (nombre, telefono, correo, password) VALUES (?, ?, ?, ?)', [nombre, telefono, correo, password], (err, results) => {
      if (err) {
        console.error('Error al agregar la persona:', err);
        res.status(500).json({ error: 'Error interno del servidor' });
        return;
      }
      res.status(201).json({ message: 'Persona agregada exitosamente' });
    });
  });

app.listen(PORT, () => {
    console.log(`Servidor escuchando en el puerto ${PORT}`);
});

