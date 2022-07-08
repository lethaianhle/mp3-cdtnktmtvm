import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/shared/services/auth.service';
import { MessagesService } from 'src/app/shared/services/messages.service';
import { PlaylistService } from 'src/app/shared/services/playlist.service';

@Component({
  selector: 'app-playlist',
  templateUrl: './playlist.component.html',
  styleUrls: ['./playlist.component.scss']
})
export class PlaylistComponent implements OnInit {

  showDone: boolean=true
  showCreate:boolean=false
  playlists:any
  checklist:boolean[]
  selectedItem:number=0
  song:any=null
inputForm: FormGroup
  constructor(private playlistService: PlaylistService,
    private authService: AuthService,
    private router: Router,
    private message: MessagesService) { }

  ngOnInit() {
    this.inputForm = new FormGroup({
      name: new FormControl(null, {validators: [Validators.required]})
    });
    this.getAllPlaylistOfUser()
   
    this.playlistService.song.subscribe(
      (song)=>{
        this.song=song
      }
    )
   
  }
  public tasks = [
    { done: true, description: "Research" },
    { done: true, description: "Implement" },
    { done: false, description: "Test" }
];

selectItem(index,playlistId)
{
  this.checklist.fill(false)
  this.checklist[index]=true
  this.selectedItem=playlistId
  console.log("playlist id:" +playlistId)
}
showFormCreate()
{
  this.showCreate= true;
  this.showDone=false
}
showFormDone()
{
  this.showCreate= false;
  this.showDone=true;
}

getAllPlaylistOfUser()
{
  if(this.authService.isArtist())
  {
    let userId=this.authService.getUser().id;
  this.playlistService.getAllPlaylist(userId).subscribe(
    res=>{
        this.playlists=res
       
        this.checklist= new Array(this.playlists.length).fill(false)
    }
  )
  }
}

createPlaylist()
{
  let name =this.inputForm.value.name;
  let userId= this.authService.getUser().id
  this.playlistService.createPlaylist(name,userId).subscribe(
    res=>{

          this.message.success("Create successful")
          this.inputForm.reset()
          this.showFormDone()
          window.location.reload()
    }
  )

}

addSongToPlaylist()
{
  console.log(this.selectedItem)
    let song= this.song
    if(this.selectedItem!=0 )
    {
    this.playlistService.addSongToPlayList(this.selectedItem,song).subscribe(
      res=>{
        this.message.success("Added")
            this.playlistService.setSong(null)
      }
    )
    }
    this.playlistService.setSong(null)
}

closePlaylist()
{
  this.playlistService.setSong(null)
}


}
