import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { AuthGuard } from './_helpers/auth.guard';


const routes: Routes = [
  {path: '', component: HomeComponent, canActivate: [AuthGuard]},
  { path: 'login', component: LoginComponent },

  {path: 'social', loadChildren: () => import('src/app/modules/social/social.module').then(mod => mod.SocialModule), canActivate:[AuthGuard]},
  {path: 'profissional', loadChildren: () => import('src/app/modules/profissional/profissional.module').then(mod => mod.ProfissionalModule), canActivate:[AuthGuard]},
  {path: 'dashboard', loadChildren: () => import('src/app/modules/dashboard/dashboard.module').then(mod => mod.DashboardModule), canActivate:[AuthGuard]},
  {path: 'analytics', loadChildren: () => import('src/app/modules/analytics/analytics.module').then(mod => mod.AnalyticsModule), canActivate:[AuthGuard]},

  { path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
