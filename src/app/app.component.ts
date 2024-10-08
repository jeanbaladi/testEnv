import { Component } from '@angular/core';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-root',
  template: '<p>apiUrl: {{apiUrl}}</p><p>is production: {{isProd}}</p>',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  apiUrl = environment.API_URL;
  isProd = environment.production;
}
