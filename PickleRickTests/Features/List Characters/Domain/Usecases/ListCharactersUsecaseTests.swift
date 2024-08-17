//
//  ListCharactersUsecaseTests.swift
//  ListCharactersUsecaseTests
//
//  Created by Admin on 14/08/2024.
//

import XCTest
@testable import PickleRick

final class ListCharactersUsecaseTests: XCTestCase {
    private var mockService: MockRMCharactersServices?
    
    override func setUpWithError() throws {
        mockService = MockRMCharactersServices()
    }

    override func tearDownWithError() throws {
        mockService = nil
    }
    
    func testFetchRMCharacters_Success() {
        // Arrange
        guard let mockService = mockService else {
            XCTFail("mock service instance is nil")
            return
        }
        mockService.shouldSucceed = true
        mockService.charactersToReturn = [RMCharacter.example]
        
        let listCharactersUsecase = ListCharactersUsecase(rmCharactersServices: mockService)

        // Act
        listCharactersUsecase.fetchRMCharacters(pageNumber: 1,
                                                status: "alive") { characters in
            // Assert
            XCTAssertEqual(characters.count, 1)
            XCTAssertEqual(characters[0], RMCharacter.example)
        } errorHandler: { error in
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testFetchRMCharacters_Error() {
        // Arrange
        guard let mockService = mockService else {
            XCTFail("mock service instance is nil")
            return
        }
        mockService.shouldSucceed = false
        mockService.errorToReturn = "Network error"
        
        let listCharactersUsecase = ListCharactersUsecase(rmCharactersServices: mockService)
                
        // Act
        listCharactersUsecase.fetchRMCharacters(pageNumber: 1,
                                                status: "alive") { characters in
            XCTFail("Unexpected success")
        } errorHandler: { error in
            // Assert
            XCTAssertEqual(error, "Network error")
        }
    }
}
