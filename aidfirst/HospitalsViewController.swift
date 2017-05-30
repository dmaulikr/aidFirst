//  AidFirst
//
//  Created by Arminas on 29/05/2017.
//  Copyright © 2017 Arminas. All rights reserved.
//

import CoreLocation
import UIKit

class HospitalsViewController: UIViewController, CLLocationManagerDelegate {

    var latitude: String?
    var longitude: String?
    var locationManager: CLLocationManager = CLLocationManager()
    let dataManager = DataManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latestLocation: CLLocation = locations[locations.count - 1]
        
        latitude = String(format: "%.4f", latestLocation.coordinate.latitude)
        longitude = String(format: "%.4f", latestLocation.coordinate.longitude)
        
        let parameters:[String:String] = [latitude!:longitude!]
        
        print("\(latitude!) , \(longitude!)")
        let task = dataManager.sendHospitalRequest(url: dataManager.url, parameters: parameters, completionHandler: dataManager.completionHandler)
        task.resume()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

