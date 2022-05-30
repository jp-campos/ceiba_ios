//
//  UserCard.swift
//  ceiba_ios
//
//  Created by juan.p.campos.duran on 28/05/22.
//

import UIKit

class UserCard: UIViewController {
    
    var user: User!
    var onPostsTap: ((User) -> Void)!
    
  
  
    
    @IBOutlet weak var postsBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user.name
        phoneLabel.text = user.phone
        mailLabel.text = user.email
        postsBtn.translatesAutoresizingMaskIntoConstraints = false
        postsBtn.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked() {
        print("Button Clicked")
    }

    @IBAction func onPostsTapped(_ sender: Any) {
        print("TAPPED")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
