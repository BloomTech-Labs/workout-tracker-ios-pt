//
//  LandingPageViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 2/17/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit
import AVFoundation

class LandingPageViewController: UIViewController {

    @IBOutlet weak var videoBackground: UIView!
    @IBOutlet weak var getStartedButton: UIButton!
    
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getStartedButton.layer.cornerRadius = 10
        getStartedButton.layer.maskedCorners = [.layerMinXMinYCorner]
        playBackgroundVideo()
        
    }
    
    func playBackgroundVideo(){
        guard let path = Bundle.main.path(forResource: "workoutvid", ofType: "mp4") else { return}
        player = AVPlayer(url: URL(fileURLWithPath: path))
        player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.videoBackground.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.videoBackground.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        player!.seek(to: CMTime.zero)
        player!.play()
        self.player?.isMuted = true
        
    }

    @objc func playerItemDidReachEnd(){
        player!.seek(to: CMTime.zero)
    }
   
}
