const fs = require('fs');
const environmentProdFile = `export const environment = {
  production: true,
  API_URL: '${process.env.API_URL || 'api_url not found'}',
  envs: ${JSON.stringify(process.env)}
};
`;

fs.writeFile('./src/environments/environment.ts', environmentProdFile, function (err) {
  if (err) {
    console.log(err);
  } else {
    console.log('Environment file generated successfully.');
  }
});
