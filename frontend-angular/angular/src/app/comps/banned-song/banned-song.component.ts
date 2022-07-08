import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { fadeTrigger, songCardTrigger } from 'src/app/shared/animations/animations';
import { AuthService } from 'src/app/shared/services/auth.service';
import { CartService } from 'src/app/shared/services/cart.service';
import { MessagesService } from 'src/app/shared/services/messages.service';
import { PlaylistService } from 'src/app/shared/services/playlist.service';


@Component({
  selector: 'app-banned-song',
  templateUrl: './banned-song.component.html',
  styleUrls: ['./banned-song.component.scss'],
  animations: [songCardTrigger, fadeTrigger]
})
export class BannedSongComponent implements OnInit {
  logged: boolean = false;

  loading: boolean = false;
  nextPage: string = null;
  page:number
  user: any = null;
  songs: any[] = [];
  time: number = 100;
  count:any
  noPage:number

  constructor(private _auth: AuthService,
    private _http: HttpClient, 
   private playlistService: PlaylistService, 
    private cartService: CartService,
    private route: Router,
    private messageService: MessagesService) {
    this.logged = this._auth.isLogged();
   }

  ngOnInit() {
    this._auth.statusEmitter.subscribe(status => {
      this.logged = status;
    });
    this._http.get("http://localhost:8090/api/v1/songs/banned").subscribe(
     res=>{
       this.count=res
      this.noPage=this.count/4 
       this.page=0
       this.loadSong()
     }
   )
    
  }

  loadSong() {

    this.loading = true;
    // Search
    this._http
      .get(`http://localhost:8090/api/v1/songs/get-banned?page=${this.page}`)
      .subscribe(
        (res: any) => {
          this.user = null;
          let newSongs = res.map(s => {
            s.path = s.url;
            return s;
          });

          // Stagger animation
          for(let i = 0; i < newSongs.length; i++){
            setTimeout(()=>{
              this.songs.push(newSongs[i]);
            },i * this.time);
          }


        },
        error => {},
        () => {
          this.loading = false;
        }
      );
      this.page++
  }

  addToCart(song)
  {

   
    let userId;
    if(!this._auth.isLogged()) this.route.navigate(["/start/login"])
    userId=this._auth.getUser().id
    console.log(userId)
    this.cartService.checkOwned(song.id,userId).subscribe(
      res=> {console.log("res"+ res)
        if(res>0)
        {
         
          this.messageService.danger("You have own this song")
        }
        else {
          this.cartService.addToCart(song.id,song.price, song.title, userId,song.avatarImage,song.artistId).subscribe(
            res=> {
                this.cartService.setMyCount(res)
                
            }
          )
        }
      }
    )

   
  }

  addToPlaylist(song)
  {
    if(!this._auth.isLogged()) this.route.navigate(["/start/login"])
    console.log(song)
      this.playlistService.setSong(song)
  }
}
