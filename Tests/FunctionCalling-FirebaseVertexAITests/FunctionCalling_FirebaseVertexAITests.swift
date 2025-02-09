import XCTest
@testable import FunctionCalling_FirebaseVertexAI
import FunctionCalling

// swiftlint:disable:next type_name
final class FunctionCalling_FirebaseVertexAITests: XCTestCase {
    @FunctionCalling(service: .claude)
        struct FunctionContainer {
            /// Return current weather of location that passed by the argument
            /// - Parameter location: location that I want to know how the weather
            /// - Returns: string of weather
            @CallableFunction
            func getWeather(location: String) -> String {
                return "Sunny"
            }

            @CallableFunction
            func getStock(args: String) -> Int {
                return 0
            }
        }

        func testConvertedResults() throws {
            guard let functions = FunctionContainer().firebaseVertexAITools.first?.functions else {
                XCTFail("Conainer should contain some functions")
                return
            }

            XCTAssertEqual(functions.count, 2)

            let getWeather = try XCTUnwrap(functions.first)
            XCTAssertEqual(getWeather.getName(), "getWeather")
            // swiftlint:disable:next line_length
            XCTAssertEqual(getWeather.getDescription(), "Return current weather of location that passed by the argument- Parameter location: location that I want to know how the weather- Returns: string of weather")

            let getStock = try XCTUnwrap(functions.last)
            XCTAssertEqual(getStock.getName(), "getStock")
            XCTAssertEqual(getStock.getDescription(), "")
        }
}
