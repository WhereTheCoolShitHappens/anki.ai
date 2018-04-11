// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class SalesByCategory: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var categoryID: Property = NorthwindEntitiesMetadata.EntityTypes.salesByCategory.property(withName: "CategoryID")

    public static var categoryName: Property = NorthwindEntitiesMetadata.EntityTypes.salesByCategory.property(withName: "CategoryName")

    public static var productName: Property = NorthwindEntitiesMetadata.EntityTypes.salesByCategory.property(withName: "ProductName")

    public static var productSales: Property = NorthwindEntitiesMetadata.EntityTypes.salesByCategory.property(withName: "ProductSales")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.salesByCategory)
    }

    open class func array(from: EntityValueList) -> Array<SalesByCategory> {
        return ArrayConverter.convert(from.toArray(), Array<SalesByCategory>())
    }

    open var categoryID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: SalesByCategory.categoryID))
        }
        set(value) {
            self.setOptionalValue(for: SalesByCategory.categoryID, to: IntValue.of(optional: value))
        }
    }

    open var categoryName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesByCategory.categoryName))
        }
        set(value) {
            self.setOptionalValue(for: SalesByCategory.categoryName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> SalesByCategory {
        return CastRequired<SalesByCategory>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(categoryID: Int?, categoryName: String?, productName: String?) -> EntityKey {
        return EntityKey().with(name: "CategoryID", value: IntValue.of(optional: categoryID)).with(name: "CategoryName", value: StringValue.of(optional: categoryName)).with(name: "ProductName", value: StringValue.of(optional: productName))
    }

    open var old: SalesByCategory {
        return CastRequired<SalesByCategory>.from(self.oldEntity)
    }

    open var productName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesByCategory.productName))
        }
        set(value) {
            self.setOptionalValue(for: SalesByCategory.productName, to: StringValue.of(optional: value))
        }
    }

    open var productSales: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesByCategory.productSales))
        }
        set(value) {
            self.setOptionalValue(for: SalesByCategory.productSales, to: DecimalValue.of(optional: value))
        }
    }
}
