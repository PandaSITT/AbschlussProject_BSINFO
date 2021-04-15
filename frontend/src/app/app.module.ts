import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { DataTablesModule } from 'angular-datatables';

import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { RaumViewComponent } from './raum-view/raum-view.component';
import { AdminViewComponent } from './admin-view/admin-view.component';
import { ContentBoxComponent } from './_template/content-box/content-box.component';
import { HeaderComponent } from './_template/header/header.component';

@NgModule({
  declarations: [
    AppComponent,
    RaumViewComponent,
    AdminViewComponent,
    ContentBoxComponent,
    HeaderComponent
  ],
  imports: [
    BrowserModule,
    DataTablesModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
