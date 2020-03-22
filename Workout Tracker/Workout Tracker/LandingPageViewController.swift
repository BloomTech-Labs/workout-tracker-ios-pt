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
    let videoURL = Bundle.main.url(forResource: "workoutvid", withExtension: "mp4")!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getStartedButton.layer.cornerRadius = 10
        getStartedButton.layer.maskedCorners = [.layerMinXMinYCorner]
        let playerItem = AVPlayerItem(url: videoURL)
        playerItem.videoComposition = createVideoComposition(for: playerItem)
        playBackgroundVideo()
        
    }
    
    func playBackgroundVideo(){
        
       
        player = AVPlayer(url: videoURL)
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

    @objc func playerItemDidReachEnd(){
        player!.seek(to: CMTime.zero)
    }
    
    func createVideoComposition(for playerItem: AVPlayerItem) -> AVVideoComposition {
       let composition = AVVideoComposition(asset: playerItem.asset, applyingCIFiltersWithHandler: { request in
         // Here we can use any CIFilter
         guard let filter = CIFilter(name: "CIColorMonochrome") else {
           return request.finish(with: NSError())
         }
         filter.setValue(request.sourceImage, forKey: "inputImage")
         filter.setValue(CIColor(red: 212, green: 104, blue: 41), forKey: "inputColor")

         filter.setValue(1.0, forKey: "inputIntensity")
         return request.finish(with: filter.outputImage!, context: nil)
       })
       return composition
     }
}
