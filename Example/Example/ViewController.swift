//Created  on 2019/3/12 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */



import Foundation
import UIKit
import CaamDauHUD

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.cd.hud(.text, title:"HUD")
    }
}



