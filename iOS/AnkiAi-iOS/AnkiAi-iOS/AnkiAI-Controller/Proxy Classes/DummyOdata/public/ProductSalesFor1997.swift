// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class ProductSalesFor1997: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var categoryName: Property = NorthwindEntitiesMetadata.EntityTypes.productSalesFor1997.property(withName: "CategoryName")

    public static var productName: Property = NorthwindEntitiesMetadata.EntityTypes.productSalesFor1997.property(withName: "ProductName")

    public static var productSales: Property = NorthwindEntitiesMetadata.EntityTypes.productSalesFor1997.property(withName: "ProductSales")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.productSalesFor1997)
    }

    open class func array(from: EntityValueList) -> Array<ProductSalesFor1997> {
        return ArrayConverter.convert(from.toArray(), Array<ProductSalesFor1997>())
    }

    open var categoryName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProductSalesFor1997.categoryName))
        }
        set(value) {
            self.setOptionalValue(for: ProductSalesFor1997.categoryName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> ProductSalesFor1997 {
        return CastRequired<ProductSalesFor1997>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(categoryName: String?, productName: String?) -> EntityKey {
        return EntityKey().with(name: "CategoryName", value: StringValue.of(optional: categoryName)).with(name: "ProductName", value: StringValue.of(optional: productName))
    }

    open var old: ProductSalesFor1997 {
        return CastRequired<ProductSalesFor1997>.from(self.oldEntity)
    }

    open var productName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProductSalesFor1997.productName))
        }
        set(value) {
            self.setOptionalValue(for: ProductSalesFor1997.productName, to: StringValue.of(optional: value))
        }
    }

    open var productSales: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: ProductSalesFor1997.productSales))
        }
        set(value) {
            self.setOptionalValue(for: ProductSalesFor1997.productSales, to: DecimalValue.of(optional: value))
        }
    }
}
