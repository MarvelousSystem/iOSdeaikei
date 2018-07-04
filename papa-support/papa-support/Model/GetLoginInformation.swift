


import Foundation

class GetLoginInformation {
    
    static func get(url: String) -> (Bool){
        let jsonData: NSDictionary! = GetJSON.getJSON(url: url)
        if (jsonData == nil) {
            print("Dataを取得できませんでした")
            return false
        } else {
           // result
            let result: String = jsonData.object(forKey: "result") as! String
            if (result == "NG") {
                print("result: \(result)")
                return false
            } else if (result == "OK") {
                let memberInfo: NSDictionary! = jsonData.object(forKey: "member_info") as? NSDictionary
                //setObject(object: memberInfo)
                UserInformation.memberInfo = memberInfo
                return true
            } else {
                print("何らかエラーが発生しました")
                return false
            }
        }
    }
    
    static func setObject(object: NSDictionary!) {
        let varsArray = object.allKeys // Keys of NSDictionary
        //var valuesArray: [Any?] = [] // Values of NSDictionary
        // Get and Save Values
        for key in varsArray {
            let value: Any? = object.object(forKey: key)
            print(value)
            //valuesArray.append(value)
            UserDefaults.standard.set(value, forKey: key as! String) // <- Save
        }
        print("valueを保存しました")
    }
}
