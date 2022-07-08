import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { MusicPlayerService } from '../../shared/services/music-player.service';
import { AuthService } from '../../shared/services/auth.service';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { MessagesService } from 'src/app/shared/services/messages.service';
import { CartService } from 'src/app/shared/services/cart.service';
import { UserService } from 'src/app/shared/services/user.service';

@Component({
  selector: 'app-song-card',
  templateUrl: './song-card.component.html',
  styleUrls: ['./song-card.component.scss']
})
export class SongCardComponent implements OnInit {

  @Input("song") song;
  @Input("user") user: any;
  @Output("deleted") deleted: EventEmitter<any> = new EventEmitter();
  @Output() songAddToCart: EventEmitter<any> = new EventEmitter<any>();
  @Output() songAddToPlaylist: EventEmitter<any> = new EventEmitter<any>();

  isOwner: boolean = false;
  isPlaying: boolean = false;
  playingSong: any = null;
  canAddToPlayList:boolean=false

  owned:boolean = false;
  constructor(private _player: MusicPlayerService, 
              private _auth: AuthService, 
              private _http: HttpClient, 
              private _msg: MessagesService,
              private cartService: CartService,
              private userService: UserService)
               { }

ngOnInit() {
  if (window.location.href!='http://localhost:4200/start')
  this.canAddToPlayList=true;
  if(this.user){
    this.song.user = this.user;
   
  }
  this.user =this._auth.getUser()
  this.checkOwn()
  
  // console.log(this._auth.getUser().id, this.song.user.id);
  // if(this._auth.isLogged()){
    
  //   if(!this._auth.getUser()){
  //     let interval = setInterval(()=>{
        
  //       if(this._auth.getUser()){            
  //         if(this._auth.user.id == this.song.user.id){
  //           this.isOwner = true;
  //         }
  //         clearInterval(interval);
  //       }
  //     }, 1000);
  //   } else {
  //     if(this._auth.user.id == this.song.user.id){
  //       this.isOwner = true;
  //     }

  //   }
  // }

  // Playing song
  this._player.songObserve.subscribe(this.getPlayingSong.bind(this));
  this.getPlayingSong(this._player.playingSong)
  

  // Play or Pause observer
  this._player.playObserve.subscribe(play => {

    
    if(!this.playingSong || this.playingSong.id != this.song.id) return;

    this.isPlaying = play;

  });
}
onRightClick() {
  return false;
}
playSong(){

  if(this.playingSong && this.playingSong.id == this.song.id){
    
    if(this.isPlaying){
      this._player.pause();
    } else {
      this._player.play();
    }
    
  } 
  else if(this.user)
  {
    this.cartService.checkOwned(this.song.id,this.user.id).subscribe(
      res=> {
        console.log(res)
        if(res>0 || this._auth.isArtist()&&this._auth.getUser().artistId==this.song.artistId)
        {
          this._player.owner=true
        }
        else this._player.owner =false

        this._player.emitSong(this.song);
      }
    )
   
  }
  else{
    this._player.owner =false
    this._player.emitSong(this.song);
  }
  
}

getPlayingSong(song){
    if(song == null){
      this.playingSong = null;
      this.isPlaying = false;
    } else {
      this.playingSong = song;
      this.isPlaying = this.playingSong.id == this.song.id;
    }
}

checkOwn()
{
    let userId;
    
    if(this._auth.getUser()!=null)
    {
      userId=this._auth.getUser().id
      this.cartService.checkOwned(this.song.id,userId).subscribe(
        res=> {console.log("res"+ res)
          if(res>0)
          {
           this.owned=true
            
          }
        }
      )
    }
   
}
              
  bandSong()
  {
      this.userService.banSong(this.song.id,this.song.artistName,this.song.title).subscribe(
        res=>{
          this.song.banned=true
          this._msg.success("Ban song successful")
        }
      )
  }
  
  unBandSong()
  {
      this.userService.unBanSong(this.song.id,this.song.artistName,this.song.title).subscribe(
        res=>{
          this.song.banned=false
          this._msg.success("Unban song successful")
        }
      )
  } 
  addToCart()
  {
    this.songAddToCart.emit(this.song)
  }

  addToPlaylist()
  {
    this.songAddToPlaylist.emit(this.song)
  }
  


  // Delete the song
  delete(){
    if(!confirm(`Are you sure you want to delete "${this.song.name}"?`)){
      return;
    }

    let token = this._auth.getToken();

    let headers = new HttpHeaders()
        .set("Accept", "application/json")
        .set("Authorization", "Bearer " + token);

    this._http.delete(environment.url + "api/songs/" + this.song.id, {
      headers: headers
    }).subscribe(
      ()=>{
        this.deleted.emit();

        this._msg.success("Congratulations!", "Your song deleted successfully");

        // Decrease number of songs
        this._auth.addSongNumber(-1);
      },
      ()=>{
        this._msg.danger("Error!", "Check you internet connection or try latter");
      },
      ()=>{},
    );
    

  }
  


}


