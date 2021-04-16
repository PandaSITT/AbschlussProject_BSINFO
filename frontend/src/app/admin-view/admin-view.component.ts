import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-admin-view',
  templateUrl: './admin-view.component.html',
  styleUrls: ['./admin-view.component.sass']
})
export class AdminViewComponent implements OnInit {
  Users: any;
  dtOptions: DataTables.Settings = {};

  constructor(private http: HttpClient) {
    http.get('http://localhost:8080/users').subscribe(data => this.Users = data);
  }

  ngOnInit(): void {
    this.dtOptions = {
      pagingType: 'full_numbers',
      pageLength: 25,
      processing: true
    }
  }
}
