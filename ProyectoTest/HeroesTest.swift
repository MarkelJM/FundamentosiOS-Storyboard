//
//  HeroesTest.swift
//  probandoKC-13-12Tests
//
//  Created by Markel Juaristi on 21/12/22.
//

import XCTest
@testable import probandoKC_13_12

final class HeroesTest: XCTestCase {
    var heroe: Heroe!
    override func setUp(){
        super.setUp()
        heroe = Heroe(id: "4",
                      name: "Goku",
                      photo: "https//www.keepcoding.io",
                      description: "Goku always win",
                      favorite: false)
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHeroeId(){
        XCTAssertNotNil(heroe.id)
        XCTAssertEqual(heroe.id, "4")
        XCTAssertNotNil(heroe.id, "7")
    }
    
    func testHeroeName(){
        XCTAssertNotNil(heroe.name)
        XCTAssertEqual(heroe.name, "Goku")
        XCTAssertNotNil(heroe.name, "Vegeta")
    }
    func testHeroePhoto(){
        let url = URL(string: heroe.photo)
        
        XCTAssertNotNil(heroe.photo)
        XCTAssertEqual(heroe.photo, "https//www.keepcoding.io")
        XCTAssertNotNil(heroe.photo, "https//www.keepcodingError.io")
        
        XCTAssertNotNil(url?.absoluteURL)
    }
    func testHeroeDescription(){
        XCTAssertNotNil(heroe.description)
        XCTAssertEqual(heroe.description, "Goku always win")
        XCTAssertNotNil(heroe.description, "Goku never win")
    }
    
    func testHeroeFavorite(){
        XCTAssertNotNil(heroe.favorite)
        XCTAssertEqual(heroe.favorite, false)
        XCTAssertNotEqual(heroe.favorite, true)
    }
}
    
