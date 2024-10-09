const fs = require('fs');
require('dotenv').config();

const environmentProdFile = `export const environment = {
  production: true,
  API_URL: '${process.env.API_URL || 'api_url not found'}',
  envs: ${JSON.stringify(process.env)}
};
`;

console.log(process.env.API_URL);

try {

  fs.writeFile('../src/environments/environment.ts', environmentProdFile, function (err) {
    if (err) {
      console.log(err);
    } else {
      console.log('Environment file generated successfully.');
    }
  });
}catch(e) {
  fs.writeFile('./src/environments/environment.ts', environmentProdFile, function (err) {
    if (err) {
      console.log(err);
    } else {
      console.log('Environment file generated successfully.');
    }
  });
}
