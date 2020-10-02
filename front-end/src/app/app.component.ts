import { Component } from '@angular/core';
import { AuthenticationService } from './_services/authentication.service';
import { Role } from './_models/role';
import { User } from './_models/user';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'front-end';

  user: User;

  constructor(private authenticationService$: AuthenticationService) {
    this.authenticationService$.user.subscribe(x => this.user = x);
  }

  get isAdmin() {
    return this.user && this.user.role === Role.Admin;
  }
}
