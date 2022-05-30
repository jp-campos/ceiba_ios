//
//  MainViewController.swift
//  ceiba_ios
//
//  Created by juan.p.campos.duran on 28/05/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var users: [User]?
    var displayedUsers: [User] = []
    var scrollView: UIScrollView!
    
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var cardsContainer: UIView!
    @IBAction func textFieldEditChange(_ sender: UITextField) {
        
        let normalizedSearch = sender.text!.uppercased()
        displayedUsers = users!.filter { user in
            return user.name.uppercased().starts(with: normalizedSearch)}
        addCardsToView(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Task{
            users = await  UserApi().getUsers()
            displayedUsers = users ?? []
            //addCardsToView(self)
            addCardsToView(self)
        }
        // Do any additional setup after loading the view.
    }
    
        
    func addCard(){

        let btn = UIButton(frame: CGRect(x: 20, y: 20, width: 20, height: 20 ))
        btn.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        btn.backgroundColor = .red
        let label = UILabel()
        label.text = "boton"
        btn.addSubview(label)
        
        let sv = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        
        cardsContainer.addSubview(btn)
    }
    
    @objc func buttonClicked() {
        print("Button Clicked")
    }

    func addCardsToView(_ vc: UIViewController)  {
        
        
        if scrollView == nil{
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))

        }else{
            scrollView.subviews.forEach({ $0.removeFromSuperview() })
        }
        
        let scrollHeight = 200.0 * Double(displayedUsers.count)
        scrollView.contentSize = CGSize(width: view.frame.width, height: scrollHeight)
        
        var offset = 0.0
        
        for user in displayedUsers{
            let tuple = getCard(offset: offset, user: user)
            let card = tuple.0
            offset = tuple.1
            scrollView.addSubview(card)
        }
        
        cardsContainer.addSubview(scrollView)
        
        view.bringSubviewToFront(cardsContainer)
        
    }
    
    
    func getCard(offset: Double, user: User)-> (UIView, Double){
        let card = UserCard(nibName: "UserCard", bundle:nil)
        card.user = user
        card.onPostsTap = { user in
            print(user)
        }
        
    
        
        let botMargin = 20.0
        
        let cardContainer = UIView(frame: CGRect(x: 0, y: offset, width: cardsContainer.frame.width - 3.0, height: card.view.frame.height ))
        cardContainer.backgroundColor = .white
        cardContainer.layer.borderColor = UIColor.lightGray.cgColor
        cardContainer.layer.borderWidth = 1
        cardContainer.layer.cornerRadius = 4
        
        cardContainer.addSubview(card.view)
        cardContainer.bringSubviewToFront(card.view)
        cardContainer.isUserInteractionEnabled = false
        let newOffset =  offset + card.view.frame.height + botMargin
        self.addChild(card)
        return (cardContainer,newOffset)
    }
    
    
}
