//
//  TransformationTest.swift
//  probandoKC-13-12Tests
//
//  Created by Markel Juaristi on 21/12/22.
//

import XCTest


final class TransformationTest: XCTestCase {
    
    var transformation: Transformation!

    override func setUp()  {
        super.setUp()
        
        transformation = Transformation(id: "22", name: "Super saiyan", photo: "https://www.keepcoding.io", description: "This is the real one!")
    }

    override func tearDown()  {
    }
    
    func testTransformationId(){
        XCTAssertNotNil(transformation.id)
        XCTAssertEqual(transformation.id, "22")
        XCTAssertNotEqual(transformation.id, "27")
    }
    
    func testTranformationName(){
        XCTAssertNotNil(transformation.name)
        XCTAssertEqual(transformation.name, "Super saiyan")
        XCTAssertNotEqual(transformation.name, "saiyan")
    }
    func testTransformationPhoto(){
        let url = URL(string: transformation.photo)
        
        XCTAssertNotNil(transformation.photo)
        XCTAssertEqual(transformation.photo, "https://www.keepcoding.io")
        XCTAssertNotEqual(transformation.photo, "https//www.keepcodingError.io")
        
        XCTAssertNotNil(url?.absoluteURL)
    }
    func testTransformationDescription(){
        XCTAssertNotNil(transformation.description)
        XCTAssertEqual(transformation.description, "This is the real one!")
        XCTAssertNotEqual(transformation.description, "Goku never win")
    }
}
