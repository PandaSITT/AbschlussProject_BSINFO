import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.sass']
})
export class AppComponent {
  title = 'Abschlussprojekt';
  //greeting:any = {id: '212', content: 'schabernack'}

  constructor(private http: HttpClient) {
    //http.get('http://localhost:8080/resource').subscribe(data => this.greeting = data);
  }
}
