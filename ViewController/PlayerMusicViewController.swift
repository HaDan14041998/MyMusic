//
//  PlayerMusicViewController.swift
//  MyMusic
//
//  Created by Dan on 6/3/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerMusicViewController: UIViewController {
    
    //MARK: outlet
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var nameSong1: UILabel!
    
    @IBOutlet weak var singer1: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var buttonPlay: UIButton!
    //MARK: property
    
    var library = MusicModels().library
    var id : Int = 0
    var player:AVAudioPlayer = AVAudioPlayer()
    var checkPlay: Bool = true
    
    //MARK: functions
    
    @IBAction func playMusic(_ sender: Any)
    {
        if checkPlay {
            player.play()
            checkPlay = !checkPlay
            buttonPlay.setImage(UIImage(named: "pause.png"), for: .normal)
            
        } else {
            player.stop()
            checkPlay = !checkPlay
            buttonPlay.setImage(UIImage(named: "play.png")  , for: .normal)
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let image = library[id]["image"] {
            
            img.image = UIImage(named:"\(image).jpg")
        }
        nameSong1.text = library[id]["song"]
        singer1.text = library[id]["singer"]
        // Do any additional setup after loading the view.
        let audioPath = Bundle.main.path(forResource: "song", ofType: "mp3")!
        let url = URL(fileURLWithPath: audioPath)
        do
        {
            
            try player = AVAudioPlayer(contentsOf: url )
        }
        catch
        {
            print("ERROR")
        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
