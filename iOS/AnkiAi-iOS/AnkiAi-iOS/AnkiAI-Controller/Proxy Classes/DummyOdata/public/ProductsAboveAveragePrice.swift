// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class ProductsAboveAveragePrice: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var productName: Property = NorthwindEntitiesMetadata.EntityTypes.productsAboveAveragePrice.property(withName: "ProductName")

    public static var unitPrice: Property = NorthwindEntitiesMetadata.EntityTypes.productsAboveAveragePrice.property(withName: "UnitPrice")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.productsAboveAveragePrice)
    }

    open class func array(from: EntityValueList) -> Array<ProductsAboveAveragePrice> {
        return ArrayConverter.convert(from.toArray(), Array<ProductsAboveAveragePrice>())
    }

    open func copy() -> ProductsAboveAveragePrice {
        return CastRequired<ProductsAboveAveragePrice>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(productName: String?) -> EntityKey {
        return EntityKey().with(name: "ProductName", value: StringValue.of(optional: productName))
    }

    open var old: ProductsAboveAveragePrice {
        return CastRequired<ProductsAboveAveragePrice>.from(self.oldEntity)
    }

    open var productName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: ProductsAboveAveragePrice.productName))
        }
        set(value) {
            self.setOptionalValue(for: ProductsAboveAveragePrice.productName, to: StringValue.of(optional: value))
        }
    }

    open var unitPrice: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: ProductsAboveAveragePrice.unitPrice))
        }
        set(value) {
            self.setOptionalValue(for: ProductsAboveAveragePrice.unitPrice, to: DecimalValue.of(optional: value))
        }
    }
}
