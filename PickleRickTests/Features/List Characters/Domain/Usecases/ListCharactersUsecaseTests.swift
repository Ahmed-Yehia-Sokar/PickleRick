//
//  ListCharactersUsecaseTests.swift
//  ListCharactersUsecaseTests
//
//  Created by Admin on 14/08/2024.
//

import XCTest
@testable import PickleRick

final class ListCharactersUsecaseTests: XCTestCase {
    private var mockServices: MockRMCharactersServices!
    private var listCharactersUsecase: ListCharactersUsecase!
    
    override func setUpWithError() throws {
        mockServices = MockRMCharactersServices()
        listCharactersUsecase = ListCharactersUsecase(rmCharactersServices: mockServices)
    }

    override func tearDownWithError() throws {
        mockServices = nil
        listCharactersUsecase = nil
    }
    
    func testFetchRMCharacters_Success() {
        // Arrange
        mockServices.shouldSucceed = true
        mockServices.charactersToReturn = [RMCharacter.example]
        
        // Act
        listCharactersUsecase.fetchRMCharacters(pageNumber: 1,
                                                status: "") { characters in
            // Assert
            XCTAssertEqual(characters.count, 1)
            XCTAssertEqual(characters[0], RMCharacter.example)
        } errorHandler: { error in
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testFetchRMCharacters_Failure() {
        // Arrange
        mockServices.shouldSucceed = false
        mockServices.errorToReturn = "Network error"
                
        // Act
        listCharactersUsecase.fetchRMCharacters(pageNumber: 1,
                                                status: "") { characters in
            XCTFail("Unexpected success")
        } errorHandler: { error in
            // Assert
            XCTAssertEqual(error, "Network error")
        }
    }
}
