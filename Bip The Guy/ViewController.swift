//
//  ViewController.swift
//  Bip The Guy
//
//  Created by Tom Kotopoulos on 2/4/19.
//  Copyright © 2019 Tom Kotopoulos. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageToPunch: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    @IBAction func takePhotoPressed(_ sender: UIButton) {
    }
    
    @IBAction func imagePressed(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(soundName: "punchSound", audioPlayer: &audioPlayer)
    }
    
    func animateImage(){
        
        let bounds = self.imageToPunch.bounds
        let shrinkValue: CGFloat = 60
        
        //shrink our imageToPunch by 60pxs
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + shrinkValue , y: self.imageToPunch.bounds.origin.y + shrinkValue , width: self.imageToPunch.bounds.size.width - shrinkValue, height: self.imageToPunch.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: { self.imageToPunch.bounds = bounds }, completion: nil)
    }
    
    //Play a sound
    func playSound (soundName: String, audioPlayer: inout AVAudioPlayer){
        //can we load in the file soundName
        if let sound = NSDataAsset(name: soundName){
            
            //check to see if sound.data is actually a sound file and play
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
                // catch error if sound.data isn't a sound file
            } catch {
                print("ERROR: The data in \(soundName) couldn't be loaded")
            }
        }else{
            print("ERROR: The file \(soundName) didn't load")
        }
    }
    
}

