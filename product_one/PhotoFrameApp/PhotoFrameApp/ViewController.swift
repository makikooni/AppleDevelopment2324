import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    let imageNames = ["cats", "fashion", "fashion","internet","matcha"]
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(imageNames.count), height: scrollView.frame.size.height)
        
        // Load the initial image
        imageView.image = UIImage(named: imageNames[currentIndex])

    }
  
    // Function to update the image based on user interaction (e.g., button press)
    func updateImage(index: Int) {
        if index >= 0 && index < imageNames.count {
            currentIndex = index
            imageView.image = UIImage(named: imageNames[currentIndex])
        }
    }

    // Function to move to the next image
    func moveToNextImage() {
        let nextIndex = (currentIndex + 1) % imageNames.count
        updateImage(index: nextIndex)
    }

    }

