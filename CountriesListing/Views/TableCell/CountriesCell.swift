import UIKit

class CountriesCell: UITableViewCell {

    //MARK: variables & outlets
    @IBOutlet weak var lblCountryTitle:     UILabel!
    @IBOutlet weak var imgCountryFlag:      UIImageView!
    @IBOutlet weak var btnCountryDetails:   UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(item:CountryListModel) {
        self.lblCountryTitle.text = item.countryName
        self.imgCountryFlag.image = item.countryFlag
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
