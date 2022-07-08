import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from '../shared/services/auth.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuardGuard implements CanActivate {

  constructor(private _auth: AuthService, private _router: Router){}
  

  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
      let isUser=false
      if(this._auth.isLogged()){

        if(!this._auth.isUser())
        {
          console.log("Is NOT Logged");
          this._router.navigate(['/login']);
        }
        return true;
      } else {
        console.log("Is NOT Logged");
        this._router.navigate(['/login']);
        return false;
      }

  }
  
}
