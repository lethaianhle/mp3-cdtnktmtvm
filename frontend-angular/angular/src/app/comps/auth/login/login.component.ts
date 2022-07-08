import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { AuthService } from 'src/app/shared/services/auth.service';
import { CartService } from 'src/app/shared/services/cart.service';
import { MessagesService } from 'src/app/shared/services/messages.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  loginForm: FormGroup;
  wrongInfo: boolean = false;

  isLoading: boolean = false;

  constructor(private _auth: AuthService, private _msg: MessagesService,private cartService: CartService) { }

  ngOnInit() {
    this.loginForm = new FormGroup({
      email: new FormControl(null, {validators: [Validators.required]}),
      password: new FormControl(null, {validators: [Validators.required, Validators.minLength(6)]})
    });
  }

  loginSubmit(){
    let email = this.loginForm.value.email;
    let password = this.loginForm.value.password;

    this.isLoading = true;
    // Log the use in
    this._auth.login(email, password).subscribe(
      (data: any)=>{
        //this._auth.storeData(data.expires_in, data.access_token, data.refresh_token)
        console.log(data)
        this._auth.storeUser(data)
        this._auth.storeData(data.timeExpire,data.accessToken,data.accessToken,false)
        console.log("assadd")
        
       this._auth.logged=true
        this._msg.success("Login success");
        this.cartService.getTotalItemAfterLogin()
        this._auth.refresh()
        window.location.reload()
        
      },
      (error: any)=>{
        if(error.status == 400){
          this.wrongInfo = true;
        } else {
          if(error.error.message=="Error: Unauthorized")
          this._msg.danger("Error!", "Wrong username or password");
          else
          this._msg.danger("Error!", "Check you internet connection or try latter");
        }
        this.isLoading = false;
      },
      ()=>{
        this.isLoading = false;
      }
    );

  }

  /**
   * Return whether the control is valid or not
   * @param controlName string
   */
  invalid(controlName){
    let control = this.loginForm.get(controlName);
    return control.touched && control.invalid;
  }


}
