// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class CurrentProductList: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var productID: Property = NorthwindEntitiesMetadata.EntityTypes.currentProductList.property(withName: "ProductID")

    public static var productName: Property = NorthwindEntitiesMetadata.EntityTypes.currentProductList.property(withName: "ProductName")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.currentProductList)
    }

    open class func array(from: EntityValueList) -> Array<CurrentProductList> {
        return ArrayConverter.convert(from.toArray(), Array<CurrentProductList>())
    }

    open func copy() -> CurrentProductList {
        return CastRequired<CurrentProductList>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(productID: Int?, productName: String?) -> EntityKey {
        return EntityKey().with(name: "ProductID", value: IntValue.of(optional: productID)).with(name: "ProductName", value: StringValue.of(optional: productName))
    }

    open var old: CurrentProductList {
        return CastRequired<CurrentProductList>.from(self.oldEntity)
    }

    open var productID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: CurrentProductList.productID))
        }
        set(value) {
            self.setOptionalValue(for: CurrentProductList.productID, to: IntValue.of(optional: value))
        }
    }

    open var productName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: CurrentProductList.productName))
        }
        set(value) {
            self.setOptionalValue(for: CurrentProductList.productName, to: StringValue.of(optional: value))
        }
    }
}
