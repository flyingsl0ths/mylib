import Testing

@testable import MyLib

@Test func example() async throws {
    let data = (0..<1000).map { _ in
        Int.random(in: 0...1000)
    }

    #expect(mergeSort(data, { $0 <= $1 }) == data.sorted(), "List not sorted")
}
