


import Foundation

class GetCSRF {
    static func getCSRF() -> (String) {
        let tempUrl: String = "https://papa.support/api/v1/csrf/"
        let csrfNSDictionary: NSDictionary! = GetJSON.getJSON(url: tempUrl)
        let result: String = csrfNSDictionary.object(forKey: "result") as! String
        let csrf: String = csrfNSDictionary.object(forKey: "csrf") as! String
        if (result == "OK") {return csrf}
        else {return "error"}
    }
}
