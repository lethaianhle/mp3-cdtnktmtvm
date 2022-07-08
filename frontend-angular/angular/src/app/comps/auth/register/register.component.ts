import { Component, OnInit } from "@angular/core";
import { FormGroup, Validators, FormControl } from "@angular/forms";
import { Router } from "@angular/router";
import { AuthService } from "src/app/shared/services/auth.service";
import { MessagesService } from "src/app/shared/services/messages.service";

@Component({
  selector: "app-register",
  templateUrl: "./register.component.html",
  styleUrls: ["./register.component.scss"],
})
export class RegisterComponent implements OnInit {
  registerForm: FormGroup;
  wrongInfo: boolean = false;

  isLoading: boolean = false;
  isArtist: boolean = false;

  constructor(
    private _auth: AuthService,
    private _msg: MessagesService,
    private router: Router
  ) {}

  ngOnInit() {
    this.registerForm = new FormGroup({
      name: new FormControl(null, {
        validators: [
          Validators.required,
          Validators.minLength(3),
          Validators.maxLength(255),
        ],
      }),
      email: new FormControl(null, {
        validators: [Validators.required, Validators.email],
      }),
      password: new FormControl(null, {
        validators: [Validators.required, Validators.minLength(6)],
      }),
      password_confirmation: new FormControl(null, {
        validators: [Validators.required],
      }),
    });
    this.isArtist = false;
  }

  registerSubmit() {
    let name = this.registerForm.value.name;
    let email = this.registerForm.value.email;
    let password = this.registerForm.value.password;
    let password_confirmation = this.registerForm.value.password_confirmation;

    this.isLoading = true;
    // Log the use in
    if (!this.isArtist) {
      this._auth.register(name, email, password).subscribe(
        (data: any) => {
          //this._auth.storeData(data.expires_in, data.access_token, data.refresh_token)

          // Sucess message
          this._msg.success(
            "Congratulations!",
            "Your new account created successfully"
          );
          this.router.navigate(["/login"])
        },
        (error: any) => {
          if (error.status == 401) {
            this.wrongInfo = true;
          } else {
            this._msg.danger(
              "Error!",
              "Check you internet connection or try latter"
            );
          }
          this.isLoading = false;
        },
        () => {
          this.isLoading = false;
        }
      );
    } else {
      this._auth.artistRegister(name, email, password).subscribe(
        (data: any) => {
          //this._auth.storeData(data.expires_in, data.access_token, data.refresh_token)

          // Sucess message
          this._msg.success(
            "Congratulations!",
            "Your new account created successfully"
          );
          this.router.navigate(['/start/login'])
        },
        (error: any) => {
          if (error.status == 401) {
            this.wrongInfo = true;
          } else {
            this._msg.danger(
              "Error!",
              "Check you internet connection or try latter"
            );
          }
          this.isLoading = false;
        },
        () => {
          this.isLoading = false;
        }
      );
    }
  }

  /**
   * Return whether the control is valid or not
   * @param controlName string
   */
  invalid(controlName) {
    let control = this.registerForm.get(controlName);
    console.log(control);
    return control.touched && control.invalid;
  }
  check() {
    this.isArtist = !this.isArtist;
    console.log(this.isArtist);
  }

  /**
   * Return true if the control has the specified error, false otherwise
   * @param controlName string
   * @param errorName string
   */
  hasError(controlName, errorName) {
    let control = this.registerForm.get(controlName);
    console.log(control);
    if (
      control.errors &&
      control.errors[errorName] &&
      this.invalid(controlName)
    ) {
      return true;
    }
    return false;
  }

  /**
   * Return true if the passwords don't match, fale otherwise
   */
  passwordsNotMatch() {
    return (
      this.registerForm.value.password !==
      this.registerForm.value.password_confirmation
    );
  }
}
