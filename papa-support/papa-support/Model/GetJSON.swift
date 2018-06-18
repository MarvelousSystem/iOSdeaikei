import Foundation

class GetJSON {
    static func getJSON(url: String) -> NSDictionary! {
        // 返却用変数
        var json: NSDictionary!
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
                        let jsonNSDictionary: NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                        json = jsonNSDictionary
                    }
                    catch { /* error */}
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
        
        return(json)
    }
}
