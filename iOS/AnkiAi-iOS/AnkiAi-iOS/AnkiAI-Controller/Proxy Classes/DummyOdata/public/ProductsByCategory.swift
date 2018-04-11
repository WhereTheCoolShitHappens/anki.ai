// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class ProductsByCategory: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var categoryName: Property = NorthwindEntitiesMetadata.EntityTypes.productsByCategory.property(withName: "CategoryName")

    public static var productName: Property = NorthwindEntitiesMetadata.EntityTypes.productsByCategory.property(withName: "ProductName")

    public static var quantityPerUnit: Property = NorthwindEntitiesMetadata.EntityTypes.productsByCategory.property(withName: "QuantityPerUnit")

    public static var unitsInStock: Property = NorthwindEntitiesMetadata.EntityTypes.productsByCategory.property(withName: "UnitsInStock")

    public static var discontinued: Property = NorthwindEntitiesMetadata.EntityTypes.productsByCategory.property(withName: "Discontinued")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.productsByCategory)
    }

    open class func array(from: EntityValueList) -> Array<ProductsByCategory> {
        return ArrayConverter.convert(from.toArray(), Array<ProductsByCategory>())
    }

    open var categoryName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProductsByCategory.categoryName))
        }
        set(value) {
            self.setOptionalValue(for: ProductsByCategory.categoryName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> ProductsByCategory {
        return CastRequired<ProductsByCategory>.from(self.copyEntity())
    }

    open var discontinued: Bool? {
        get {
            return BooleanValue.optional(self.optionalValue(for: ProductsByCategory.discontinued))
        }
        set(value) {
            self.setOptionalValue(for: ProductsByCategory.discontinued, to: BooleanValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(categoryName: String?, discontinued: Bool?, productName: String?) -> EntityKey {
        return EntityKey().with(name: "CategoryName", value: StringValue.of(optional: categoryName)).with(name: "Discontinued", value: BooleanValue.of(optional: discontinued)).with(name: "ProductName", value: StringValue.of(optional: productName))
    }

    open var old: ProductsByCategory {
        return CastRequired<ProductsByCategory>.from(self.oldEntity)
    }

    open var productName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProductsByCategory.productName))
        }
        set(value) {
            self.setOptionalValue(for: ProductsByCategory.productName, to: StringValue.of(optional: value))
        }
    }

    open var quantityPerUnit: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProductsByCategory.quantityPerUnit))
        }
        set(value) {
            self.setOptionalValue(for: ProductsByCategory.quantityPerUnit, to: StringValue.of(optional: value))
        }
    }

    open var unitsInStock: Int? {
        get {
            return ShortValue.optional(self.optionalValue(for: ProductsByCategory.unitsInStock))
        }
        set(value) {
            self.setOptionalValue(for: ProductsByCategory.unitsInStock, to: ShortValue.of(optional: value))
        }
    }
}
