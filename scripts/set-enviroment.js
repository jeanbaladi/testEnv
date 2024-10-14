const fs = require('fs');
require('dotenv').config({ path: `./scripts/.env` });

const argument = process.argv[2];
const api_url = () => {
  if(argument == "COBO")
    return process.env.API_URL_CO || 'api_url_co not found'
  return process.env.API_URL || 'api_url not found'
}
const envs = JSON.stringify(process.env);
const filePath = './src/environments/environment.prod.ts';
console.log(`El argumento que pasaste es: ${argument}`);

// Leer el archivo actual
fs.readFile(filePath, 'utf8', (err, data) => {
  if (err) {
    console.error('Error leyendo el archivo:', err);
    return;
  }

  // Usamos una expresión regular para encontrar y reemplazar el valor de API_URL
  const updatedData = data.replace(/API_URL:\s*'[^']*'/, `API_URL: '${api_url()}'`);

  // Sobreescribir el archivo con el contenido modificado
  fs.writeFile(filePath, updatedData, 'utf8', (err) => {
    if (err) {
      console.error('Error escribiendo el archivo:', err);
      return;
    }
    console.log('Archivo environment.ts actualizado exitosamente.');
  });
});

