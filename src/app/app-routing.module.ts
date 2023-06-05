import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

import { AuthGuard } from './auth.guard';

const routes: Routes = [
  {
    path: 'auth',
    loadChildren: () => import('./module/auth/auth.module').then((m) => m.AuthModule),
  },
  {
    path: '',
    canActivate: [AuthGuard],
    loadChildren: () => import('./module/admin/admin.module').then((m) => m.AdminModule),
  },
  { path: '**', redirectTo: 'auth', pathMatch: 'full' },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, {
      scrollPositionRestoration: 'enabled',
      preloadingStrategy: PreloadAllModules,
    }),
  ],
  exports: [RouterModule],
})
export class AppRoutingModule {}
