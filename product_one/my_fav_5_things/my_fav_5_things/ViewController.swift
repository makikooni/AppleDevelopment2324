import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var onea: UIScrollView!
    @IBOutlet weak var sass: UIImageView!
    @IBOutlet weak var saas2: UIImageView!
    @IBOutlet weak var saas3: UIImageView!
    @IBOutlet weak var saas4: UIImageView!
    @IBOutlet weak var saas5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageNames = ["cats", "cig", "fashion", "internet", "tea"]
        
        for (index, imageView) in [sass, saas2, saas3, saas4, saas5].enumerated() {
            if let image = UIImage(named: imageNames[index]) {
                imageView?.image = image
                imageView?.frame = CGRect(x: onea.frame.size.width * CGFloat(index), y: 0, width: onea.frame.size.width, height: onea.frame.size.height)
            }
        }
        
        onea.isPagingEnabled = true
        onea.contentSize = CGSize(width: onea.frame.size.width * CGFloat(imageNames.count), height: onea.frame.size.height)
    }
}
