//
//  RickandMortyViewModel.swift
//  SnapKit MVVM RickAndMorty
//
//  Created by Kaan Yalçınkaya on 5.09.2022.
//

import Foundation

protocol IRickandMortyViewModel {
    func fetchItems()
    func changeLoading()
    
    var rickandMortyCharacters: [Result] { get set }
    var rickandMortyService: IRickandMortyService { get }
    
    var rickandMortyOutPut: RickandMortyOutPut? { get }
    
    func setDelegate(outPut: RickandMortyOutPut)
}


final class RickandMortyViewModel: IRickandMortyViewModel {
    var rickandMortyOutPut: RickandMortyOutPut?
    
    func setDelegate(outPut: RickandMortyOutPut) {
        rickandMortyOutPut = outPut
    }
    
    
    var rickandMortyCharacters: [Result] = []
    private var isLoading = false
    var rickandMortyService: IRickandMortyService
    
    init() {
        rickandMortyService = RickandMortyService()
    }

    
func fetchItems() {
    changeLoading()
    rickandMortyService.fetchAllDatas { [weak self]response in
        self?.changeLoading()
        self?.rickandMortyCharacters = response ?? []
        self?.rickandMortyOutPut?.saveDatas(values: self?.rickandMortyCharacters ?? [])
    }
}

func changeLoading() {
    isLoading = !isLoading
    rickandMortyOutPut?.changeLoading(isLoading: isLoading)
}


}
