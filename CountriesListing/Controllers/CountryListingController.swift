import UIKit

class CountryListingController: UIViewController {

    //MARK: variables & outlets
    @IBOutlet weak var tableView: UITableView!

    var countryModelArr:[CountryListModel] = [CountryListModel]()
    
    let countriesList = ["Saudia Arabia","Pakistan","Australia","USA","India"]
    let countriesFlags = [#imageLiteral(resourceName: "sa"),#imageLiteral(resourceName: "pk"),#imageLiteral(resourceName: "au"),#imageLiteral(resourceName: "us"),#imageLiteral(resourceName: "in")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0..<self.countriesList.count {
            let model:CountryListModel = CountryListModel()
            model.countryName = self.countriesList[index]
            model.countryFlag = self.countriesFlags[index]
            self.countryModelArr.append(model)
        }
    }
}

//MARK: Countries listing with names and flags
extension CountryListingController : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countryModelArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesCell", for: indexPath) as! CountriesCell

        cell.configureCell(item: self.countryModelArr[indexPath.row])

        cell.btnCountryDetails.tag = indexPath.row
        cell.btnCountryDetails.addTarget(self, action: #selector(detailsButtonTapped(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // show an alert with selected country name.
        let selectedCountry = self.countriesList[indexPath.row]
        Alert.shared.showMsg(title: "", msg: selectedCountry, btnActionTitle: "OK", controller: self)
    }
}

//MARK: @IBActions
extension CountryListingController {
    
    @IBAction func detailsButtonTapped(sender:UIButton) {
        // this will call te segue with mentioned identifier "CountryDetailController".
        self.performSegue(withIdentifier: "CountryDetailController", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "CountryDetailController" {
                if let button = sender as? UIButton {
                    // pass the values to the next targeted viewcontroller.
                    guard let targetController = segue.destination as? CountryDetailController else {return}
                    targetController.countryFlag = self.countryModelArr[button.tag].countryFlag
                    targetController.countryName = self.countryModelArr[button.tag].countryName
                }
            }
        }
    }
}
