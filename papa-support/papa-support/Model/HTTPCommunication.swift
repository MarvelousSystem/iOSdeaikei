
import Foundation

class HTTPCommunication {
    
    static func post(postContent: [String: AnyObject], url: String){
        
        // create the url request
        let urlString = url
        let request = NSMutableURLRequest(url: NSURL(string: urlString)! as URL)
        
        // set the method(HTTP-POST)
        request.httpMethod = "POST"
        
        // set the header
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // set the request body (JSON)
        let data = postContent
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: data, options: [])
        } catch (let error) {
            print(error)
        }
        
        // use URLSessionDataTask
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
            if (error == nil) {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    let top = json as! NSArray
                    print(top)
                } catch {
                    print(error)
                }
                
            } else {
                print(error as Any)
            }
        })
        task.resume()
    }
    
    static func get(getContent: String, url: String) {
        
        // create url
        let generatedUrl: String = url + "?" + getContent
        
        // create the url request
        let request = NSMutableURLRequest(url: NSURL(string: generatedUrl)! as URL)
        
        // set the method(HTTP-GET)
        request.httpMethod = "GET"
        
        // use URLSessionDataTask
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {data, response, error in
            if (error == nil) {
                // JSONをパース
                let result = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
                print(result)
            } else {
                print(error as Any)
            }
        })
        task.resume()
    }
}
