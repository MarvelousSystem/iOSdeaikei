




import Foundation

class LoginModel {
    static func sendLoginInformationToServer(url: String) -> Data! {
        // 返却用変数
        var resultData: Data!
        let condition = NSCondition()
        //urlをエンコーディングして無効なURLが入ったら処理を抜ける
        guard let requestUrl = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else {
            print("無効なURL")
            return(nil)
        }
        let convertedUrl: URL = URL(string: requestUrl)!
        //JSONデータを取得する
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: convertedUrl as URL)
        //実行
        let task = session.dataTask(with: request as URLRequest, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                if (data != nil) {
                    do {
                        resultData = data
                        if (resultData != nil) {print("resultDataの取得に成功しました")}
                        else {print("resultDataの取得に失敗しました")}
                    }
                }
                condition.signal()
                condition.unlock()
            }
            else {print("errorが発生しました")}
        })
        condition.lock()
        task.resume()
        condition.wait()
        condition.unlock()
        
        return(resultData)
    }
}
