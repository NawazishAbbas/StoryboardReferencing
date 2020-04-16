import UIKit

class CountryDetailController: UIViewController {

    //MARK: variables & outlets
    var countryName = ""
    var countryFlag = #imageLiteral(resourceName: "us")

    @IBOutlet weak var lblSelectedCountry: UILabel!
    @IBOutlet weak var imgSelectedCountry: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblSelectedCountry.text = self.countryName // set selected country name
        self.imgSelectedCountry.image = self.countryFlag // set selected country flag
    }

}
