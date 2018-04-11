// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class CategorySalesFor1997: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var categoryName: Property = NorthwindEntitiesMetadata.EntityTypes.categorySalesFor1997.property(withName: "CategoryName")

    public static var categorySales: Property = NorthwindEntitiesMetadata.EntityTypes.categorySalesFor1997.property(withName: "CategorySales")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.categorySalesFor1997)
    }

    open class func array(from: EntityValueList) -> Array<CategorySalesFor1997> {
        return ArrayConverter.convert(from.toArray(), Array<CategorySalesFor1997>())
    }

    open var categoryName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: CategorySalesFor1997.categoryName))
        }
        set(value) {
            self.setOptionalValue(for: CategorySalesFor1997.categoryName, to: StringValue.of(optional: value))
        }
    }

    open var categorySales: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: CategorySalesFor1997.categorySales))
        }
        set(value) {
            self.setOptionalValue(for: CategorySalesFor1997.categorySales, to: DecimalValue.of(optional: value))
        }
    }

    open func copy() -> CategorySalesFor1997 {
        return CastRequired<CategorySalesFor1997>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(categoryName: String?) -> EntityKey {
        return EntityKey().with(name: "CategoryName", value: StringValue.of(optional: categoryName))
    }

    open var old: CategorySalesFor1997 {
        return CastRequired<CategorySalesFor1997>.from(self.oldEntity)
    }
}
