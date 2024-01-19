//
//  ViewController.swift
//  falinskaPracticalMockCodingOne
//
//  Created by Weronika E. Falinska on 16/01/2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var rotationSlider: UISlider!
    @IBOutlet weak var sizeSlider: UISlider!
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        // Hiding the image before user interaction
        imageView.isHidden = true
        
        // Disabling sliders until image is added
        controllersEnabling()
        
        // Hiding reset button
        resetButton.isHidden = true
        
        // Adding border to the imageView for visibility
        imageView.layer.borderWidth = 5
        imageView.layer.cornerRadius = 20
        imageView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func addImageButton(_ sender: UIButton) {
        // Making image visible on button click
        imageView.isHidden = false
        controllersEnabling()
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        // create the alert
        playSound()
        let alert = UIAlertController(title: "Message from Fluffy", message: "Too late. I am your lord now. ", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        present(alert, animated: true, completion: nil)
    }


       @IBAction func sliderChanged(_ sender: UISlider) {
           updateImage()
       }

       func updateImage() {
           var imageSize: CGFloat = 0
           var imageRotation: CGFloat = 0

           if !imageView.isHidden {
               imageSize = CGFloat(sizeSlider.value)
               imageRotation = CGFloat(rotationSlider.value * (2 * Float.pi))

               // Apply transformations to the imageView
               imageView.transform = CGAffineTransform.identity
                   .scaledBy(x: imageSize, y: imageSize)
                   .rotated(by: imageRotation)
           }
       }

       func controllersEnabling() {
           if imageView.isHidden == true {
               sizeSlider.isEnabled = false
               rotationSlider.isEnabled = false
           } else {
               sizeSlider.isEnabled = true
               rotationSlider.isEnabled = true
               resetButton.isHidden = false
           }
       }

       func playSound() {
           let url = Bundle.main.url(forResource: "evil", withExtension: "mp3")

           player = try! AVAudioPlayer(contentsOf: url!)
           player.play()
       }
   }
