// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class OrderDetailsExtended: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var orderID: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "OrderID")

    public static var productID: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "ProductID")

    public static var productName: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "ProductName")

    public static var unitPrice: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "UnitPrice")

    public static var quantity: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "Quantity")

    public static var discount: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "Discount")

    public static var extendedPrice: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "ExtendedPrice")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended)
    }

    open class func array(from: EntityValueList) -> Array<OrderDetailsExtended> {
        return ArrayConverter.convert(from.toArray(), Array<OrderDetailsExtended>())
    }

    open func copy() -> OrderDetailsExtended {
        return CastRequired<OrderDetailsExtended>.from(self.copyEntity())
    }

    open var discount: Float? {
        get {
            return FloatValue.optional(self.optionalValue(for: OrderDetailsExtended.discount))
        }
        set(value) {
            self.setOptionalValue(for: OrderDetailsExtended.discount, to: FloatValue.of(optional: value))
        }
    }

    open var extendedPrice: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: OrderDetailsExtended.extendedPrice))
        }
        set(value) {
            self.setOptionalValue(for: OrderDetailsExtended.extendedPrice, to: DecimalValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(discount: Float?, orderID: Int?, productID: Int?, productName: String?, quantity: Int?, unitPrice: BigDecimal?) -> EntityKey {
        return EntityKey().with(name: "Discount", value: FloatValue.of(optional: discount)).with(name: "OrderID", value: IntValue.of(optional: orderID)).with(name: "ProductID", value: IntValue.of(optional: productID)).with(name: "ProductName", value: StringValue.of(optional: productName)).with(name: "Quantity", value: ShortValue.of(optional: quantity)).with(name: "UnitPrice", value: DecimalValue.of(optional: unitPrice))
    }

    open var old: OrderDetailsExtended {
        return CastRequired<OrderDetailsExtended>.from(self.oldEntity)
    }

    open var orderID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: OrderDetailsExtended.orderID))
        }
        set(value) {
            self.setOptionalValue(for: OrderDetailsExtended.orderID, to: IntValue.of(optional: value))
        }
    }

    open var productID: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: OrderDetailsExtended.productID))
        }
        set(value) {
            self.setOptionalValue(for: OrderDetailsExtended.productID, to: IntValue.of(optional: value))
        }
    }

    open var productName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: OrderDetailsExtended.productName))
        }
        set(value) {
            self.setOptionalValue(for: OrderDetailsExtended.productName, to: StringValue.of(optional: value))
        }
    }

    open var quantity: Int? {
        get {
            return ShortValue.optional(self.optionalValue(for: OrderDetailsExtended.quantity))
        }
        set(value) {
            self.setOptionalValue(for: OrderDetailsExtended.quantity, to: ShortValue.of(optional: value))
        }
    }

    open var unitPrice: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: OrderDetailsExtended.unitPrice))
        }
        set(value) {
            self.setOptionalValue(for: OrderDetailsExtended.unitPrice, to: DecimalValue.of(optional: value))
        }
    }
}
