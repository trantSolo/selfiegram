//
//  FIlterViewController.swift
//  Selfiegram
//
//  Created by Trant Solo on 11.10.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit

class FIlterViewController: UIViewController {

    @IBOutlet var filterImage: UIImageView!

    @IBOutlet var monochromeButton: UIButton!
    @IBOutlet var vignetteButton: UIButton!
    @IBOutlet var hueButton: UIButton!
    
    @IBOutlet var slider: UISlider!
    
    var currentFilterButton = ""
    var segueImage:UIImage?
    var filter:CIFilter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterImage.image = segueImage
        slider.isHidden = true
    }
 
    @IBAction func saveToLibButton(_ sender: UIButton)
    {
        // Save to lib
        let context = CIContext(options: nil)
        if let cgimg = context.createCGImage((filter?.outputImage)!, from: (filter?.outputImage?.extent)!) {
            let processedImage = UIImage(cgImage: cgimg)
            UIImageWriteToSavedPhotosAlbum(processedImage, nil, nil, nil)
        }
        let alert = UIAlertController(title: "Photo was saved",
                                     message: "Now you can post this!",
                                     preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showFilters(_ sender: UIButton)
    {
        let ciSegueImage = CIImage(image: segueImage!)

        switch sender {
            case monochromeButton:
                filterImage.image = UIImage(ciImage: (CIFilter(name: "CIPhotoEffectTonal", withInputParameters: [kCIInputImageKey : ciSegueImage!])?.outputImage!)!)
                slider.isHidden = true
            case vignetteButton:
                installSlider(minimumValue: 0, maximumValue: 3, isHidden: false)
                currentFilterButton = "vignetteButton"
            case hueButton:
                installSlider(minimumValue: -3.14, maximumValue: 3.14, isHidden: false)
                currentFilterButton = "hueButton"
            default: break
        }
    }
    
    @IBAction func sliderWasChanged(_ sender: UISlider)
    {
        slider.addTarget(self, action: #selector(FIlterViewController.sliderChanged(sender:)), for: .touchUpInside)
    }
    
    @objc func sliderChanged(sender:UISlider)
    {
        let ciSegueImage = CIImage(image: segueImage!)
        let value = NSNumber(value: sender.value)
        
        switch currentFilterButton {
        case "vignetteButton":
            filter = CIFilter(name: "CIVignette", withInputParameters: [kCIInputImageKey : ciSegueImage!, kCIInputRadiusKey : value, kCIInputIntensityKey : 5])!
        case "hueButton":
            filter = CIFilter(name: "CIHueAdjust", withInputParameters: [kCIInputImageKey : ciSegueImage!, kCIInputAngleKey : value])!
        default: break
        }
        filterImage.image = UIImage(ciImage: filter!.outputImage!)
    }
    
    func installSlider(minimumValue: Float, maximumValue:Float, isHidden:Bool)
    {
        slider.minimumValue = minimumValue
        slider.maximumValue = maximumValue
        slider.isHidden = isHidden
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
