


// MARK: vars and lifecycle
class GetPersonDataFromId {
    
    var id: String!
    var personDataStruct: PersonDataStruct! = PersonDataStruct()

    init (id: String!) {
        self.id = id
    }
    
    func getData() ->PersonDataStruct {
        personDataStruct.comment = "エラーが発生しました！！"
        personDataStruct.livingArea = "東京都"
        personDataStruct.age = "??"
        return self.personDataStruct
    }
}
