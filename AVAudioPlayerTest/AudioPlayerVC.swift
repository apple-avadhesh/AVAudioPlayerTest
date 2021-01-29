//
//  AudioPlayerVC.swift
//  AVAudioPlayerTest
//
//  Created by PC Gamer on 29/01/21.
//

import UIKit
import AVFoundation

class AudioPlayerVC: UIViewController {
    
    // Properties
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startAudio()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [self] in
            stopAudio()
        }
    }
    
    func startAudio() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setActive(true, options: [])
        } catch let error {
            print("Unable to active session \(error.localizedDescription)")
        }
        if (audioPlayer == nil) {
            let url = Bundle.main.url(forResource: "TestAudio", withExtension: "mp3")
            if let url = url {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                } catch let error {
                    print("Unable to initialize player \(error.localizedDescription)")
                }
            }
            audioPlayer?.numberOfLoops = 1
            audioPlayer?.volume = 1.0
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        }
    }
    
    func stopAudio() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
}

