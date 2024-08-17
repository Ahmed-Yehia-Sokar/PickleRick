//
//  RMCharactersServicesTests.swift
//  PickleRickTests
//
//  Created by Admin on 17/08/2024.
//

import XCTest
@testable import PickleRick

final class RMCharactersServicesTests: XCTestCase {
    private var mockApiClient: MockApiClient!
    private var rmCharactersServices: RMCharactersServices!
    
    override func setUpWithError() throws {
        mockApiClient = MockApiClient()
        rmCharactersServices = RMCharactersServices(apiClient: mockApiClient)
    }
    
    override func tearDownWithError() throws {
        mockApiClient = nil
        rmCharactersServices = nil
    }
    
    func testFetchRMCharacters_Success() {
        // Arrange
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "rm_characters_response", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let mockResponse = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            XCTFail("Failed to load mock response from JSON file")
            return
        }
        let expectedCharacters = RMCharacterDataMapper.map(fetchRMCharactersResponse: mockResponse)

        // Act
        rmCharactersServices.fetchRMCharacters(pageNumber: 1,
                                               status: "",
                                               completionHandler: { characters in
            // Assert
            XCTAssertEqual(characters, expectedCharacters)
        }, errorHandler: { error in
            XCTFail("Unexpected error: \(error)")
        })
        
        // Assert
        XCTAssertTrue(mockApiClient.performRequestCalled)
        mockApiClient.performRequestSuccessHandler?(mockResponse)
    }

    func testFetchRMCharacters_Failure() {
        // Arrange
        let mockApiException = ApiException(statusCode: .noInternetConnection)
        let expectedError = "Check your internet connection"

        // Act
        rmCharactersServices.fetchRMCharacters(pageNumber: 1,
                                               status: "",
                                               completionHandler: { characters in
            XCTFail("Unexpected success")
        }, errorHandler: { error in
            // Assert
            XCTAssertEqual(error, expectedError)
        })

        // Assert
        XCTAssertTrue(mockApiClient.performRequestCalled)
        mockApiClient.performRequestErrorHandler?(mockApiException)
    }
}
