//
//  ListMusicViewController.swift
//  MyMusic
//
//  Created by Dan on 6/3/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class ListMusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var libary = MusicModels().library
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ListMusicTableViewCell", bundle: nil), forCellReuseIdentifier: "ListMusicTableViewCell")
        // Do any additional setup after loading the view.
    }
    
}
extension ListMusicViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListMusicTableViewCell", for: indexPath) as? ListMusicTableViewCell
        cell?.nameSong.text = libary[indexPath.row]["song"]
        cell?.singer.text = libary[indexPath.row]["singer"]
        
        if let imageMusic = libary[indexPath.row]["image"] {
            cell?.img.image = UIImage(named: "\(imageMusic).jpg")
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlayerMusicViewController") as? PlayerMusicViewController
        
        let indexPath = tableView.indexPathForSelectedRow!
        photoVC?.id = indexPath.row
        self.navigationController?.pushViewController(photoVC!, animated: true)
    }
    
}
