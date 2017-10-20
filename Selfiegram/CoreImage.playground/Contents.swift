import UIKit
import PlaygroundSupport

let container = UIView(frame: CGRect(x: 0, y: 0, width: 604, height: 1000))
//var photo = CIImage(image: UIImage(named: "12.jpg")!)
//let vignette = CIFilter(name: "CIVignette", withInputParameters: [kCIInputImageKey : photo!, kCIInputRadiusKey : 5, kCIInputIntensityKey : 5])?.outputImage
//let aImage = UIImage(ciImage: vignette!)
//let view = UIImageView(image: aImage)

PlaygroundPage.current.liveView = container


class FilterView {

    var view:UIView?

    var originalImage:CIImage
    var filterName:String
    var paramName:String

    init(filterName:String, paramName:String, originalImage:CIImage)
    {
        self.originalImage = originalImage
        self.filterName = filterName
        self.paramName = paramName

        addFilter(image: originalImage)
    }

    func addFilter(image:CIImage)
    {
        view?.removeFromSuperview()
        view = UIImageView(image: UIImage(ciImage: image))
        container.addSubview(view!)
    }

    @objc func sliderWasChanged(sender:UISlider)
    {
        let value = NSNumber(value: sender.value)
        let filter = CIFilter(name: filterName, withInputParameters: [kCIInputImageKey : originalImage ,paramName : value])
        addFilter(image: filter!.outputImage!)
    }
}

// Instance
let photo = CIImage(image: UIImage(named: "12.jpg")!)
let filterView = FilterView(filterName: "CIHueAdjust", paramName: kCIInputAngleKey, originalImage: photo!)

// UI
let slider = UISlider(frame: CGRect(x: 70, y: 700, width: 450, height: 100))
slider.minimumValue = -3.14
slider.maximumValue = 3.14
slider.addTarget(filterView, action: #selector(FilterView.sliderWasChanged(sender:)), for: .valueChanged)

container.addSubview(slider)

//Save
//UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)

