import Testing

@testable import MyLib

@Test func example() async throws {
    let data = [1, 2, 2, 5, 6, 7, 7, 9, 9, 8, 9, -1, 11, 10]

    #expect(mergeSort(data) == data.sorted(), "List not sorted")
}
