//
//  RickandMortyService.swift
//  SnapKit MVVM RickAndMorty
//
//  Created by Kaan Yalçınkaya on 2.09.2022.
//

import Alamofire

enum RickandMortyServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api/"
    case PATH = "/character"
    
    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}


protocol IRickandMortyService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void)
}

struct RickandMortyService: IRickandMortyService  {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void) {
        AF.request(RickandMortyServiceEndPoint.characterPath()).responseDecodable(of: PostModel.self) {
            (model) in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }
}
