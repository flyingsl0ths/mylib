public typealias Comparator<T> = (T, T) -> Bool

private func merge<T>(_ left: [T], _ right: [T], _ comparator: Comparator<T>) -> [T] {
    let leftSize = left.count
    let rightSize = right.count

    var result: [T] = []
    result.reserveCapacity(leftSize + rightSize)

    var i = 0
    var j = 0

    while i < leftSize && j < rightSize {
        if comparator(left[i], right[j]) {
            result.append(left[i])
            i += 1
        } else {
            result.append(right[j])
            j += 1
        }
    }

    while i < leftSize {
        result.append(left[i])
        i += 1
    }

    while j < rightSize {
        result.append(right[j])
        j += 1
    }

    return result
}

public func mergeSort<T>(
    _ array: [T], _ comparator: Comparator<T>
) -> [T] {
    let total = array.count

    if total <= 1 {
        return array
    }

    let middle = total / 2

    let left = Array(array[0..<middle])
    let right = Array(array[middle..<total])

    return merge(
        mergeSort(left, comparator), mergeSort(right, comparator),
        comparator)
}
