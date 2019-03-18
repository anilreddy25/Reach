

import Foundation

internal func Init<T>( _ object: T, block: (T) throws -> ()) rethrows -> T{
    try block(object)
    return object
}
