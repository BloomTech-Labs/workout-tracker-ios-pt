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
    
    var userController: UserController?
    var player: AVPlayer?
    let videoURL = Bundle.main.url(forResource: "workoutvid", withExtension: "mp4")!
    var playerItem: AVPlayerItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getStartedButton.layer.cornerRadius = 10
        getStartedButton.layer.maskedCorners = [.layerMinXMinYCorner]
        playerItem = AVPlayerItem(url: videoURL)
        playerItem!.videoComposition = createVideoComposition(for: playerItem!)
        
        playBackgroundVideo()
        
        
    }
    
    func playBackgroundVideo(){
        videoBackground.layer.opacity = 0.5
        player = AVPlayer(playerItem: playerItem)
        
        player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.videoBackground.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.videoBackground.layer.addSublayer(playerLayer)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        player!.seek(to: CMTime.zero)
        player!.play()
        self.player?.isMuted = true
        
    }
    
    @objc func playerItemDidReachEnd(notification: Notification){
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: CMTime.zero, completionHandler: nil)
        }
        
    }
    
    func createVideoComposition(for playerItem: AVPlayerItem) -> AVVideoComposition {
        let composition = AVVideoComposition(asset: playerItem.asset, applyingCIFiltersWithHandler: { request in
            
            guard let filter = CIFilter(name: "CIColorMonochrome") else { return request.finish(with: NSError())}
            filter.setValue(request.sourceImage, forKey: kCIInputImageKey)
            filter.setValue(CIColor(red: 212.0/255.0, green: 104.0/255.0, blue: 41.0/255.0), forKey: kCIInputColorKey)
            
            return request.finish(with: filter.outputImage!, context: nil)
            
        })
        return composition
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSignUp" {
            guard let signupVC = segue.destination as?
            SignupVC else {return}
            //signupVC.userController = userController
        }
    }
}
