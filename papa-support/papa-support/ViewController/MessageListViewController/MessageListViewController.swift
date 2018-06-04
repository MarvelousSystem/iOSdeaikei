//  Created by Miyamoto on 2018/05/21.
//  Copyright © 2018年 MiyamotoSota. All rights reserved.
//

import UIKit

class MessageListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem!.title = "メッセージ"
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.topItem!.title = " "
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
